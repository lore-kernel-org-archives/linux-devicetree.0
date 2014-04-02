From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: stmpe-ts: fix wrong bindings
Date: Wed, 2 Apr 2014 17:15:01 +0800
Message-ID: <20140402091459.GB10283@dragon>
References: <1386620111-1413-1-git-send-email-stefan@agner.ch>
 <201312092132.29575.marex@denx.de>
 <2acd964e18e59b35996d042a3dd6e99b@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2acd964e18e59b35996d042a3dd6e99b-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shiraz.hashim-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 02, 2014 at 09:48:58AM +0200, Stefan Agner wrote:
> Am 2013-12-09 21:32, schrieb Marek Vasut:
> > On Monday, December 09, 2013 at 09:15:11 PM, Stefan Agner wrote:
> >> Fix bindings for STMPE touchscreen device to match the documented
> >> bindings and the actual bindings used by the driver.
> >>
> >> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> >> ---
> >> I don't have any of these hardware, but the error is obvious. The device
> >> probably works anyway since the device/driver will use default values.
> > 
> > Full agreement here.
> > 
> > Reviewed-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> > 
> > btw. I plan to rework the STMPE TS as it doesn't work nicely on my device at 
> > all. I am seriously lacking time, but I will try! ;-)
> > 
> > Best regards,
> > Marek Vasut
> 
> Hi Shawn,
> 
> Just noticed that I forgot to add you when sending this patch. I guess
> this should go through your tree...

You should probably resend the patch against the latest kernel, and with
imx change in a separate patch.

Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
