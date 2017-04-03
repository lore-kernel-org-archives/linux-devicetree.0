From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 0/5] Add support for the R_CCU on
 Allwinner H3/A64 SoCs
Date: Mon, 3 Apr 2017 09:36:40 +0200
Message-ID: <20170403073640.7l7mar6zjcgytf6z@lukather>
References: <20170329104246.34204-1-icenowy@aosc.io>
 <20170402160237.osgt32ugw7cz7ubg@lukather>
 <alpine.LNX.2.20.1704030029590.823@x220i>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tolepy6lgddw5d5l"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBE7XQ7DQKGQE3OFI2WA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.20.1704030029590.823@x220i>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--tolepy6lgddw5d5l
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Mon, Apr 03, 2017 at 12:32:08AM +0800, Icenowy Zheng wrote:
> 
> 
> On Sun, 2 Apr 2017, Maxime Ripard wrote:
> 
> > Hi,
> > 
> > On Wed, Mar 29, 2017 at 06:42:41PM +0800, Icenowy Zheng wrote:
> > > Allwinner SoCs after sun6i-a31 nearly all have a R_CCU in PRCM part.
> > > (V3s and R40 do not have it, as they have even no PRCM)
> > > 
> > > This patch adds support for the ones on H3/A64.
> > > 
> > > Some clock/reset values are reserved for easier extending the support to
> > > A31/A23, but for this I think some changes to the PRCM MFD should be made,
> > > see [1] (Although this is only a sketch).
> > > 
> > > The r_pio device node is also added for A64, as the driver is already
> > > merged, and its depends (r_ccu) is now met.
> > > 
> > > [1] https://github.com/wens/linux/commits/sunxi-ng-prcm
> > 
> > It looks good now, thanks.
> > 
> > Beside from the minor fix you've mentionned, please don't use the
> > defined IDs (yet) in your DT patches (3 to 5).
> 
> Thanks! (I think it's the same question we meet when merging V3s patchset,
> right? :-) )

Exactly. When doing that kind of conversion, in order to not break the
compilation, we would take the DT patches through the clock
tree.

However, this doesn't work very well when we also have DT patches that
conflicts with those clock conversion ones that would need to get
through arm-soc.

And in this case, this is even more complex since you have the H3/H5
split patches that would need to go through yet another branch.

Not using the defines for now, and sending a fix later fixes all these
issues.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--tolepy6lgddw5d5l--
