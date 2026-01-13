#version 330 core
layout (location = 0) in vec3 position; // position变量的属性位置值为0
layout (location = 1) in vec3 color;
layout (location = 2) in vec2 texCoord;

out vec3 vertexColor; // 为片段着色器指定一个颜色输出
out vec2 TexCoord;
uniform mat4 transform;


void main(){
    gl_Position = transform * vec4(position, 1.0f);
    vertexColor = color; 
	TexCoord = vec2(texCoord.x, 1.0f - texCoord.y);
}

//问：这个旋转矩阵作用于gl_position，但是为什么纹理也会跟着被旋转？
//答：因为顶点被旋转了，UV（纹理坐标）是绑定到顶点并在片段间插值的，所以顶点位置旋转后纹理在屏幕上的映射也会随之旋转 —— 看起来纹理被旋转了。