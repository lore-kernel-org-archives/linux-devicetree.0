From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 06/10] arm64: allwinner: a64: Add devicetree binding
 for DMA controller
Date: Sun, 24 Sep 2017 23:12:26 -0500
Message-ID: <CAL_JsqKSAP36OTgDXJr=YdfMwPSx+8O_ZfPUS9NTvLQRpvc_MA@mail.gmail.com>
References: <20170917031956.28010-1-stefan.bruens@rwth-aachen.de>
 <20170917031956.28010-7-stefan.bruens@rwth-aachen.de> <20170920205300.io3ghr54kzk763kt@rob-hp-laptop>
 <1673036.ZUJy1pffid@pebbles.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1673036.ZUJy1pffid-KVr1ISHqF63jSbz6xCtQhw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Bruens <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Sep 23, 2017 at 6:34 PM, Stefan Bruens
<stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org> wrote:
> On Mittwoch, 20. September 2017 22:53:00 CEST Rob Herring wrote:
>> On Sun, Sep 17, 2017 at 05:19:52AM +0200, Stefan Brüns wrote:
>> > The A64 is register compatible with the H3, but has a different number
>> > of dma channels and request ports.
>> >
>> > Attach additional properties to the node to allow future reuse of the
>> > compatible for controllers with different number of channels/requests.
>> >
>> > If dma-requests is not specified, the register layout defined maximum
>> > of 32 is used.
>> >
>> > Signed-off-by: Stefan Brüns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
>> > ---
>> >
>> >  .../devicetree/bindings/dma/sun6i-dma.txt          | 26
>> >  ++++++++++++++++++++++ 1 file changed, 26 insertions(+)
>> >
>> > diff --git a/Documentation/devicetree/bindings/dma/sun6i-dma.txt
>> > b/Documentation/devicetree/bindings/dma/sun6i-dma.txt index
>> > 98fbe1a5c6dd..6ebc79f95202 100644
>> > --- a/Documentation/devicetree/bindings/dma/sun6i-dma.txt
>> > +++ b/Documentation/devicetree/bindings/dma/sun6i-dma.txt
>> >
>> > @@ -27,6 +27,32 @@ Example:
>> >             #dma-cells = <1>;
>> >
>> >     };
>> >
>> > +-------------------------------------------------------------------------
>> > ----- +For A64 DMA controller:
>> > +
>> > +Required properties:
>> > +- compatible:      "allwinner,sun50i-a64-dma"
>> > +- dma-channels: Number of DMA channels supported by the controller.
>> > +           Refer to Documentation/devicetree/bindings/dma/dma.txt
>> > +- all properties above, i.e. reg, interrupts, clocks, resets and
>> > #dma-cells +
>> > +Optional properties:
>> > +- dma-requests: Number of DMA request signals supported by the
>> > controller.
>> > +           Refer to Documentation/devicetree/bindings/dma/dma.txt
>> > +
>> > +Example:
>> > +   dma: dma-controller@01c02000 {
>>
>> Drop the leading 0. Building dtbs with W=2 will tell you this.
>>
>> With that,
>>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> The leading 0 was copied from the A31 example just a few lines above. Should I
> also correct that one, or should that go in a separate patch?

A separate patch.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
