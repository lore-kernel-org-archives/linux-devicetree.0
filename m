From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCHv3 2/2] usb: dwc2: Add reset control to dwc2
Date: Thu, 14 Apr 2016 04:04:31 +0200
Message-ID: <201604140404.32087.arnd@arndb.de>
References: <1460587442-21136-1-git-send-email-dinguyen@opensource.altera.com> <1460587442-21136-2-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460587442-21136-2-git-send-email-dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
Cc: johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stefan.wahren-eS4NqCHxEME@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 14 April 2016, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
> @@ -337,6 +338,17 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
>  {
>         int i, ret;
>  
> +       hsotg->reset = devm_reset_control_get(hsotg->dev, "dwc2");
> +       if (IS_ERR(hsotg->reset)) {
> +               if (PTR_ERR(hsotg->reset) == -EPROBE_DEFER)
> +                       return -EPROBE_DEFER;
> +               dev_dbg(hsotg->dev, "Could not get reset control.\n");
> +               hsotg->reset = NULL;
> +       }
> +
> +       if(hsotg->reset)
> +               reset_control_deassert(hsotg->reset);


The error handling seems a bit odd here. If there is a failure to get the
reset control and it's actually needed, I would argue the init function should
not continue. Conversely, if there was no reset line specified in the
device, why even print a message about it?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
