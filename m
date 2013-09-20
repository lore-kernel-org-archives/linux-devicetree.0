From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v4] dt: update PSCI binding documentation for v0.2
Date: Thu, 19 Sep 2013 21:36:51 -0700
Message-ID: <CAOesGMjNhYTfPOr5NPEC9GWym-nuFE0hX_6+LW9bTv_E3iXbcQ@mail.gmail.com>
References: <1379625868-5395-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379625868-5395-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <Ian.Campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Charles Garcia-Tobin <Charles.Garcia-Tobin-5wv7dgnIgG8@public.gmane.org>, Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Just a quick drive-by. Sorry, I don't know the history of previous
review cycles.


On Thu, Sep 19, 2013 at 2:24 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

>  Main node optional properties:
>
> - - cpu_suspend   : Function ID for CPU_SUSPEND operation
> + - cpu_suspend[-<32|64]   : Function ID for CPU_SUSPEND operation
> +
> + - cpu_off                : Function ID for CPU_OFF operation
> +
> + - cpu_on[-<32|64]        : Function ID for CPU_ON operation
> +
> + - affinity_info[-<32|64] : Function ID for AFFINITY_INFO operation
>
> - - cpu_off       : Function ID for CPU_OFF operation
> + - migrate[-<32|64]       : Function ID for MIGRATE operation
>
> - - cpu_on        : Function ID for CPU_ON operation
> + - migrate_info_type      : Function ID for MIGRATE_INFO_TYPE operation
>
> - - migrate       : Function ID for MIGRATE operation
> + - migrate_info_up_cpu[-<32|64] : Function ID for MIGRATE_INFO_UP_CPU operation
>
> + - system_reset           : Function ID for SYSTEM_RESET operation
> +
> + - system_off             : Function ID for SYSTEM_OFF operation

All of these should use dashes instead of underscores.

I also wonder if it would be better to move them into a subnode to
keep the namespace a bit cleaner.

> +Some functions have have separate IDs for 32-bit and 64-bit calling
> +conventions. These separate function IDs are described with function names with
> +"-64" and "-32" suffixes (e.g. cpu_on-64). Where a function name does not have
> +a suffix, the ID may be used with either calling convention depending on the
> +CPU state -- AArch32 callers should use the 32-bit calling convention, and
> +AArch64 callers should use the 64-bit calling convention.

Why not just make them a possible two-element property with <32 64>,
or if only one element, same on both? Seems cleaner.





-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
