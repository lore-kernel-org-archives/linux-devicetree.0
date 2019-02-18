From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 13/15] ARM: dts: milbeaut: Add device tree set for the
 Milbeaut M10V board
Date: Mon, 18 Feb 2019 13:09:27 +0100
Message-ID: <CAK8P3a15mLEgVAh1+jQ+GqOcQa0zhrePWofo8iGkTs5_bd=TmQ@mail.gmail.com>
References: <1549628920-32623-1-git-send-email-sugaya.taichi@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549628920-32623-1-git-send-email-sugaya.taichi@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sugaya Taichi <sugaya.taichi@socionext.com>
Cc: DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Takao Orito <orito.takao@socionext.com>, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>, Shinji Kanematsu <kanematsu.shinji@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 8, 2019 at 1:28 PM Sugaya Taichi
<sugaya.taichi@socionext.com> wrote:
> +
> +       aliases {
> +               serial1 = &uart1;
> +       };

Maybe start with serial0 here? It seems unusual to start
counting at 1.

> +       chosen {
> +               bootargs = "init=/sbin/finit rootwait earlycon";

The /sbin/finit argument seems user space specific, so you probably don't
want this in the dts file but rather pass it from the boot loader.
Possible drop the bootargs entirely.

     Arnd
