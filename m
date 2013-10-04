From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: device tree binding documentation outdated
Date: Fri, 4 Oct 2013 16:58:25 +0100
Message-ID: <20131004155825.GO12758@n2100.arm.linux.org.uk>
References: <CAHCPf3sC7bY=p4vpBQFpRUmyPspT_PVjx0rH9cm1ov=SqkO+Vg@mail.gmail.com> <20130927190546.GG12758@n2100.arm.linux.org.uk> <CAHCPf3vxGAzTnY360KC7Yt-DB1FB14Sv_Cn7DBTH6HGZ6y=stg@mail.gmail.com> <CAHCPf3sv3wSbUc9QFVhmYsPc1kqiWYRuOMO7rreuiGSrwyepBQ@mail.gmail.com> <20130927202110.GI12758@n2100.arm.linux.org.uk> <20130928083859.GQ12758@n2100.arm.linux.org.uk> <20130929061303.GB26156@S2101-09.ap.freescale.net> <20131002193316.GR12758@n2100.arm.linux.org.uk> <20131002234911.GD12758@n2100.arm.linux.org.uk> <20131004154536.GB2734@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131004154536.GB2734-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 04, 2013 at 11:45:39PM +0800, Shawn Guo wrote:
> On Thu, Oct 03, 2013 at 12:49:11AM +0100, Russell King - ARM Linux wrote:
> > RGMII mode.
> > 
> > In current hardware, the phy has its own 25MHz crystal.  This provides
> > the phy with its clocks, and the phy itself contains a PLL, which it
> > uses to generate 125MHz.
> > 
> > The phy can be (and is) configured to generate this 125MHz clock on
> > the CLK_25M pin, which is connected to the IMX6 ENET_REF_CLK pad (V22
> > ball).
> > 
> > Hence, we have in DT:
> > 	MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK
> > 
> > So far, so good. 
> > 
> > 
> > On current hardware, GPIO 16 is not connected to anything except some
> > 0402 resistor pads where the resistor is not fitted.  On future hardware,
> > the above crystal will be removed, and the appropriate 0402 resistor
> > placed to supply a clock provided on GPIO 16 to the phy.
> > 
> > Hence, to support both hardware configurations transparently, GPIO 16
> > should be configured to generate a 25MHz clock for use by the phy.
> 
> On AR8035 XTLI pin?  Here is what I read from AR8035 data sheet.
> 
> XTLI (Analog input signal): Crystal oscillator input. Requires a 27 pF
> capacitor to GND.  Support external 25 MHz, 1.2V swing clock input
> through this pin.
> 
> XTLO (Analog output signal): Crystal oscillator output; 27 pF to GND.
> 
> Will AR8035 just work if we provide a digital 25Mhz clock (from GPIO_16)
> on its XTLI pin?

Well, "Support external 25 MHz, 1.2V swing clock input through this pin."
suggests the answer is yes.  The characterists suggest that if the supplied
clock is within -0.3 to 0.15V for the low level, and 0.8 to 1.5V for the
high level, it should work.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
