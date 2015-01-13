From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Including empty regulator nodes in axp209.dtsi is a
 BAD idea
Date: Tue, 13 Jan 2015 17:46:06 +0100
Message-ID: <20150113164606.GA4891@lukather>
References: <54B4E7B5.6060304@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="g3W8FGNyQaC+nhss"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBO4Z2WSQKGQEH7CO54I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54B4E7B5.6060304-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--g3W8FGNyQaC+nhss
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Tue, Jan 13, 2015 at 10:39:01AM +0100, Hans de Goede wrote:
> Hi ChenYu, Maxime,
> 
> During the review of a few dts files for new boards Maxime asked me to use
> axp209.dtsi to avoid the standard axp209 "boilerplate" present in most
> boards using the axp209 pmic.
> 
> But axp209.dtsi includes empty regulator nodes, e.g. :
> 
>                 reg_dcdc3: dcdc3 {
>                         regulator-name = "dcdc3";
>                 };
> 
> This is a BAD idea, the presence of these empty nodes causes the
> axp20x-regulator driver to actually register regulators for them,
> and then on late_init the regulator subsys turns them off, since
> they have absolutely no constraints set (nor users registered)
> and the regulator subsys assumes that when devicetree is used their
> is always a compete set of constraints and that thus turning them
> off is safe.
> 
> So when I switched to using axp209.dtsi for the bananapro.dts,
> and booted the bananapro this is the last message I got from the
> kernel while booting:
> 
> [    2.314014] dcdc3: disabling
> 
> And away went our DRAM power-supply, oops.
> 
> So for dcdc2 (CPU) and dcdc3 (DRAM), the boilerplate
> should contain reasonable constraints (eg the operating range
> from the datasheet)

Indeed.

> and an always-on property.

I disagree. The regulator disabling is a feature, and how the board is
wired is, well, up to the board.

If an always-on property is needed, then it's in the DTS, not in the
AXP DTSI.

> The ldo-s are trickier, since we simply do not know how those
> are used, I think ldo2 is used for Avcc on most boards, so it
> too should be always on, since almost any board will have some
> analog parts on it (be it the ir receiver, lradc, rtp, lvds, vga,
> or analog audio in/out). Assuming that we're willing to assume
> that ldo2 is used this way, we should give it matching constraints
> and always mark it always-on.

Ideally, all the drivers that have a analogic component should have a
reference to the regulator they use. But again, at the board
level. And more realistically, putting always-on should also happen at
the board level.

> As for ldo3 - 5 I've no idea when / for what these are used, but
> if we do not know it is better to just leave them be then to turn
> them off IMHO, so we should remove the nodes for these from axp209.dtsi
> 
> Anyways sorting this all out is going to take some time, so I'm
> not going to use axp209.dtsi in dts files for new boards for now.

I'm afraid it's an "all or nothing" situation. Either you load the
PMIC and describe as accurately as possible which regulator are in
use, or you don't. I'm fine with both, even if have a small preference
for the former, but getting stuck half-way is not really an option.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--g3W8FGNyQaC+nhss--
