From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 1/2] dt: watchdog: Add DT binding documentation for
 jz47xx watchdog timer
Date: Tue, 27 Jan 2015 12:52:29 -0800
Message-ID: <20150127205229.GA6983@roeck-us.net>
References: <1422371490-44402-1-git-send-email-Zubair.Kakakhel@imgtec.com>
 <1422371490-44402-2-git-send-email-Zubair.Kakakhel@imgtec.com>
 <11680810.808F8uDyN0@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <11680810.808F8uDyN0@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 27, 2015 at 09:16:45PM +0100, Arnd Bergmann wrote:
> On Tuesday 27 January 2015 15:11:29 Zubair Lutfullah Kakakhel wrote:
> > +clocks: phandle to rtcclk
> > +clock-names: must be "rtc"
> > +
> > +Example:
> > +
> > +watchdog: jz47xx-watchdog@0x10002000 {
> > +       compatible = "ingenic,jz4780-watchdog";
> > +       reg = <0x10002000 0x100>;
> > +
> > +       clocks = <&rtclk>;
> > +       clock-names = "rtc";
> > +};
> 
> Why is the name "rtc"? are you sure you are not confusing the output
> name of the clock controller with the input of the watchdog device?
> 
Driver does this (today):

	 drvdata->rtc_clk = clk_get(&pdev->dev, "rtc");

Isn't that the name to use ? Just wondering.

Thanks,
Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
