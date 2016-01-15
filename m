Return-Path: <andrey.gusakov@cogentembedded.com>
MIME-Version: 1.0
In-Reply-To: <1452815059-22980-1-git-send-email-aduggan@synaptics.com>
References: <1452815059-22980-1-git-send-email-aduggan@synaptics.com>
Date: Fri, 15 Jan 2016 14:20:03 +0300
Message-ID: <CAFmnZc0FctH3t6q4-YSNe3X0x4QMtMVuh94md+ywibrj8uW9og@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] Input: synaptics-rmi4: Add device tree support
 for RMI4 I2C devices
From: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
Content-Type: multipart/alternative; boundary=001a113f6abcb2760205295d95c2
To: Andrew Duggan <aduggan@synaptics.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Christopher Heiny <cheiny@synaptics.com>, Stephen Chandler Paul <cpaul@redhat.com>, Vincent Huang <vincent.huang@tw.synaptics.com>, Chris Healy <cphealy@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--001a113f6abcb2760205295d95c2
Content-Type: text/plain; charset=UTF-8

Hi

On Fri, Jan 15, 2016 at 2:44 AM, Andrew Duggan <aduggan@synaptics.com>
wrote:

> Add devicetree binding for I2C devices and add bindings for optional
> parameters in the function drivers. Parameters for function drivers are
> defined in child nodes for each of the functions.
>
> Signed-off-by: Andrew Duggan <aduggan@synaptics.com>
>
...

>
> +#ifdef CONFIG_OF
> +static void rmi_function_of_probe(struct rmi_function *fn)
> +{
> +       char of_name[8];
> +
> +       snprintf(of_name, sizeof(of_name), "rmi4-f%02x",
> +               fn->fd.function_number);
> +       fn->dev.of_node = of_find_node_by_name(
> +                               fn->rmi_dev->xport->dev->of_node, of_name);
> +}
>
> Name like "rmi4-f11" including 0 terminator does not fit in 8 chars.
This leads to the inability to find the correct OF node and get settings.

--001a113f6abcb2760205295d95c2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi <br><div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Fri, Jan 15, 2016 at 2:44 AM, Andrew Duggan <span dir=3D"ltr=
">&lt;<a href=3D"mailto:aduggan@synaptics.com" target=3D"_blank">aduggan@sy=
naptics.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Add devicetree binding for I2C devices and add bindings for opt=
ional<br>
parameters in the function drivers. Parameters for function drivers are<br>
defined in child nodes for each of the functions.<br>
<br>
Signed-off-by: Andrew Duggan &lt;<a href=3D"mailto:aduggan@synaptics.com" t=
arget=3D"_blank">aduggan@synaptics.com</a>&gt;<br></blockquote><div>... <br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
+#ifdef CONFIG_OF<br>
+static void rmi_function_of_probe(struct rmi_function *fn)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char of_name[8];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(of_name, sizeof(of_name), &quot;rmi4-f=
%02x&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fn-&gt;fd.function_=
number);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fn-&gt;dev.of_node =3D of_find_node_by_name(<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fn-&gt;rmi_dev-&gt;xport-&gt;dev-&gt;=
of_node, of_name);<br>
+}<span><font color=3D"#888888"><br>
<br>
</font></span></blockquote></div>Name like &quot;rmi4-f11&quot; including 0=
 terminator does not fit in 8 chars.<span id=3D"result_box" class=3D"" lang=
=3D"en"><span class=3D""><br>This leads to</span> <span class=3D"">the inab=
ility to find</span> <span class=3D"">the correct OF node and get settings.=
</span></span> </div></div></div>

--001a113f6abcb2760205295d95c2--
