From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 5/8] mfd: Add ST's Low Power Controller driver
Date: Mon, 15 Dec 2014 14:38:33 +0100
Message-ID: <2928949.OKYp272uiY@wuerfel>
References: <1418642738-17407-1-git-send-email-lee.jones@linaro.org> <1418642738-17407-6-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418642738-17407-6-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 15 December 2014 11:25:35 Lee Jones wrote:
> +       ret = of_property_read_u32(np, "st,lpc-mode", &mode);
> +       if (ret) {
> +               dev_err(&pdev->dev, "An LPC mode must be selected\n");
> +               return ret;
> +       }
> +
> +       switch (mode) {
> +       case ST_LPC_MODE_RTC:
> +               cell->name = "st-lpc-rtc";
> +               break;
> +       case ST_LPC_MODE_WDT:
> +               cell->name = "st-lpc-wdt";
> +               break;
> +       default:
> +               dev_err(&pdev->dev, "Unsupported mode: %d\n", mode);
> +               return ret;
> +       }
> +
> +       /* Pass resources though to selected child device. */
> +       cell->resources = pdev->resource;
> +       cell->num_resources = pdev->num_resources;
> +
> +       ret = mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
> +                             cell, 1, NULL, 0, NULL);
> 

I don't think it's necessary to have the MFD node if only one of the
two modes can be used based on a DT property. It should be enough
to have both the rtc and the wdt driver list the same compatible
string and check the property in the probe function to decide if
they want to drive the device or not:

	ret = of_property_read_u32(np, "st,lpc-mode", &mode);
	if (!ret && mode != ST_LPC_MODE_RTC)
		return -ENXIO


	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
