From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/6] DT: mfd: add device-tree binding doc fro PMIC
 max77620/max20024
Date: Tue, 12 Jan 2016 20:07:59 -0600
Message-ID: <20160113020759.GA16193@rob-hp-laptop>
References: <1452590273-16421-1-git-send-email-ldewangan@nvidia.com>
 <1452590273-16421-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452590273-16421-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 12, 2016 at 02:47:48PM +0530, Laxman Dewangan wrote:
> The MAXIM PMIC MAX77620 and MAX20024 are power management IC
> which supports RTC, GPIO, DCDC/LDO regulators, interrupt,
> watchdog etc.
> 
> Add DT binding document for the different functionality of
> this device.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes from V1:
> - Added units in some of properties.
> - Change the boolean property to tristate type and detail some of
>   properties.

[...]

> +Flexible power sequence configuration
> +====================================
> +This sub-node configures the Flexible Power Sequnece(FPS) for power ON slot,
> +power OFF slot and slot period of the device. Device has 3 FPS as FPS0,
> +FPS1 and FPS2. The details of FPS configuration is provided through
> +subnode "fps". The details of FPS0, FPS1, FPS2 are provided through the
> +child node under this subnodes. The FPS number is provided via reg property.
> +
> +The property for fps child nodes as:
> +Required properties:
> +	-reg: FPS number like 0, 1, 2 for FPS0, FPS1 and FPS2 respectively.
> +Optinal properties:
> +	-maxim,active-fps-time-period: Active state FPS time period in
> +		microseconds.
> +	-maxim,suspend-fps-time-period: Suspend state FPS time period in
> +		microseconds.

These property names need units, too. IOW, append with '-us', so 
something like "maxim,suspend-fps-time-us".

Otherwise, looks fine to me.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
