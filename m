From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH v6 2/2] media: V3s: Add support for
 Allwinner CSI.
Date: Thu, 1 Feb 2018 16:54:32 +0100
Message-ID: <20180201155432.odv6p6rals3sujhx@flea.lan>
References: <1516695531-23349-1-git-send-email-yong.deng@magewell.com>
 <201801260759.RyNhDZz4%fengguang.wu@intel.com>
 <20180126094658.aa70ed3f890464f6051e21e4@magewell.com>
 <20180126110041.f89848325b9ecfb07df387ca@magewell.com>
 <20180131030807.GA19945@bart.dudau.co.uk>
 <20180131074212.7hvb3nqkt22h2chg@flea.lan>
 <20180131144753.GB19945@bart.dudau.co.uk>
 <20180201083222.q6rqql4nngn2bhiy@flea.lan>
 <CAK8P3a01DqmVJKt6J2i_okVoeELJCUW0voW0r52EzBY7iF74xQ@mail.gmail.com>
 <20180201113442.GC19945@bart.dudau.co.uk>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="52oyo5npgo7v2l5n"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBRHQZTJQKGQERPYXYFY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180201113442.GC19945-hOhETlTuV5niMG9XS5x8Mg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Liviu Dudau <liviu-I3yL/QOVVjH10XsdtD+oqA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, kbuild-all-JC7UmRfGjtg@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rick Chang <rick.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Linux Media Mailing List <linux-media@v>
List-Id: devicetree@vger.kernel.org


--52oyo5npgo7v2l5n
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Thu, Feb 01, 2018 at 11:34:43AM +0000, Liviu Dudau wrote:
> On Thu, Feb 01, 2018 at 10:20:28AM +0100, Arnd Bergmann wrote:
> > On Thu, Feb 1, 2018 at 9:32 AM, Maxime Ripard
> > <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > > On Wed, Jan 31, 2018 at 02:47:53PM +0000, Liviu Dudau wrote:
> > >> On Wed, Jan 31, 2018 at 08:42:12AM +0100, Maxime Ripard wrote:
> > >> > On Wed, Jan 31, 2018 at 03:08:08AM +0000, Liviu Dudau wrote:
> > >> > > On Fri, Jan 26, 2018 at 11:00:41AM +0800, Yong wrote:
> > >>
> > >> Yeah, sorry, my threading of the discussion was broken and I've seen
> > >> the rest of the thread after I have replied. My bad!
> > >>
> > >> >
> > >> > In our case, the bus where the device is attached will not do the
> > >> > address translations, and shouldn't.
> > >>
> > >> In my view, the bus is already doing address translation at physical
> > >> level, AFAIU it remaps the memory to zero.
> > >
> > > Not really. It uses a separate bus with a different mapping for the
> > > DMA accesses (and only the DMA accesses). The AXI (or AHB, I'm not
> > > sure, but, well, the "registers" bus) doesn't remap anything in
> > > itself, and we only describe this one usually in our DTs.
> 
> I was actually thinking about the DMA bus (AXI bus, most likely), not the
> "registers" bus (yes, usually APB or AHB). The DMA bus is the one that does
> the implicit remapping for the addresses it uses, if I understood you correctly.
> 
> > Exactly, the DT model fundamentally assumes that each a device is
> > connected to exactly one bus, so we make up a device *tree* rather
> > than a non-directed mesh topology that you might see in modern
> > SoCs.
> 
> I think you are right, but we also have the registers property for a device node
> and that can be used for describing the "registers" bus. Now, it is possible
> that some driver code gets confused between accessing the device registers
> (which in Arm world happens through an APB or AHB bus) and the device doing system
> read/writes which usually happends through an AXI (or for very old systems, AHB) bus.
> 
> For the sake of making sure we are talking about the same thing and in hope
> that Maxime or Yong can give a more detailed picture of this device

Keep in mind that this part is heavily under-documented to us, and
this is mostly information collected through testing and reading
through the various vendor trees.

As far as I know, a few devices (Display Engine, hardware codec, the
CSI driver that spawned this discussion) are connected to the memory
through a proprietary bus that does the remapping. The registers part
is connected to an AHB bus.

> I'll re-iterate what a lot of devices in the Arm world look like
> nowadays:
> 
> - they have a bus for accessing the "registers" of the device, for controlling
>   the behaviour of that device. Inside the SoC, that happens through the
>   APB bus and it has a separate clock. The CPU has a view of those registers
>   through some mapping in the address space that has been backed by the hardware
>   engineers at design time and in DT we express that through the "registers" property,
>   plus the "apb_clk" for most of the bindings. In DT world we express the mapping
>   vis-a-vis the parent bus by using the "ranges" property.

We do have that.

> - they have a high speed bus for doing data transfers. Inside the SoC that
>   happens through an AXI or more modern CCI interconnect bus. The CPU does not
>   have a direct view on those transfers, but by using IOMMUs, SMMUs or simple
>   bus mastering capabilities it can gain knowledge of the state of the transfers
>   and/or influence the target memory.

Part of that bus controller allows to probe the bus bandwidth and / or
set limits for the various controllers connected to it, so it seems to
match that description.

>   In the DT world, we use the "dma-ranges" property like you say to
>   express the translations that happen on that bus.

Right, except that the way dma-ranges is parsed at the moment is that
it will look on the parent node for dma-ranges. In this case, the
parent in the DT will be our AHB bus, and not all the devices
connected on that AHB bus that do DMA go through that DMA bus with the
different mapping. So setting it there isn't an option.

> Maxime/Yong: does your device have more than one AXI bus for doing
> transfers?

Not as far as I know.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--52oyo5npgo7v2l5n--
