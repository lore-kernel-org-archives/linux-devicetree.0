From: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sunxi: h3/h5 :Add DAI nodes
Date: Mon, 4 Sep 2017 12:51:38 +0200
Message-ID: <CAEKpxB=MF-8BPS_Jc=qgj9sTCfn9EKWxdtJQD4goRGSv0xnHMw@mail.gmail.com>
References: <20170903150806.3451-1-codekipper@gmail.com> <2581170.20QKPVRcId@jernej-laptop>
Reply-To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCHNXO4F7MHBBO7AWTGQKGQEZQLW5TI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <2581170.20QKPVRcId@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 3 September 2017 at 18:35, Jernej =C5=A0krabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>=
 wrote:
> Hi Marcus!
>
> Dne nedelja, 03. september 2017 ob 17:08:06 CEST je codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> napisal(a):
>> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Add the new DAI blocks to the device tree. I2S0 and I2S1 are for
>> connecting to an external codec whereas I2S2 is used for HDMI
>> audio.
>>
>> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 39
>> ++++++++++++++++++++++++++++++++++++++ 1 file changed, 39 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
>> b/arch/arm/boot/dts/sunxi-h3-h5.dtsi index 11240a8313c2..cf6fcc857324
>> 100644
>> --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
>> +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
>> @@ -450,6 +450,45 @@
>>                       status =3D "disabled";
>>               };
>>
>> +             i2s0: i2s@01c22000 {
>> +                     #sound-dai-cells =3D <0>;
>> +                     compatible =3D "allwinner,sun8i-h3-i2s";
>> +                     reg =3D <0x01c22000 0x400>;
>> +                     interrupts =3D <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks =3D <&ccu CLK_BUS_I2S0>, <&ccu CLK_I2S0>;
>> +                     clock-names =3D "apb", "mod";
>> +                     dmas =3D <&dma 3>, <&dma 3>;
>> +                     resets =3D <&ccu RST_BUS_I2S0>;
>> +                     dma-names =3D "rx", "tx";
>> +                     status =3D "disabled";
>> +             };
>> +
>> +             i2s1: i2s@01c22400 {
>> +                     #sound-dai-cells =3D <0>;
>> +                     compatible =3D "allwinner,sun8i-h3-i2s";
>> +                     reg =3D <0x01c22400 0x400>;
>> +                     interrupts =3D <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks =3D <&ccu CLK_BUS_I2S1>, <&ccu CLK_I2S1>;
>> +                     clock-names =3D "apb", "mod";
>> +                     dmas =3D <&dma 4>, <&dma 4>;
>> +                     resets =3D <&ccu RST_BUS_I2S1>;
>> +                     dma-names =3D "rx", "tx";
>> +                     status =3D "disabled";
>> +             };
>> +
>> +             i2s2: i2s@01c22800 {
>> +                     #sound-dai-cells =3D <0>;
>> +                     compatible =3D "allwinner,sun8i-h3-i2s";
>> +                     reg =3D <0x01c22800 0x400>;
>> +                     interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks =3D <&ccu CLK_BUS_I2S2>, <&ccu CLK_I2S2>;
>> +                     clock-names =3D "apb", "mod";
>> +                     dmas =3D <&dma 5>, <&dma 5>;
>> +                     resets =3D <&ccu RST_BUS_I2S2>;
>> +                     dma-names =3D "rx", "tx";
>> +                     status =3D "disabled";
>> +             };
>> +
>
> I don't want to be a pain, but shouldn't we skip this one for now? It is =
only
> for HDMI and has different capabilities (8 channels supported and slighlt=
y
> different formula to calculate oversample rate.
I'll have a look into this..maybe this can be handled by the
simple-audio-card binding that we use. The other thing with the
padding which you mentioned I can add a field for. Maxime, what's your
thoughts on this?..I can re-submit without i2s2.
BR,
CK
>
> Best regards,
> Jernej

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
