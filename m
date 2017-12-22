From: Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sunxi: Add sid for a83t
Date: Fri, 22 Dec 2017 11:07:27 +0100
Message-ID: <20171222110727.520df7394234f6a5dc0b9ec0@bidouilliste.com>
References: <20171219210523.10428-1-kevans91@ksu.edu>
        <20171221145512.llxvzkcrjpquhczi@flea.lan>
        <CACNAnaE9GiVTXD-TV1xXyBJKtTGKpdA6n0REk6a=qm218EgHbg@mail.gmail.com>
        <20171221152630.2vf57x5o2yi5sv3n@flea.lan>
        <20171221190903.56ebae536acf51401c63802c@bidouilliste.com>
        <20171222083508.dfcp6egfvxykmogg@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171222083508.dfcp6egfvxykmogg-ZC1Zs529Oq4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kyle Evans <kevans91-OYTqUY/oFF8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 22 Dec 2017 09:35:08 +0100
Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> On Thu, Dec 21, 2017 at 07:09:03PM +0100, Emmanuel Vadot wrote:
> > 
> >  Hi Maxime,
> > 
> > On Thu, 21 Dec 2017 16:26:30 +0100
> > Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > 
> > > Hi,
> > > 
> > > On Thu, Dec 21, 2017 at 09:19:24AM -0600, Kyle Evans wrote:
> > > > On Thu, Dec 21, 2017 at 8:55 AM, Maxime Ripard
> > > > <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > > > > Hi Kyle,
> > > > >
> > > > > On Tue, Dec 19, 2017 at 03:05:23PM -0600, kevans91-OYTqUY/oFF8@public.gmane.org wrote:
> > > > >> Allwinner a83t has a 1 KB sid block with efuse for security rootkey and
> > > > >> thermal calibration data, add node to describe it.
> > > > >>
> > > > >> a83t-sid is not currently supported by nvmem/sunxi-sid, but it is
> > > > >> supported in an external driver for FreeBSD.
> > > > >>
> > > > >> Signed-off-by: Kyle Evans <kevans91-OYTqUY/oFF8@public.gmane.org>
> > > > >
> > > > > The patch looks fine in itself, but we've had a number of issues with
> > > > > the register layout (and access patterns) in the past, so I'd rather
> > > > > have something that works in Linux too if possible.
> > > > 
> > > > I have a patch that I think should make it work fine on Linux [1], but
> > > > I'm afraid I have little to no capability to test it myself and so I
> > > > did not add it as well.
> > > > 
> > > > I do know that the rootkey is offset 0x200 into the given space [2],
> > > > as is the case with the H3, and that the readout quirk is not needed.
> > > > I wasn't 100% sure that the a83t has 2Kbit worth of efuse space as the
> > > > H3, but I do know that thermal data can be found at 0x34 and 0x38 in
> > > > this space.
> > > 
> > > Then maybe we should leave it aside until someone takes some time on
> > > the A83t. 
> > 
> >  Take some time on the Linux driver and do not apply this patch for
> > now you mean ?
> 
> Yep.
> 
> Maxime

 Since linux doesn't have the compatible in it's driver what would
be the harm to add the node in the DTS ? If a quirks is needed because
some region is weird this would go in the driver right ? I don't see a
technical problem for adding this node right now.
 If Kyle confirm the lenght of the region and that no quirk is needed
will it be enough ?

 Cheers,

-- 
Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
