From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: armada-385-synology-ds116: add support for
 Synology DS116 NAS
Date: Sun, 12 Feb 2017 16:38:55 +0100
Message-ID: <20170212153855.GA17141@lunn.ch>
References: <1486805073-15534-1-git-send-email-w@1wt.eu>
 <20170212004031.GA7328@lunn.ch>
 <20170212005350.GA18612@1wt.eu>
 <20170212011744.GB7328@lunn.ch>
 <20170212012418.GA17841@1wt.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170212012418.GA17841-K+wRfnb2/UA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Willy Tarreau <w@1wt.eu>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Feb 12, 2017 at 02:24:18AM +0100, Willy Tarreau wrote:
> On Sun, Feb 12, 2017 at 02:17:44AM +0100, Andrew Lunn wrote:
> > > But won't that squat the I/O address and prevent me from using all the
> > > other codes via the regular serial port ?
> > 
> > Nope. That driver hijacks the serial port during shutdown to actually
> > turn the power off. The rest of the time, it does not touch the serial
> > port. Userspace, or the rest of the kernel is free to use it.
> 
> OK so I should declare both the serial and the power-off device at the
> same address ? Excuse-me for the dumb question but I'm not much used to
> doing uncommon things in DTS files :-/

Hi Willy

What you have in v2 and v3 looks good. It could be considered a bit of
a hack, two nodes for the same hardware block. But they are used at
different times, normal runtime, and late in the shutdown. So it works
out O.K.

    Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
