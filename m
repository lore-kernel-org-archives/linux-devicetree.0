From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCHv4 2/2] mailbox: Adding driver for Xilinx LogiCORE IP
 mailbox.
Date: Mon, 01 Jun 2015 09:32:30 -0700
Message-ID: <1433176350.4861.21.camel@perches.com>
References: <1433175507-3833-1-git-send-email-moritz.fischer@ettus.com>
	 <1433175507-3833-3-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433175507-3833-3-git-send-email-moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Cc: jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2015-06-01 at 09:18 -0700, Moritz Fischer wrote:
> The Xilinx LogiCORE IP mailbox is a FPGA core that allows for
> interprocessor communication via AXI4 memory mapped / AXI4 stream
> interfaces.

trivia:

> diff --git a/drivers/mailbox/mailbox-xilinx.c b/drivers/mailbox/mailbox-xilinx.c
[]
> +static int xilinx_mbox_startup(struct mbox_chan *chan)
> +{
[]
> +			dev_err(mbox->dev,
> +				"failed to register mailbox interrupt:%d\n",
> +				ret);
[]
> +static int xilinx_mbox_probe(struct platform_device *pdev)
> +{
[]
> +		dev_err(&pdev->dev, "Couldn't get clk.\n");
[]
> +		dev_info(&pdev->dev, "IRQ not found, fallback to polling.\n");
[]
> +		dev_err(&pdev->dev, "Register mailbox failed\n");

Perhaps it' be nicer to consistently use a "no-period"
message style.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
