From: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] mfd: flexcom: add a driver for Atmel Flexible
 Serial Communication Unit
Date: Fri, 19 Jun 2015 15:32:39 -0700
Message-ID: <20150619223239.GA24540@dtor-ws>
References: <cover.1434703451.git.cyrille.pitchen@atmel.com>
 <4b10b4bf7824134dfc91c5e4f25de3086163bba7.1434703451.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4b10b4bf7824134dfc91c5e4f25de3086163bba7.1434703451.git.cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Cyrille,

On Fri, Jun 19, 2015 at 10:49:35AM +0200, Cyrille Pitchen wrote:
> +
> +	clk_prepare_enable(clk);

I believe you need to have error handling here, not because it will
actually fail but to handle deferrals.

> +	version = readl(map + FX_VERSION);
> +	writel(mr, map + FX_MR);
> +	clk_disable_unprepare(clk);
> +
> +	dev_info(&pdev->dev, "version: %#x, mode: %s\n", version, mode);
> +
> +	return of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
> +}

Thanks.

-- 
Dmitry
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
