From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Including empty regulator nodes in axp209.dtsi is a BAD idea
Date: Tue, 13 Jan 2015 10:39:01 +0100
Message-ID: <54B4E7B5.6060304@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBPWP2OSQKGQENB7X66Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi ChenYu, Maxime,

During the review of a few dts files for new boards Maxime asked me to use
axp209.dtsi to avoid the standard axp209 "boilerplate" present in most
boards using the axp209 pmic.

But axp209.dtsi includes empty regulator nodes, e.g. :

                 reg_dcdc3: dcdc3 {
                         regulator-name = "dcdc3";
                 };

This is a BAD idea, the presence of these empty nodes causes the
axp20x-regulator driver to actually register regulators for them,
and then on late_init the regulator subsys turns them off, since
they have absolutely no constraints set (nor users registered)
and the regulator subsys assumes that when devicetree is used their
is always a compete set of constraints and that thus turning them
off is safe.

So when I switched to using axp209.dtsi for the bananapro.dts,
and booted the bananapro this is the last message I got from the
kernel while booting:

[    2.314014] dcdc3: disabling

And away went our DRAM power-supply, oops.

So for dcdc2 (CPU) and dcdc3 (DRAM), the boilerplate
should contain reasonable constraints (eg the operating range
from the datasheet) and an always-on property.

The ldo-s are trickier, since we simply do not know how those
are used, I think ldo2 is used for Avcc on most boards, so it
too should be always on, since almost any board will have some
analog parts on it (be it the ir receiver, lradc, rtp, lvds, vga,
or analog audio in/out). Assuming that we're willing to assume
that ldo2 is used this way, we should give it matching constraints
and always mark it always-on.

As for ldo3 - 5 I've no idea when / for what these are used, but
if we do not know it is better to just leave them be then to turn
them off IMHO, so we should remove the nodes for these from axp209.dtsi

Anyways sorting this all out is going to take some time, so I'm
not going to use axp209.dtsi in dts files for new boards for now.

Regards,

Hans
