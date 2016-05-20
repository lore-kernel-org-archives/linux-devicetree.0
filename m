From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 03/12] of: add J-Core interrupt controller bindings
Date: Fri, 20 May 2016 10:04:26 +0200
Message-ID: <CAMuHMdVs9=8BGwmCBuYch2abJBnCLKoEx7i3EMghW3UUjXc7dA@mail.gmail.com>
References: <cover.1463708766.git.dalias@libc.org>
	<2bdca4260d5bb2b3820e4309e2ba445c4c7bfbf6.1463708766.git.dalias@libc.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <2bdca4260d5bb2b3820e4309e2ba445c4c7bfbf6.1463708766.git.dalias@libc.org>
Sender: linux-sh-owner@vger.kernel.org
To: Rich Felker <dalias@libc.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jason Cooper <jason@lakedaemon.net>, Kumar Gala <galak@codeaurora.org>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Fri, May 20, 2016 at 4:53 AM, Rich Felker <dalias@libc.org> wrote:
> +Additional properties required for aic1:
> +
> +- reg : Memory region for configuration.
> +
> +- cpu-offset : For SMP, the offset to the per-cpu memory region for
> +  configuration, to be scaled by the cpu number.

Does cpu-offset apply to aic1 only?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
