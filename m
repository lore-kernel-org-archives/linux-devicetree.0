From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH v3 2/3] dt-bindings: media: Add Allwinner
 V3s Camera Sensor Interface (CSI)
Date: Mon, 18 Dec 2017 18:46:51 +0800
Message-ID: <CAGb2v67P9Vu7b=c0N5G7B7xNuP9s=oMwdixie6ba-qU35b4+xw@mail.gmail.com>
References: <1510558344-45402-1-git-send-email-yong.deng@magewell.com>
 <CAGb2v67JhMfba8Ao7WyrYikkxvTxX8WaBRqu3GkrhOCWndresg@mail.gmail.com>
 <20171218164921.227b82349c778283f5e5eba8@magewell.com> <20171218092437.ksczam5h7hirmpcv@flea.lan>
 <20171218174309.9170c971c5acac0d14dd782d@magewell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171218174309.9170c971c5acac0d14dd782d-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 18, 2017 at 5:43 PM, Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org> wrote:
> Hi,
>
> On Mon, 18 Dec 2017 10:24:37 +0100
> Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>
>> Hi,
>>
>> On Mon, Dec 18, 2017 at 04:49:21PM +0800, Yong wrote:
>> > > > +               compatible = "allwinner,sun8i-v3s-csi";
>> > > > +               reg = <0x01cb4000 0x1000>;
>> > > > +               interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
>> > > > +               clocks = <&ccu CLK_BUS_CSI>,
>> > > > +                        <&ccu CLK_CSI1_SCLK>,
>> > >
>> > > CSI also has an MCLK. Do you need that one?
>> >
>> > MCLK is not needed if the front end is not a sensor (like adv7611).
>> > I will add it as an option.
>>
>> I guess this should always be needed then. And the driver will make
>> the decision to enable it or not.
>
> But how the driver to know if it should be enabled?
> I think MCLK should be added in DT just if the subdev need it.

Looking around the docs, there doesn't seem to be anything related
to MCLK within the CSI section.

Furthermore, camera sensor bindings, such as for the OV5640, in fact
do have a property for a reference clock, which is called XCLK or
XVCLK.

Since the clock is already exported from the CCU, I suppose it's
just a matter of referencing the clock from the camera node, with
the proper pinctrl for that pin.

So to summarize, just ignore my comment about the missing MCLK. :)

ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
