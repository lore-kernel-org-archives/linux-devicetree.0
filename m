From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 2/3] mwifiex: parse chip specific gpio from device tree
Date: Mon, 08 Feb 2016 13:11:03 +0100
Message-ID: <4072066.xhEHjcRQWo@wuerfel>
References: <1454926528-17480-1-git-send-email-akarwar@marvell.com> <1454926528-17480-2-git-send-email-akarwar@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454926528-17480-2-git-send-email-akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, wnhuang-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 08 February 2016 02:15:27 Amitkumar Karwar wrote:
>                 if (adapter->dt_node) {
> +                       if (of_property_read_u32(adapter->dt_node,
> +                                                "mwifiex,chip-gpio",
> +                                                &data) == 0) {
> +                               mwifiex_dbg(adapter, INFO,
> +                                           "chip_gpio = 0x%x\n", data);
> +                               adapter->hs_cfg.gpio = data;
> +                       }
> +
> 

Please use the GPIO DT binding. Reading a number from DT is not a proper
way to get a GPIO number, as you may have more than one GPIO controller
in a system and it is not obvious to which controller this number belongs,
or if you need to specify things like polarity.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
