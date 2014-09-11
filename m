From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] ARM: DT: imx53: fix lvds channel 1 port
Date: Thu, 11 Sep 2014 15:44:31 +0800
Message-ID: <20140911074428.GF18566@dragon>
References: <1409848985-16140-1-git-send-email-list-09_linux_arm@tqsc.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1409848985-16140-1-git-send-email-list-09_linux_arm-7U5DVgMjAv4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Markus Niebel <list-09_linux_arm-7U5DVgMjAv4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Markus Niebel <Markus.Niebel-HVi9AzVXQk5Wk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 04, 2014 at 06:43:05PM +0200, Markus Niebel wrote:
> From: Markus Niebel <Markus.Niebel-HVi9AzVXQk5Wk0Htik3J/w@public.gmane.org>
> 
> using LVDS channel 1 on an i.MX53 leads to following error:
> 
> imx-ldb 53fa8008.ldb: unable to set di0 parent clock to ldb_di1
> 
> This comes from imx_ldb_set_clock with mux = 0. Mux parameter must be "1" for
> reparenting di1 clock to ldb_di1. The value of the mux param comes from device
> tree port settings.
> 
> On i.MX5, the internal two-input-multiplexer is used. Due to hardware limitations,
> only one port (port@[0,1]) can be used for each channel (lvds-channel@[0,1],
> respectively)
> 
> Documentation update suggested by Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> Signed-off-by: Markus Niebel <Markus.Niebel-HVi9AzVXQk5Wk0Htik3J/w@public.gmane.org>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
