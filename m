From: Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] bcma: register bcma as device tree driver
Date: Sat, 13 Sep 2014 17:13:18 +0200
Message-ID: <54145F0E.8000506@broadcom.com>
References: <1410615446-7639-1-git-send-email-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410615446-7639-1-git-send-email-hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/13/14 15:37, Hauke Mehrtens wrote:
> This driver is used by the bcm53xx ARM SoC code. Now it is possible to
> give the address of the chipcommon core in device tree and bcma will
> search for all the other cores.
>
> Signed-off-by: Hauke Mehrtens<hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
> ---
>   Documentation/devicetree/bindings/bus/bcma.txt | 41 +++++++++++++
>   drivers/bcma/bcma_private.h                    | 16 +++++
>   drivers/bcma/host_soc.c                        | 82 ++++++++++++++++++++++++++
>   drivers/bcma/main.c                            | 10 ++++
>   include/linux/bcma/bcma.h                      |  2 +
>   5 files changed, 151 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/bus/bcma.txt
>
> This is based on wireless-testing and should go into that tree.
>
> changes since:
> RFC:
>   - reworded the irq description
>   - improved the example
>   - hocked into bcma_modeinit() and bcma_modexit()
>
> diff --git a/Documentation/devicetree/bindings/bus/bcma.txt b/Documentation/devicetree/bindings/bus/bcma.txt
> new file mode 100644
> index 0000000..17e095f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/bcma.txt
> @@ -0,0 +1,41 @@
> +Broadcom AIX SoC bcma bus driver

Hi Hauke,

First of all a typo used all over the place: AIX should be AXI.

The backplane in Broadcom SoC is ARM AXI with additional plugin option 
to make it discoverable. Indeed the IRQ info is not included, but I see 
no reason for specifying the register space for the cores in device-tree 
as that is discoverable by bcma.

Regards,
Arend
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
