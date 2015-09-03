From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2 0/2] ARM: dts: rockchip: pull up cts lines
Date: Thu, 03 Sep 2015 21:03:15 +0200
Message-ID: <2685164.GZh6IdR1jF@phil>
References: <1441236479-4941-1-git-send-email-amstan@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441236479-4941-1-git-send-email-amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, FUKAUMI Naoki <naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Neil Hendin <nhendin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Alex,

Am Mittwoch, 2. September 2015, 16:27:57 schrieb Alexandru M Stan:
> The flow control lines from a user accessible UART are optional,
> the user might not have anything connected to those pins.
> In order to prevent random interrupts happening and noise affecting
> the cts pin should be pulled up.
> 
> The only boards affected (that care about uart*_cts ) are the veyron
> chromeos devices and the firefly. Veyron already has something like that,
> which I now have to remove in the second patch. Firefly uses uart0_cts
> for the wifi chip communications, same thing as veyron, so it should be
> fine having it.

applied both to my dts branch for 4.4 with Doug's Review-tag
(Currently only on github and becomes really public after 4.3-rc1)


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
