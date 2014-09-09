From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 1/4] phy: phy-stih407-usb: Add usb picoPHY driver found on stih407 SoC family
Date: Tue, 09 Sep 2014 11:08:11 +0200
Message-ID: <2894228.eRmxgHsWbh@wuerfel>
References: <1410253218-18318-1-git-send-email-peter.griffin@linaro.org> <1410253218-18318-2-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410253218-18318-2-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, peppe.cavallaro-qxv4g6HH51o@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 09 September 2014 10:00:15 Peter Griffin wrote:
> This is the generic phy driver for the picoPHY ports used by the
> USB2 and USB3 Host controllers when controlling usb2/1.1 devices. It
> is found on STiH407 SoC family from STMicroelectronics.
> 
> Signed-off-by: Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Looks good overall, just one question:

> +
> +	match = of_match_device(stih407_usb2_picophy_of_match, dev);
> +	if (!match)
> +		return -ENODEV;
....
> +
> +	phy = devm_phy_create(dev, NULL, match->data, NULL);
> +	if (IS_ERR(phy)) {
> +		dev_err(dev, "failed to create Display Port PHY\n");
> +		return PTR_ERR(phy);
> +	}
> +

There is only one entry in the match table, so it always points to
stih407_usb2_picophy_data. Do you have plans to add another set of
operations soon?
If not, just remove the .data pointer and hardcode the operations
in the devm_phy_create call.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
