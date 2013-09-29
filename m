From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: device tree binding documentation outdated
Date: Sun, 29 Sep 2013 14:35:17 +0800
Message-ID: <20130929063515.GC26156@S2101-09.ap.freescale.net>
References: <CAHCPf3t8=mJn-RCz3C1cY6zqsH9ds8UANKpKx9ZpwPM6WjJt3g@mail.gmail.com>
 <20130927174916.GD12758@n2100.arm.linux.org.uk>
 <CAHCPf3sC7bY=p4vpBQFpRUmyPspT_PVjx0rH9cm1ov=SqkO+Vg@mail.gmail.com>
 <20130927190546.GG12758@n2100.arm.linux.org.uk>
 <CAHCPf3vxGAzTnY360KC7Yt-DB1FB14Sv_Cn7DBTH6HGZ6y=stg@mail.gmail.com>
 <CAHCPf3sv3wSbUc9QFVhmYsPc1kqiWYRuOMO7rreuiGSrwyepBQ@mail.gmail.com>
 <20130927202110.GI12758@n2100.arm.linux.org.uk>
 <20130928083859.GQ12758@n2100.arm.linux.org.uk>
 <20130929061303.GB26156@S2101-09.ap.freescale.net>
 <9848F2DB572E5649BA045B288BE08FBE017115C8@039-SN2MPN1-022.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9848F2DB572E5649BA045B288BE08FBE017115C8-RL0Hj/+nBVC81RJBUSuqCa4g8xLGJsHaLnY5E4hWTkheoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Duan Fugang-B38611 <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 29, 2013 at 06:23:39AM +0000, Duan Fugang-B38611 wrote:
> Shawn, for RGMII mode, RGMII tx_clk cannot get external clock via GPIO_16, only by ENET_REF_CLK PAD.
> 	 For RMII mode, enet refrenece clock can get external clock via GPIO_16 and RGMII_TX_CTL PADs.

Yes, that's my understanding too.  Please review the following message
to see if everything stands correct there.

http://thread.gmane.org/gmane.linux.drivers.devicetree/46115/focus=269646

Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
