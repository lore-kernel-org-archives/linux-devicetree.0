From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: vf610-zii-dev-rev-b: Add missing newline
Date: Fri, 30 Dec 2016 15:07:04 +0800
Message-ID: <20161230070703.GO6177@dragon>
References: <1480276484-5482-1-git-send-email-afaerber@suse.de>
 <20161127211727.GB13318@lunn.ch>
 <e9336935-264e-5d1c-656e-a48f89d1b015@suse.de>
 <20161127213516.GF13318@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161127213516.GF13318-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Nov 27, 2016 at 10:35:16PM +0100, Andrew Lunn wrote:
> On Sun, Nov 27, 2016 at 10:30:54PM +0100, Andreas Färber wrote:
> > Hi,
> > 
> > Am 27.11.2016 um 22:17 schrieb Andrew Lunn:
> > > On Sun, Nov 27, 2016 at 08:54:44PM +0100, Andreas Färber wrote:
> > >> Found while reviewing Marvell dsa bindings usage.
> > > 
> > > Hi Andreas
> > > 
> > > It is good practice to put the maintainer you expect to accept the
> > > patch on the To: line. You have at least two different maintainers on
> > > Cc: so it is currently ambiguous. And these lists can be high volume,
> > > so without a copy in the maintainers inbox, patches can be overlooked.
> > 
> > As a vf610 DT patch with LAKML in To I am expecting it to be handled by
> > Shawn or anyone from the NXP/ARM side.
> 
> So please have Shawn as To:
> 
> The patch you are fixing went through Dave Miller, who is also on Cc:,
> hence the ambiguity.

The good practice was broken from the beginning when patch "arm: vf610:
zii devel b: Add support for switch interrupts") went through net tree,
even without me on copy.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
