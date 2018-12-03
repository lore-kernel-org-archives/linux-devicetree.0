From: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 13/17] clk: sunxi-ng: add support for
 suniv F1C100s SoC
Date: Mon, 3 Dec 2018 22:08:22 +0300
Message-ID: <20181203190822.jt7sieazcapm722w@ThinkPad>
References: <cover.1543781680.git.mesihkilinc@gmail.com>
 <b3d266d9f5f0f7504701c3bbec819acde6d19257.1543781680.git.mesihkilinc@gmail.com>
 <20181203085531.exlmkfs6b4ejv5dr@flea>
Reply-To: mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDI4VHO5SYLBBKP6SXQAKGQEAQ3BR5Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20181203085531.exlmkfs6b4ejv5dr@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 18/12/03 09:55, Maxime Ripard wrote:
> On Sun, Dec 02, 2018 at 11:23:47PM +0300, Mesih Kilinc wrote:
> > diff --git a/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c b/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
> > new file mode 100644
> > index 0000000..ea335a6
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
> > @@ -0,0 +1,541 @@
> > +/* SPDX-License-Identifier: GPL-2.0
> 
> This isn't the proper SPDX format, and this is reported by
> checkpatch. I've fixed it while applying, but please make sure to run
> checkpatch.

Thanks Maxime, I will be more carefull next time. I actually saw that
warning, but I couldn't find what to do. I have looked to [1] and saw that
its spelled correctly. Now I think problem is, the licencse identifier
should be separate comment like:
// SPDX-...

Thanks!

Mesih

[1] =
https://spdx.org/sites/cpstandard/files/pages/files/using_spdx_license_list_short_identifiers.pdf
