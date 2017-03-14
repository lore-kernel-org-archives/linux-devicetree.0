From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 1/2] mailbox: Add driver for Broadcom FlexRM ring manager
Date: Tue, 14 Mar 2017 17:54:59 +0100
Message-ID: <CABb+yY0uDhgq-8hiAAXdq35igHH1GJVuuGTmerK=9UN6_VTHnA@mail.gmail.com>
References: <1488793240-25484-1-git-send-email-anup.patel@broadcom.com> <1488793240-25484-2-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488793240-25484-2-git-send-email-anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pramod KUMAR <pramod.kumar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Rice <rob.rice-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 6, 2017 at 10:40 AM, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> Some of the Broadcom iProc SoCs have FlexRM ring manager
> which provides a ring-based programming interface to various
> offload engines (e.g. RAID, Crypto, etc).
>
> This patch adds a common mailbox driver for Broadcom FlexRM
> ring manager which can be shared by various offload engine
> drivers (implemented as mailbox clients).
>
> Reviewed-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Pramod KUMAR <pramod.kumar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/mailbox/Kconfig                      |  11 +
>  drivers/mailbox/Makefile                     |   2 +
>  drivers/mailbox/mailbox-flexrm/Makefile      |   6 +
>  drivers/mailbox/mailbox-flexrm/flexrm-desc.c | 764 ++++++++++++++++++++++++
>  drivers/mailbox/mailbox-flexrm/flexrm-desc.h |  47 ++
>  drivers/mailbox/mailbox-flexrm/flexrm-main.c | 829 +++++++++++++++++++++++++++
>  include/linux/mailbox/brcm-message.h         |  14 +-
>  7 files changed, 1669 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/mailbox/mailbox-flexrm/Makefile
>  create mode 100644 drivers/mailbox/mailbox-flexrm/flexrm-desc.c
>  create mode 100644 drivers/mailbox/mailbox-flexrm/flexrm-desc.h
>  create mode 100644 drivers/mailbox/mailbox-flexrm/flexrm-main.c
>
I would avoid platform specific sub-directory if possible, because
people tend to take it as  their fenced island where they can do
whatever they like.

Can you break this into an upper BRCM specific code (desc management)
and a lower purely mailbox driver (only sets up pointers/addresses to
create rings and track the flexrm's PC)?   Is there a reason why you
must dma_map, the buffers to send, in the spinlock protected
.send_data()?

thanks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
