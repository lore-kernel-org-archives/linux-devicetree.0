From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 5/6] ARM: sun7i: Convert to CCU
Date: Thu, 29 Jun 2017 13:53:57 +0200
Message-ID: <20170629115357.sxs3tjmhfncfvtpj@flea>
References: <cover.24b2b13ec5a68552e186ba1637f1328363c3886e.1498422562.git-series.plaes@plaes.org>
 <ac9cc7f0a67d3e9e5edd0d5eb21cc60820c2b457.1498422562.git-series.plaes@plaes.org>
 <a08cbe0d-dad4-7d0c-9845-452e0d6e3f03@arm.com>
 <20170629132812.52ce1214d6967b82da52123e@bidouilliste.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="peq7wjbm7zxjedk7"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBVWU2PFAKGQEEGSY5OI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170629132812.52ce1214d6967b82da52123e-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--peq7wjbm7zxjedk7
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Thu, Jun 29, 2017 at 01:28:12PM +0200, Emmanuel Vadot wrote:
> On Thu, 29 Jun 2017 11:57:05 +0100
> Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> wrote:
> 
> > Hi,
> > 
> > On 25/06/17 21:45, Priit Laes wrote:
> > > Convert sun7i-a20.dtsi to new CCU driver.
> > 
> > I know that some people hat^Wget annoyed by me asking this, but anyway:
> > 
> > Why do we actually need this?
> 
>  No. I can understand the need for clkng/sunxi-ng/whatever you call it,
> it's not that bad (but see below) to add a new SoC on FreeBSD now that
> I've added the framework, but breaking old SoC that were perfectly fine
> isn't acceptable.

We haven't broken it.

>  It also mean that, on FreeBSD, we still have patches for sun7i dts to
> add hdmi support (which we have since a year or so) because last time
> someone (I think plaes) wanted to add clock node for it, it was said
> that it was needed to move to clkng first.

This is a circular argument. It wouldn't have been the case with
sunxi-ng, since we would have had that clock from the start...

> > This ultimately makes the DT incompatible with older kernels (as
> > actually shipped by distros today).
> 
>  Yes, right now sun5i support is broken in FreeBSD because I couldn't
> find the time to make a driver for it yet.

Probably because you merged new DTs without updating the code. That
has nothing to do with backward compatibility, the old DT would still
work fine.

> > So if we for instance use UEFI boot or otherwise just use "one golden
> > DT" to drive all kernels (like using the DT from U-Boot), we now don't
> > have one good DT that fits all. This is really a showstopper for boards
> > which ship a DT in firmware (in SPI flash, for instance, or on some eMMC).
> > So:
> > - Do we actually need to change the .dtsi? The old .dtsi should still work.
> > - Is there anything that the new and fancy clocks gives us over the
> > existing clocks? If yes, that should be a  stated in the commit message
> > or cover letter.
> > - Why do we change the clocks for those older SoCs in the first place?
> > Can't we just keep on using what worked for years? I think we really
> > can't remove the old code anyway.
> > 
> > The new clock driver moves information from the DT into the kernel. That
> > means it is no longer available for a DT consumer and the SoC details
> > (which clocks is located where, for instance), have to be replicated to
> > other DT users (U-Boot, *BSD, you-name-it). We already came across this
> > issue when looking at converting U-Boot over to use DT clocks.
> > Also it ultimately requires kernel changes for each new SoC, even if it
> > only differs in some detail which could be perfectly modelled in DT
> > (think of H3 vs. H5).
> 
>  The last point is very interesting, before adding a new Allwinner SoC
> was just a matter of maybe handling one/two new clocks (at least to
> have something that 'just boots'), now it's a whole new big boring file
> to write while reading datasheet.

You can definitely do that with sunxi-ng bindings if you want. You
just have to populate only the IDs that are of interest to you.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--peq7wjbm7zxjedk7--
