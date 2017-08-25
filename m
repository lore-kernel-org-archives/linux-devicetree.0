From: Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v2] arm64: allwinner: h5: add support for NanoPi NEO Plus
 2
Date: Fri, 25 Aug 2017 19:47:41 +0200
Message-ID: <20170825174741.55tlbx4en2dtafax@AntonyAntony.local>
References: <20170824231716.2623-1-antony@phenome.org>
 <20170825103242.5665-1-antony@phenome.org>
 <20170825120542.GA9475@Red>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170825120542.GA9475@Red>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 25, 2017 at 02:05:42PM +0200, Corentin Labbe wrote:
> On Fri, Aug 25, 2017 at 12:32:42PM +0200, Antony Antony wrote:
> > 	Add initial DT support for NanoPi NEO Plus 2 by FriendlyELEC
> > 		Allwinner quad core H5 Cortex A53 with an ARM Mali-450MP GPU
> > 		1 GB DDR3 RAM
> > 		8GB eMMC flash (Samsung KLM8G1WEPD-B031)
> > 		micro SD card slot
> > 		Gigabit Ethernet (external RTL8211E-VB-CG chip)
> > 		802.11 b/g/n WiFi, Bluetooth 4.0 (Ampak AP6212A module)
> > 		2x USB 2.0 host ports & 2x USB via headers
> > 
> >     The DTS is based on OrangePi PC 2, sun50i-h5-orangepi-pc2
> >     Added dwmac-sun8i Gigabit Ethernet support based on
> >     Nano Pi Neo2 DT and the schematics.
> > 
> > Signed-off-by: Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org>
> 
> Hello
> 
> I do not see changes between v1 to v2.

I missed it. I will include in v3, both v1 -> v2 and v2->v3


> And you need to set your real name in signed-off.

I see my real name "Antony Antony" in Signed-off-by:

regards,
-antony

PS Did you #19 on this list?
http://www.kalzumeus.com/2010/06/17/falsehoods-programmers-believe-about-names/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
