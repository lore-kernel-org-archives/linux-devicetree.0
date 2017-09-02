From: Stefan Bruens <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: Re: [PATCH 3/3] dmaengine: sun6i: Add support for
 Allwinner A64
Date: Sat, 2 Sep 2017 02:38:31 +0200
Message-ID: <1663692.e5KjDkSFRC@pebbles.site>
References: <20170830233609.13855-4-stefan.bruens@rwth-aachen.de> <1837534.s5pz9jWHnV@pebbles.site> <d397d87b-5004-c8af-e590-037befc9b2b6@arm.com>
Reply-To: stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDIYL7P2SAMRBCP3U7GQKGQEDWSTNUA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <d397d87b-5004-c8af-e590-037befc9b2b6-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?ISO-8859-1?Q?Andr=E9?= Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Samstag, 2. September 2017 00:32:50 CEST Andr=C3=A9 Przywara wrote:
> Hi,
>=20
> On 01/09/17 02:19, Stefan Bruens wrote:
> > On Freitag, 1. September 2017 02:31:35 CEST Andre Przywara wrote:
> >> Hi,
> >>=20
> >> On 31/08/17 00:36, Stefan Br=C3=BCns wrote:
[...]
> >=20
> > For these 3 properties it likely is a good idea, but we would IMHO stil=
l
> > have to care for the differences in the register settings:
> >=20
> > - A31 does not have a clock autogating register
> > - A23 and A83t does have one at offset 0x20
> > - A64, H3, H5 and R40 have it at offset 0x28
>=20
> Fair enough - I didn't look too closely at your new changes, especially
> why it apparently worked before.
> But as your list shows, we would only need one compatible string per
> line - in the driver - to cover all SoCs (and possibly future SoCs!),
> and do the rest via the properties.
> We can't use the existing h3 compatible string or touch the already
> existing SoCs and compatible strings, of course, but I guess
> the A64, R40 and future SoCs could make use of a new (generic?) string.
>=20
> > There are also the incompatibilities in the "DMA channel configuration
> > register" (burst length; burst width; burst length field offset).
> >=20
> > We can either have 3 different compatible strings, or another property =
for
> > the register model.
>=20
> The latter is usually frowned upon, using separate compatible strings
> for each group of SoCs is the way to go here.
>=20
> > For the aw,max_requests and aw,max_vchans, maybe a bitmask per directio=
n
> > is a better option - it can encode the allowed DRQ numbers much better
> > (e.g. for H3, the highest source DRQ is 24). The DRQ field in the chann=
el
> > configuration register is 5 bits, so the hightest port/DRQ number is 31=
.
>=20
> So looking more closely at the manual and the code my understanding is
> that nr_max_requests is more or less some rough molly guard to prevent
> wrong settings? Derived from the DRQ table in the manual?
> So that trying to program port 28 on an H3 would fail?
> But source port 25 or dest port 26 wouldn't be caught by this check,
> though they would still be "illegal" according to the manual. (Which we
> are not sure of, I guess, it may just not be documented)
> So I wonder if this nr_max_requests is useful at all, and we should just
> check that it fits into 5 bits and assume that the DT has superior
> knowledge of what's allowed and what not.
> Now I see what you mean with the bitmask (to cover those gaps), but I am
> bit sceptical if that is actually useful. After all the DRQ number would
> be coming from the DT, which we can surely trust.
>=20
> And nr_max_vchans seems to describe the sum of documented DRQs, to just
> limit the memory allocation? So this could become just 64 to cover all
> possible cases without SoC specific configuration at all?

Yes, thats my understanding as well. Allocating a few excess channels would=
=20
waste a few kBytes (AFAICS 304 bytes per channel on 64bit).
=20
> > For aw,max_channels my first thought is - why max? is it variable? is
> > there a min_channels? My suggestion would be (in order of preference):
> > "aw,channels", "aw,dma_channels", "aw,available_channels".
>=20
> Sure, actually looking at Documentation/devicetree/bindings/dma/dma.txt
> I think we can even use the generic "dma-channels" property described
> there. And possibly the same with "dma-requests", should we keep this.
>=20
> So summarizing this:
> - We create a new compatible string, which drives an H3 compatible DMA
> (clock autogating at 0x28, 64-bit data width capable). This name could
> either be generic, or actually "allwinner,sun50i-a64-dma".
> - This one sets nr_max_requests to 31 and nr_max_vchans to 64.
> - Alternatively we expose those values in the DT as properties.
> - We take the number of DMA channels from the (now required)
> "dma-channels" property.
> - We let the A64 (and R40?) use this new binding.
> - Any future SoC which is close enough can then just piggy-back on this.
> - Any future *changes* in the Allwinner DMA device which require driver
> changes create a new compatible string, but still keep the above
> semantics. Chances are that there are more than one SoC using this kind
> of new DMA device, so they would work out of the box.
>=20
> Does that make sense?
> I am happy to provide the code for that, based on your H3 rework.

Sounds good for me. I will send a cleaned up series later.

Kind regards,

Stefan

--=20
Stefan Br=C3=BCns  /  Bergstra=C3=9Fe 21  /  52062 Aachen
home: +49 241 53809034     mobile: +49 151 50412019

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
