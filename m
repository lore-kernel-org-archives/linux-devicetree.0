From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: l2c: add options to overwrite prefetching
 behavior
Date: Thu, 14 May 2015 17:15:26 +0100
Message-ID: <20150514161526.GB2067@n2100.arm.linux.org.uk>
References: <1431620035-7183-1-git-send-email-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1431620035-7183-1-git-send-email-hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: arnd-r2nGTMty4D4@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, May 14, 2015 at 06:13:55PM +0200, Hauke Mehrtens wrote:
> These options make it possible to overwrites the data and instruction
> prefetching behavior of the arm pl310 cache controller.
> 
> We have to set these values in the aux and the prefetch register,
> because these two bits in the aux registers are mapped to the prefetch
> register. If only the prefetch register is changed there is an
> inconsistence in the state in this driver.

No there isn't.  Just set the bits in the prefetch register.

Writing to the prefetch register changes the state of the bits in the
auxiliary control register at the same time.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
