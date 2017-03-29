From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 0/3] Broadcom FlexRM ring manager support
Date: Wed, 29 Mar 2017 11:05:32 +0530
Message-ID: <CABb+yY3n2OuvBKfsWj5m5RvdBEZ5_aWpVNUJ9V8oikyJjchZAw@mail.gmail.com>
References: <1490765455-8556-1-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490765455-8556-1-git-send-email-anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pramod KUMAR <pramod.kumar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Rice <rob.rice-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 29, 2017 at 11:00 AM, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> The Broadcom FlexRM ring manager provides producer-consumer style
> ring interface for offload engines on Broadcom iProc SoCs. We can
> have one or more instances of Broadcom FlexRM ring manager in a SoC.
>
> This patchset adds a mailbox driver for Broadcom FlexRM ring manager
> which can be used by offload engine drivers as mailbox clients.
>
> The Broadcom FlexRM mailbox driver is feature complete for RAID and
> Crypto offload engines. We will have incremental patches in-future
> for ring-level statistics using debugfs and minor optimizations.
>
> This patchset is based on Linux-4.11-rc4 and it is also available
> at flexrm-v7 branch of https://github.com/Broadcom/arm64-linux.git
>
> Changes since v6:
>  - Rebased patches for Linux-4.11-rc4
>  - Added a patch to remove depends on COMPILE_TEST for kconfig
>    option BCM_FLEXRM_MBOX
>
You only needed to send the fix to compilation failure reports, not
the whole series.
I believe only the patch-3 is new in the series and I need not even
look at patch-1,2 ?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
