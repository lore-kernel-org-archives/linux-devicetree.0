From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: stmpe-ts: fix wrong bindings
Date: Mon, 9 Dec 2013 21:32:29 +0100
Message-ID: <201312092132.29575.marex@denx.de>
References: <1386620111-1413-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386620111-1413-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shiraz.hashim-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday, December 09, 2013 at 09:15:11 PM, Stefan Agner wrote:
> Fix bindings for STMPE touchscreen device to match the documented
> bindings and the actual bindings used by the driver.
> 
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
> I don't have any of these hardware, but the error is obvious. The device
> probably works anyway since the device/driver will use default values.

Full agreement here.

Reviewed-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>

btw. I plan to rework the STMPE TS as it doesn't work nicely on my device at 
all. I am seriously lacking time, but I will try! ;-)

Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
