From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 2/3] arm64: allwinner: a64: add USB0
 OHCI/EHCI related devicetree parts
Date: Wed, 5 Apr 2017 15:17:19 +0800
Message-ID: <7828ffa0-f570-9841-a9e6-fe175f8169ac@aosc.io>
References: <20170404184518.33610-1-icenowy@aosc.io>
 <20170404184518.33610-2-icenowy@aosc.io>
 <20170405071508.yaur35xuli4jgkfb@lukather>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBDNUSLDQKGQEJGE2OYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170405071508.yaur35xuli4jgkfb@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E5=9C=A8 2017=E5=B9=B404=E6=9C=8805=E6=97=A5 15:15, Maxime Ripard =E5=86=
=99=E9=81=93:
> On Wed, Apr 05, 2017 at 02:45:17AM +0800, Icenowy Zheng wrote:
>> As we added USB0 route auto switching support for A64, add related
>> device tree parts to the A64 DTSI file (EHCI0/OHCI0 controllers and the
>> pmu0 memory area for PHY).
>>
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 24 ++++++++++++++++++++=
++++
>>  1 file changed, 24 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-a64.dtsi
>> index 1c64ea2d23f9..a8916df99048 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> @@ -179,8 +179,10 @@
>>  		usbphy: phy@01c19400 {
>>  			compatible =3D "allwinner,sun50i-a64-usb-phy";
>>  			reg =3D <0x01c19400 0x14>,
>> +			      <0x01c1a800 0x4>,
>>  			      <0x01c1b800 0x4>;
>>  			reg-names =3D "phy_ctrl",
>> +				    "pmu0",
>
> This breaks the older DTs, and that property isn't documented.

It's already documented.

In the H3 dual-route patchset I have already added this.

("  * "pmu0" for H3, V3s and A64")

P.S. to be compatible with older DTs, I think I should adjust
the phy driver, make it enable dual-route function only when
pmu0 is present.

>
> Maxime
>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
