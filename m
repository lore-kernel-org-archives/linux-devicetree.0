From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH v4 01/03] ARM: sunxi: Add documentation
 for sunxi consumer infrared devices
Date: Mon, 12 May 2014 16:55:51 +0800
Message-ID: <CAGb2v66OgDgznWF5_2Yoiy_zb2_YNV-REsfhZ3QqBN-tkOJpZQ@mail.gmail.com>
References: <d641a69a-01b4-443d-b121-48d13f46ee03@googlegroups.com> <6a8ffca8-d586-46f6-96e5-4e132ba0f368@googlegroups.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBK4ZYKNQKGQEKF5AS3A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <6a8ffca8-d586-46f6-96e5-4e132ba0f368-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "maxime.ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Apr 30, 2014 at 6:54 PM, =D0=90=D0=BB=D0=B5=D0=BA=D1=81=D0=B0=D0=BD=
=D0=B4=D1=80 =D0=91=D0=B5=D1=80=D1=81=D0=B5=D0=BD=D0=B5=D0=B2 <bay@hackerdo=
m.ru> wrote:
> [PATCH v4 01/03] ARM: sunxi: Add documentation for sunxi consumer infrare=
d
> devices
>
> This patch adds documentation for Device-Tree bindings for sunxi IR
> controller.
>
> Signed-off-by: Alexander Bersenev <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
> Signed-off-by: Alexsey Shestacov <wingrime-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>
>
> diff --git a/Documentation/devicetree/bindings/media/sunxi-ir.txt
> b/Documentation/devicetree/bindings/media/sunxi-ir.txt
> new file mode 100644
> index 0000000..d502cf4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/sunxi-ir.txt
> @@ -0,0 +1,23 @@
> +Device-Tree bindings for SUNXI IR controller found in sunXi SoC family
> +
> +Required properties:
> +- compatible    : should be "allwinner,sun7i-a20-ir";
> +- clocks    : list of clock specifiers, corresponding to
> +      entries in clock-names property;
> +- clock-names    : should contain "apb0_ir0" and "ir0" entries;
> +- interrupts    : should contain IR IRQ number;
> +- reg    : should contain IO map address for IR.
> +
> +Optional properties:
> +- linux,rc-map-name : Remote control map name.
> +
> +Example:
> +
> +ir0: ir@01c21800 {
> +       compatible =3D "allwinner,sun7i-a20-ir";
> +       clocks =3D <&apb0_gates 6>, <&ir0_clk>;
> +       clock-names =3D "apb0_ir0", "ir0";
> +       interrupts =3D <0 5 1>;
> +       reg =3D <0x01C21800 0x40>;
> +       linux,rc-map-name =3D "rc-rc6-mce";

You seem to be mixing spaces and tabs here, with spaces in front.
(Gmail messed this up. See the original post.)
Please stick to using tabs first, and spaces for alignment.


ChenYu

> +};
>
>
> =D1=81=D1=80=D0=B5=D0=B4=D0=B0, 30 =D0=B0=D0=BF=D1=80=D0=B5=D0=BB=D1=8F 2=
014 =D0=B3., 16:51:12 UTC+6 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=BE=D0=B2=D0=
=B0=D1=82=D0=B5=D0=BB=D1=8C =D0=90=D0=BB=D0=B5=D0=BA=D1=81=D0=B0=D0=BD=D0=
=B4=D1=80 =D0=91=D0=B5=D1=80=D1=81=D0=B5=D0=BD=D0=B5=D0=B2
> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
>>
>> This patch introduces Consumer IR(CIR) support for sunxi boards.
>>
>> This is based on Alexsey Shestacov's work based on the original driver
>> supplied by Allwinner.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
