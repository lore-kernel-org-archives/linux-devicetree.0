From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v5 6/7] arm64: dts: allwinner: add Allwinner
 H5 .dtsi
Date: Sun, 26 Feb 2017 22:54:54 +0800
Message-ID: <3514551488120894@web6m.yandex.ru>
References: <20170226011956.53581-1-icenowy@aosc.xyz>
	 <20170226011956.53581-7-icenowy@aosc.xyz> <20170226085553.b6o6mv7ibe5op4dg@localhost>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBQGYZPCQKGQE2SNWPVA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170226085553.b6o6mv7ibe5op4dg@localhost>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rask Ingemann Lambertsen <rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



26.02.2017, 16:56, "Rask Ingemann Lambertsen" <rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>:
> On Sun, Feb 26, 2017 at 09:19:55AM +0800, Icenowy Zheng wrote:
>> =C2=A0From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
>>
>> =C2=A0The Allwinner H5 SoC is pin-compatible to the H3 SoC, but uses
>> =C2=A0Cortex-A53 cores instead.
>> =C2=A0Based on the now shared base .dtsi describing the common periphera=
ls
>> =C2=A0describe the H5 specific nodes on top of that.
>> =C2=A0That symlinks in the sunxi-h3-h5.dtsi from the arch/arm tree.
>>
>> =C2=A0Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
>> =C2=A0[Icenowy: add H5 pinctrl compatible, and changes for my h3-h5 dtsi
>> =C2=A0=C2=A0refactor, commit message change to met new arm64 naming sche=
me,
>
> s/change to met/change to meet/ or s/change to met/changed to meet/ ?
>
>> =C2=A0diff --git a/arch/arm64/boot/dts/allwinner/sunxi-h3-h5.dtsi b/arch=
/arm64/boot/dts/allwinner/sunxi-h3-h5.dtsi
>> =C2=A0new file mode 120000
>> =C2=A0index 000000000000..036f01dc2b9b
>> =C2=A0--- /dev/null
>> =C2=A0+++ b/arch/arm64/boot/dts/allwinner/sunxi-h3-h5.dtsi
>> =C2=A0@@ -0,0 +1 @@
>> =C2=A0+../../../../arm/boot/dts/sunxi-h3-h5.dtsi
>> =C2=A0\ No newline at end of file
>
> But it's missing more than just a newline, isn't it? Shouldn't it read
>
> #include <../../../../arm/boot/dts/sunxi-h3-h5.dtsi>

Oh you may do not know what a symlink seems like in git format-patch.

This is a symlink.

It's mode is not 100644, but 120000

>
> ?
>
> --
> Rask Ingemann Lambertsen

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
