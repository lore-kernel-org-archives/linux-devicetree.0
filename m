From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3] mfd: syscon: Add hardware spinlock support
Date: Wed, 29 Nov 2017 11:07:23 +0100
Message-ID: <CAK8P3a2SDgPEfg4PvefSrh0cBneNcbM66ogbuBFxoxqrS82cTQ@mail.gmail.com>
References: <e6b3e6532abf42e6e13919e65d79908cd5e02137.1511159909.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e6b3e6532abf42e6e13919e65d79908cd5e02137.1511159909.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 20, 2017 at 7:54 AM, Baolin Wang <baolin.wang@linaro.org> wrote:
> Some system control registers need hardware spinlock to synchronize
> between the multiple subsystems, so we should add hardware spinlock
> support for syscon.
>

> @@ -87,6 +88,12 @@ static struct syscon *of_syscon_register(struct device_node *np)
>         if (ret)
>                 reg_io_width = 4;
>
> +       ret = of_hwspin_lock_get_id(np, 0);
> +       if (ret > 0) {
> +               syscon_config.hwlock_id = ret;
> +               syscon_config.hwlock_mode = HWLOCK_IRQSTATE;
> +       }

Hi Baolin,

The error handling here seems insufficient, I think we have to treat
the following cases separately:

- ret>0 (this is fine)
- no spinlock in DT: of_hwspin_lock_get_id currently returns -EINVAL,
  we probably want to use a different return code (maybe -ESRCH ?)
  here so we can tell the difference beween no spinlock, and an
  invalid spinlock
- deferred probing: if the spinlock is there but the driver is not
  yet available, we may need to propagate the -EPROBE_DEFER
  here
- other error: this would probably be a fatal condition here, and
  we should print a warning and clean up.

       Arnd
