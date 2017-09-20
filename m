From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: Re: [PATCH v4 1/6] dt-bindings: update the
 Allwinner GPADC device tree binding for H3
Date: Wed, 20 Sep 2017 16:04:02 +0800
Message-ID: <27449039-F0D4-4663-B596-C95D4408D471@aosc.io>
References: <20170914145251.21784-1-icenowy@aosc.io> <20170914145251.21784-2-icenowy@aosc.io> <20170918073336.j7finend3g76chsu@flea.lan> <310CE549-B8CE-4C0C-95B1-B545E38BDAF5@aosc.io> <20170918083045.7bfiialtbm7w6i7j@flea.lan> <e73ead447af89031749e85207cac1e69@aosc.io> <20170920075223.jaeswlhcqgu4yhse@flea.home>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBCOCRDHAKGQEPBDOV6Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170920075223.jaeswlhcqgu4yhse-YififvaboMKzQB+pC5nmwQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.orgMaxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B49=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=883:=
52:23, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0:
>On Mon, Sep 18, 2017 at 03:47:25PM +0000, icenowy-h8G6r0blFSE@public.gmane.org wrote:
>> =E5=9C=A8 2017-09-18 16:30=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=
=BC=9A
>> > On Mon, Sep 18, 2017 at 03:36:43PM +0800, Icenowy Zheng wrote:
>> > > =E4=BA=8E 2017=E5=B9=B49=E6=9C=8818=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=
=8D=883:33:36, Maxime Ripard
>> > > <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0:
>> > > >On Thu, Sep 14, 2017 at 10:52:46PM +0800, Icenowy Zheng wrote:
>> > > >> Allwinner H3 features a thermal sensor like the one in A33,
>but has
>> > > >its
>> > > >> register re-arranged, the clock divider moved to CCU
>(originally the
>> > > >> clock divider is in ADC) and added a pair of bus clock and
>reset.
>> > > >>
>> > > >> Update the binding document to cover H3.
>> > > >>
>> > > >> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> > > >> Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> > > >> ---
>> > > >> Changes in v4:
>> > > >> - Add nvmem calibration data (not yet used by the driver)
>> > > >> Changes in v3:
>> > > >> - Clock name changes.
>> > > >> - Example node name changes.
>> > > >> - Add interupts (not yet used by the driver).
>> > > >>
>> > > >>  .../devicetree/bindings/mfd/sun4i-gpadc.txt        | 30
>> > > >++++++++++++++++++++--
>> > > >>  1 file changed, 28 insertions(+), 2 deletions(-)
>> > > >>
>> > > >> diff --git
>a/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
>> > > >b/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
>> > > >> index badff3611a98..6c470d584bf9 100644
>> > > >> --- a/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
>> > > >> +++ b/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
>> > > >> @@ -4,12 +4,26 @@ The Allwinner SoCs all have an ADC that can
>also
>> > > >act as a thermal sensor
>> > > >>  and sometimes as a touchscreen controller.
>> > > >>
>> > > >>  Required properties:
>> > > >> -  - compatible: "allwinner,sun8i-a33-ths",
>> > > >> +  - compatible: must contain one of the following
>compatibles:
>> > > >> +		- "allwinner,sun8i-a33-ths"
>> > > >> +		- "allwinner,sun8i-h3-ths"
>> > > >>    - reg: mmio address range of the chip,
>> > > >>    - #thermal-sensor-cells: shall be 0,
>> > > >>    - #io-channel-cells: shall be 0,
>> > > >>
>> > > >> -Example:
>> > > >> +Optional properties:
>> > > >> +  - nvmem-cells: A phandle to the calibration data provided
>by a
>> > > >nvmem device.
>> > > >> +                 If unspecified default values shall be used.
>> > > >> +  - nvmem-cell-names: Should be "calibration-data"
>> > > >
>> > > >I'd prefer to have which sensor it applies to here. It wouldn't
>change
>> > > >anything for the H3, but it definitely does for example for the
>A83t
>> > > >that has two sensors, one for each cluster, and one for the GPU,
>each
>> > > >with calibration data.
>> > > >
>> > > >What about cluster0-calibration?
>>=20
>> I prefer sensor0-calibration to sensor3-calibration now.
>> (Theortically the new generation THS can support up to 4 sensors)
>
>The mapping that explains what sensor0 means can change in the
>future. It's better to be explicit here, and just say upfront what
>it's about.

I think for some SoC (e.g. A64) there's no clear explain on
the functions of the sensors.

In addition, in the THS controller the sensors has a
explicit sequence, and when referencing it in the DT
the number is still needed (in thermal zones).

>
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
