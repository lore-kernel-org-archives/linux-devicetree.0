From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 13/14] ARM: STi: DT: STiH410: Add usb2 picophy dt nodes
Date: Thu, 13 Nov 2014 12:15:35 +0100
Message-ID: <3348806.YN8XP4V4uc@wuerfel>
References: <1415876417-28728-1-git-send-email-peter.griffin@linaro.org> <1415876417-28728-14-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415876417-28728-14-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 13 November 2014 11:00:16 Peter Griffin wrote:
> +       soc {
> +               usb2_picophy0: usbpicophy@0 {
> +                       compatible = "st,stih407-usb2-phy";
> +                       reg = <0xf8 0x04>,      /* syscfg 5062 */
> +                             <0xf4 0x04>;      /* syscfg 5061 */
> 

I think the node name for the phy should be "phy@f8" instead of usbpicophy@0
by common convention. I notice that there are some existing instances of
this, you can probably change them as well. Linux doesn't normally care
about the node names.

It also seems that you have put the node in the wrong place, as the reg
property apparently refers to a different address space. Did you mean
to put this under the syscfg_core node?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
