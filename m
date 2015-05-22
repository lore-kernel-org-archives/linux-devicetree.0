From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 7/7] mips: pistachio: Allow to enable the external timer
 based clocksource
Date: Fri, 22 May 2015 09:50:16 -0700
Message-ID: <CAL1qeaG=LeQtSS_0w_=hXMNfG2dqTomL5hgifFXV-x1Jy9P1rw@mail.gmail.com>
References: <1432244260-14908-1-git-send-email-ezequiel.garcia@imgtec.com>
	<1432244618-15548-1-git-send-email-ezequiel.garcia@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432244618-15548-1-git-send-email-ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Damien Horsley <Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Govindraj Raja <Govindraj.Raja-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 21, 2015 at 2:43 PM, Ezequiel Garcia
<ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
> This commit introduces a new config, so the user can choose to enable
> the General Purpose Timer based clocksource. This option is required
> to have CPUFreq support.
>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/mips/Kconfig           |  1 +
>  arch/mips/pistachio/Kconfig | 13 +++++++++++++
>  2 files changed, 14 insertions(+)
>  create mode 100644 arch/mips/pistachio/Kconfig
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index f501665..91f6ca0 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -934,6 +934,7 @@ source "arch/mips/jazz/Kconfig"
>  source "arch/mips/jz4740/Kconfig"
>  source "arch/mips/lantiq/Kconfig"
>  source "arch/mips/lasat/Kconfig"
> +source "arch/mips/pistachio/Kconfig"
>  source "arch/mips/pmcs-msp71xx/Kconfig"
>  source "arch/mips/ralink/Kconfig"
>  source "arch/mips/sgi-ip27/Kconfig"
> diff --git a/arch/mips/pistachio/Kconfig b/arch/mips/pistachio/Kconfig
> new file mode 100644
> index 0000000..97731ea
> --- /dev/null
> +++ b/arch/mips/pistachio/Kconfig
> @@ -0,0 +1,13 @@
> +config PISTACHIO_GPTIMER_CLKSRC
> +       bool "Enable General Purpose Timer based clocksource"
> +       depends on MACH_PISTACHIO
> +       select CLKSRC_PISTACHIO
> +       select MIPS_EXTERNAL_TIMER

Why not just select these in the MACH_PISTACHIO Kconfig entry?  Is
there any harm in always having the Pistachio GPT enabled?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
