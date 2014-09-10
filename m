From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] ARM: DT: imx53: fix lvds channel 1 port
Date: Wed, 10 Sep 2014 15:15:05 +0200
Message-ID: <1410354905.4508.21.camel@paszta.hi.pengutronix.de>
References: <1409848985-16140-1-git-send-email-list-09_linux_arm@tqsc.de>
	 <20140910012831.GB2341@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140910012831.GB2341@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Markus Niebel <list-09_linux_arm-7U5DVgMjAv4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Markus Niebel <Markus.Niebel-HVi9AzVXQk5Wk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

Am Mittwoch, den 10.09.2014, 09:28 +0800 schrieb Shawn Guo:
> On Thu, Sep 04, 2014 at 06:43:05PM +0200, Markus Niebel wrote:
> > From: Markus Niebel <Markus.Niebel-HVi9AzVXQk5Wk0Htik3J/w@public.gmane.org>
> > 
> > using LVDS channel 1 on an i.MX53 leads to following error:
> > 
> > imx-ldb 53fa8008.ldb: unable to set di0 parent clock to ldb_di1
> > 
> > This comes from imx_ldb_set_clock with mux = 0. Mux parameter must be "1" for
> > reparenting di1 clock to ldb_di1. The value of the mux param comes from device
> > tree port settings.
> > 
> > On i.MX5, the internal two-input-multiplexer is used. Due to hardware limitations,
> > only one port (port@[0,1]) can be used for each channel (lvds-channel@[0,1],
> > respectively)
> > 
> > Documentation update suggested by Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > 
> > Signed-off-by: Markus Niebel <Markus.Niebel-HVi9AzVXQk5Wk0Htik3J/w@public.gmane.org>
> 
> Philipp,
> 
> Does the patch look good to you?  I feel more comfortable to send it as
> a fix and stable material only with your ACK at this stage.

Acked-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
