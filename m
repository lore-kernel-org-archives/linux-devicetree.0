From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/4] net: dsa: vsc73xx: add support for parallel mode
Date: Thu, 4 Jul 2019 09:16:10 +0200
Message-ID: <CACRpkdaLZ8XeyLhH_mzwb5phRNvuwuUgecWKBVa1Z7L0QqH_bw@mail.gmail.com>
References: <20190703171924.31801-1-paweldembicki@gmail.com> <20190703171924.31801-4-paweldembicki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703171924.31801-4-paweldembicki@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Dembicki <paweldembicki@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev <netdev@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Pawel,

this looks overall good and the following is just
documentation nit-pick so feel free to add my
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

On Wed, Jul 3, 2019 at 7:21 PM Pawel Dembicki <paweldembicki@gmail.com> wrote:

> This patch add platform part of vsc73xx driver.
> It allows to use chip connected by parallel interface.
>
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>

I would elaborate on the fact that we're dealing with memory-mapped
I/O but perhaps even more important to do that in the source code file and
Kconfig so it is close to the users rather than in the changelog.

Write something about the address bus wireing making all
accesses big endian.

> +config NET_DSA_VITESSE_VSC73XX_PLATFORM
> +       tristate "Vitesse VSC7385/7388/7395/7398 Platform mode support"
> +       depends on HAS_IOMEM
> +       select NET_DSA_VITESSE_VSC73XX
> +       ---help---
> +         This enables support for the Vitesse VSC7385, VSC7388, VSC7395
> +         and VSC7398 SparX integrated ethernet switches in Platform managed mode.

I would insert something about memory-mapped I/O mode
over a CPU-attached address bus.

Yours,
Linus Walleij
