From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCHv2] mvebu: add Linksys WRT1900AC (Mamba) support
Date: Sun, 25 Jan 2015 18:09:25 +0100
Message-ID: <20150125170925.GB23862@lunn.ch>
References: <1421687701-5667-1-git-send-email-kaloz@openwrt.org>
 <20150119182113.GH32663@lunn.ch>
 <op.xsrcplz12s3iss@ecaz>
 <54C51FAA.4080300@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54C51FAA.4080300-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> >>>+
> >>>+        power {
> >>>+            label = "mamba:white:power";
> >>
> >>Please replace this mamba with wrt1900ac. It is a property of the
> >>device, not the board. Another device using the mamba board may use it
> >>differently.
> >>
> >
> >See above.
> 
> The LED should be named by the device, not the platform. If OpenWRT
> userspace already expects "mamba" in here, I guess we are stuck with
> it. If not, call it "wrt1900ac:white:power".

Hi Sebastian

We have some flexibility here. There is the mantra, don't break
userspace, but that only applies once code has reached mainline.  We
don't have to be compatible with OpenWRT, if we feel it would be wrong
to do so. OpenWRT should be well aware of the risk of not "Upstream
first". However, if it does not cost us anything, we can be
compatible.

I think Android is another good example. Some code has been accepted
into mainline as is, other parts have been re-written with different
APIs.

If it is decided that mamba is used everywhere, then it should be used
here. If wrt1900ac is used, then i would like to see this LED named
wrt1900ac. What you don't see in this dts file is the other 8 or so
LEDs, which are connected to an I2c LED driver. A first version of the
kernel driver has now been merged, the DT binding is stable, so we
should add these LEDs to this dts file. But we should be consistent
with the naming.

     Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
