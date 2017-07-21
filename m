From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/6] FlexRM driver improvements
Date: Fri, 21 Jul 2017 11:56:07 +0530
Message-ID: <CAALAos8s880_waXZb+8hP2SYLYJ+-udmHMU_hZLWk+Wk5jS4qw@mail.gmail.com>
References: <1500458142-19243-1-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500458142-19243-1-git-send-email-anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 19, 2017 at 3:25 PM, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> This patchset does various improvments to Broadcom FlexRM
> mailbox controller driver and also adds FlexRM DT nodes
> for Stingray SOC.
>
> The patches are based on Linux-4.13-rc1 and can also be
> found at flexrm-imp-v1 branch of
> https://github.com/Broadcom/arm64-linux.git
>
> Anup Patel (6):
>   mailbox: bcm-flexrm-mailbox: Set IRQ affinity hint for FlexRM ring
>     IRQs
>   mailbox: bcm-flexrm-mailbox: Add debugfs support
>   mailbox: bcm-flexrm-mailbox: Fix mask used in CMPL_START_ADDR_VALUE()
>   mailbox: Make message send queue size dynamic in Linux mailbox
>   mailbox: bcm-flexrm-mailbox: Set msg_queue_len for each channel
>   arm64: dts: Add FlexRM DT nodes for Stingray

One patch was missed-out in this series which was about
using bitmap instead of IDA to avoid locking issues. I will
send revised patchset to include this patch.

>
>  .../boot/dts/broadcom/stingray/stingray-fs4.dtsi   |  54 +++++++
>  .../arm64/boot/dts/broadcom/stingray/stingray.dtsi |   2 +
>  drivers/mailbox/bcm-flexrm-mailbox.c               | 160 ++++++++++++++++++++-
>  drivers/mailbox/mailbox.c                          |  15 +-
>  include/linux/mailbox_controller.h                 |   5 +-
>  5 files changed, 227 insertions(+), 9 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/broadcom/stingray/stingray-fs4.dtsi
>
> --
> 2.7.4
>

Regards,
Anup
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
