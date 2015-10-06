From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH-RFC 6/7] drivers: of: ifdef out cmdline section
Date: Tue, 6 Oct 2015 12:14:43 -0500
Message-ID: <CAL_JsqLmVRdWZqxFRAZ-pgd225PGW8MNv4A47bcfD+cD_+K7rg@mail.gmail.com>
References: <1444146434-12776-6-git-send-email-danielwa@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444146434-12776-6-git-send-email-danielwa@cisco.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Walker <danielwa@cisco.com>
Cc: xe-kernel@external.cisco.com, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, Daniel Walker <dwalker@fifo99.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 6, 2015 at 10:47 AM, Daniel Walker <danielwa@cisco.com> wrote:
> It looks like there's some seepage of cmdline stuff into
> the generic device tree code. This conflicts with the
> generic cmdline implementation so I remove it in the case
> when that's enabled.

Nice series in general. I've had passing desire to do this every time
I run into the command line code.

The DT handling of the command line is generic across architectures.
The current design is working around that the kernel command line code
is not that way. I think we can take this a bit further by making the
generic DT code add the command line string directly rather than
relying on the arch to do that. Then we can remove all command line
handling from the arch code. I would also look at whether we can make
boot_command_line static rather than directly accessed. We might have
to leave it public for now, but could treat it as static for generic
cmdline case.

Rob

> Cc: xe-kernel@external.cisco.com
> Cc: Daniel Walker <dwalker@fifo99.com>
> Signed-off-by: Daniel Walker <danielwa@cisco.com>
> ---
>  drivers/of/fdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 6e82bc42..80f1e48 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -953,7 +953,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>          * managed to set the command line, unless CONFIG_CMDLINE_FORCE
>          * is set in which case we override whatever was found earlier.
>          */
> -#ifdef CONFIG_CMDLINE
> +#if defined(CONFIG_CMDLINE) && !defined(CONFIG_GENERIC_CMDLINE)
>  #ifndef CONFIG_CMDLINE_FORCE
>         if (!((char *)data)[0])
>  #endif
> --
> 2.1.4
>
