From: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/6] FlexRM driver improvements
Date: Wed, 19 Jul 2017 09:52:35 -0700
Message-ID: <9563f619-bcac-01cb-11c2-211697d0ac68@broadcom.com>
References: <1500458142-19243-1-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500458142-19243-1-git-send-email-anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Patch series all looks good.


On 17-07-19 02:55 AM, Anup Patel wrote:
> This patchset does various improvments to Broadcom FlexRM
> mailbox controller driver and also adds FlexRM DT nodes
> for Stingray SOC.
>
> The patches are based on Linux-4.13-rc1 and can also be
> found at flexrm-imp-v1 branch of
> https://github.com/Broadcom/arm64-linux.git
>
> Anup Patel (6):
>    mailbox: bcm-flexrm-mailbox: Set IRQ affinity hint for FlexRM ring
>      IRQs
>    mailbox: bcm-flexrm-mailbox: Add debugfs support
>    mailbox: bcm-flexrm-mailbox: Fix mask used in CMPL_START_ADDR_VALUE()
>    mailbox: Make message send queue size dynamic in Linux mailbox
>    mailbox: bcm-flexrm-mailbox: Set msg_queue_len for each channel
>    arm64: dts: Add FlexRM DT nodes for Stingray
>
>   .../boot/dts/broadcom/stingray/stingray-fs4.dtsi   |  54 +++++++
>   .../arm64/boot/dts/broadcom/stingray/stingray.dtsi |   2 +
>   drivers/mailbox/bcm-flexrm-mailbox.c               | 160 ++++++++++++++++++++-
>   drivers/mailbox/mailbox.c                          |  15 +-
>   include/linux/mailbox_controller.h                 |   5 +-
>   5 files changed, 227 insertions(+), 9 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/broadcom/stingray/stingray-fs4.dtsi
>
Regards,
  Scott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
