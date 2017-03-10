From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v2 05/11] Documentation: DT: bindings: mfd:
 add A33 GPADC binding
Date: Sat, 11 Mar 2017 03:33:51 +0800
Message-ID: <5847351489174431@web4o.yandex.ru>
References: <20170310103921.19469-1-quentin.schulz@free-electrons.com>
	 <20170310103921.19469-6-quentin.schulz@free-electrons.com> <20170310122544.wkbqnzq2twfciyaw@lukather>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBIP7RPDAKGQETGCDXAA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170310122544.wkbqnzq2twfciyaw@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org" <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org" <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "wens-jdAy2FN1RRM@public.gmane.org" <wens-jdAy2FN1RRM@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org" <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, "knaack.h-Mmb7MZpHnFY@public.gmane.org" <knaack.h-Mmb7MZpHnFY@public.gmane.org>, "lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <jic23@kernel>
List-Id: devicetree@vger.kernel.org



10.03.2017, 20:26, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> On Fri, Mar 10, 2017 at 11:39:15AM +0100, Quentin Schulz wrote:
>> =C2=A0This patch adds documentation for the A33 GPADC binding.
>>
>> =C2=A0Signed-off-by: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> =C2=A0---
>>
>> =C2=A0added in v2
>>
>> =C2=A0=C2=A0.../devicetree/bindings/mfd/sun4i-gpadc.txt | 59 +++++++++++=
+++++++++++
>> =C2=A0=C2=A01 file changed, 59 insertions(+)
>> =C2=A0=C2=A0create mode 100644 Documentation/devicetree/bindings/mfd/sun=
4i-gpadc.txt
>>
>> =C2=A0diff --git a/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt=
 b/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
>> =C2=A0new file mode 100644
>> =C2=A0index 0000000..17242c8
>> =C2=A0--- /dev/null
>> =C2=A0+++ b/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
>> =C2=A0@@ -0,0 +1,59 @@
>> =C2=A0+Allwinner SoCs' GPADC Device Tree bindings
>> =C2=A0+------------------------------------------
>> =C2=A0+The Allwinner SoCs all have an ADC that can also act as a thermal=
 sensor
>> =C2=A0+and sometimes as a touchscreen controller.
>> =C2=A0+
>> =C2=A0+Required properties:
>> =C2=A0+ - compatible: "sun8i-a33-gpadc-iio",
>
> This doesn't match your example, and you shouldn't have IIO in
> there. Compatibles shouldn't be tied to a given framework, since that
> is Linux specific (and might even change in the future).

>From this aspect, I think we shouldn't even call it gpadc in compatible --
as it's not GP at all on A33.

>
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> ,
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
