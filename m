From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 5/8] mfd: Add ST's Low Power Controller driver
Date: Mon, 15 Dec 2014 15:06:50 +0100
Message-ID: <5276146.VV460E9Y1P@wuerfel>
References: <1418642738-17407-1-git-send-email-lee.jones@linaro.org> <2928949.OKYp272uiY@wuerfel> <20141215135052.GC13885@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141215135052.GC13885@x1>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 15 December 2014 13:50:52 Lee Jones wrote:
> > > 
> > 
> > I don't think it's necessary to have the MFD node if only one of the
> > two modes can be used based on a DT property. It should be enough
> > to have both the rtc and the wdt driver list the same compatible
> > string and check the property in the probe function to decide if
> > they want to drive the device or not:
> 
> I tried that and it didn't work.  Only one driver probed.
> 
> 

Strange, the code in really_probe() and the comment in device_attach()
suggest that this is not the intentional behavior. What error
code did you return? If it's -ENODEV or -ENXIO, it should keep
trying the other drivers, otherwise it will give up.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
