From: Santosh Shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: keystone-k2g: Add Message Manager node
Date: Fri, 19 Aug 2016 13:55:10 -0700
Message-ID: <e39f772a-8a30-4c69-fdd9-8b8a639207a6@oracle.com>
References: <20160819204748.21529-1-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160819204748.21529-1-nm-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 8/19/2016 1:47 PM, Nishanth Menon wrote:
> Introduce the message manager node for the A15 queues on which Linux
> runs. The Message Manager is primarily used for communication with
> Power Management controller on K2G.
>
> Signed-off-by: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
> ---
> based on: v4.8-rc1
> Bootlog: http://pastebin.ubuntu.com/23071446/ (with CONFIG_MAILBOX,
>    CONFIG_TI_MESSAGE_MANAGER enabled on top of keystone_defconfig)
> Binding: Documentation/devicetree/bindings/mailbox/ti,message-manager.txt
> SoC Datasheet and relevant documentation: http://www.ti.com/product/66ak2g02
> Communication Protocol: http://processors.wiki.ti.com/index.php/TISCI
>
Patch looks good Nishant. Do you want to send a patch to update
the config to enable TI_MESSAGE_MANAGER and MAILBOX ? Are we missing
anything upstream yet to enable these ?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
