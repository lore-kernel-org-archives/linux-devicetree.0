From: Duc Dang <dhdang-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH v3 0/3] mailbox: Add APM X-Gene platform mailbox driver
Date: Mon, 16 Nov 2015 11:22:01 -0800
Message-ID: <CADaLNDkjS+LstNcgKoLWHrMdgU9cmZ7vrCSp-du=FNoCTKFJ0w@mail.gmail.com>
References: <1429863912.2927.43.camel@x220> <cover.1447091625.git.dhdang@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1447091625.git.dhdang-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patches <patches-qTEPVZfXA3Y@public.gmane.org>, Duc Dang <dhdang-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 9, 2015 at 10:05 AM, Duc Dang <dhdang-qTEPVZfXA3Y@public.gmane.org> wrote:
> APM X-Gene SoC has a mailbox controller that provides
> communication mechanism for X-Gene Arm64 cores to communicate
> with X-Gene SoC's Cortex M3 (SLIMpro) processor.
>
> X-Gene mailbox controller provides 8 mailbox channels, with
> each channel has a dedicated interrupt line.
>
> Changes since v2:
>         - Rebase Feng's patch set over v4.3-rc5
>         - Remove uneccessary 'inline' in function definition
>         - Use module_platform_driver instead of subsys_initcall
>         - Minor coding stype clean up
>
> Changes since v1:
>         - Add ACPI support
>         - Use defines for reg offset
>
>  .../bindings/mailbox/xgene-slimpro-mailbox.txt     |  34 +++
>  arch/arm64/boot/dts/apm/apm-storm.dtsi             |  14 ++
>  drivers/mailbox/Kconfig                            |   9 +
>  drivers/mailbox/Makefile                           |   2 +
>  drivers/mailbox/mailbox-xgene-slimpro.c            | 264 +++++++++++++++++++++
>  5 files changed, 323 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/xgene-slimpro-mailbox.txt
>  create mode 100644 drivers/mailbox/mailbox-xgene-slimpro.c
>

Hi Jassi, Paul,

Do you have any comment on this patch set?

> --
> 1.9.1
>
Regards,
Duc dang.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
