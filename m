From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v8] mwifiex: parse device tree node for PCIe
Date: Fri, 18 Nov 2016 18:21:41 +0200
Message-ID: <87oa1coj1m.fsf@purkki.adurom.net>
References: <1479472624-22340-1-git-send-email-akarwar@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479472624-22340-1-git-send-email-akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
        (Amitkumar Karwar's message of "Fri, 18 Nov 2016 18:07:04 +0530")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cathy Luo <cluo-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org> writes:

> From: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
>
> This patch derives device tree node from pcie bus layer framework.
> Device tree bindings file has been renamed(marvell-sd8xxx.txt ->
> marvell-8xxx.txt) to accommodate PCIe changes.
>
> Signed-off-by: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Rajat Jain <rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>

[...]

> @@ -10,6 +10,8 @@ Required properties:
>    - compatible : should be one of the following:
>  	* "marvell,sd8897"
>  	* "marvell,sd8997"
> +	* "pci11ab,2b42"
> +	* "pci1b4b,2b42"

Are these correct? In v6 Rob said:

"I think I already said this, but you have the vendor and product IDs 
reversed."

https://patchwork.kernel.org/patch/9390225/

-- 
Kalle Valo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
