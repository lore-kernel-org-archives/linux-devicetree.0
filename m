From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 4/9] clk: Add clock driver for mb86s7x
Date: Fri, 21 Nov 2014 14:03:52 +0100
Message-ID: <2396055.pBuh1YtUHT@wuerfel>
References: <1416486442-25200-1-git-send-email-Vincent.Yang@tw.fujitsu.com> <1416486975-25385-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416486975-25385-1-git-send-email-Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Yang <vincent.yang.fujitsu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Vincent Yang <Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, Tetsuya Nuriya <nuriya.tetsuya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 20 November 2014 20:36:15 Vincent Yang wrote:
> +#define __DTS_MB86S70_CLK_H
> +
> +#define MB86S70_CRG11_ALW      0
> +#define MB86S70_CRG11_DDR3     1
> +#define MB86S70_CRG11_MAIN     2
> +#define MB86S70_CRG11_CA15     3
> +#define MB86S70_CRG11_HDMI     4
> +#define MB86S70_CRG11_DPHY     5
> +
> +#define MB86S70_CRG11_UNGPRT   8
> 

The clock driver doesn't seem to use those macros at all, how does the
driver know which clock you are referring to?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
