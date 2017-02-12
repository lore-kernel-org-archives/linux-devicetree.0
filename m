From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: armada-385-synology-ds116: add support for
 Synology DS116 NAS
Date: Sun, 12 Feb 2017 18:27:24 +0100
Message-ID: <20170212182724.4ed100e0@free-electrons.com>
References: <1486805073-15534-1-git-send-email-w@1wt.eu>
        <20170212004031.GA7328@lunn.ch>
        <20170212005350.GA18612@1wt.eu>
        <20170212011744.GB7328@lunn.ch>
        <20170212012418.GA17841@1wt.eu>
        <20170212153855.GA17141@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170212153855.GA17141-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Willy Tarreau <w@1wt.eu>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Sun, 12 Feb 2017 16:38:55 +0100, Andrew Lunn wrote:

> What you have in v2 and v3 looks good. It could be considered a bit of
> a hack, two nodes for the same hardware block. But they are used at
> different times, normal runtime, and late in the shutdown. So it works
> out O.K.

I don't really mind personally, but IMO this is clearly a hack. It
completely violates the rule that the DT should represent the HW, and
the fact that the DT should be operating system agnostic.

But anyway, there are so many things in the DT that violates those
rules that probably this hack is fine.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
