From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 13/17] clk: sunxi-ng: add support for suniv F1C100s SoC
Date: Wed, 28 Nov 2018 16:47:16 -0800
Message-ID: <154345243603.88331.17915868280143383591@swboyd.mtv.corp.google.com>
References: <cover.1543443475.git.mesihkilinc@gmail.com>
 <cc1357c9272628b4d89af007cead83117d9ba6e9.1543443475.git.mesihkilinc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cc1357c9272628b4d89af007cead83117d9ba6e9.1543443475.git.mesihkilinc@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Cc: Mesih Kilinc <mesihkilinc@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Russell King <linux@armlinux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh+dt@kernel.org>, Julian Calaby <julian.calaby@gmail.com>
List-Id: devicetree@vger.kernel.org

Quoting Mesih Kilinc (2018-11-28 14:33:23)
> diff --git a/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c b/drivers/clk/sunxi=
-ng/ccu-suniv-f1c100s.c
> new file mode 100644
> index 0000000..d4bc1b8
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
> @@ -0,0 +1,541 @@
> +/*
> + * Copyright (c) 2016 Icenowy Zheng <icenowy@aosc.io>
> + *
> + * SPDX-License-Identifier: GPL-2.0

Please fix this location.

> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/of_address.h>
> diff --git a/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h b/drivers/clk/sunxi=
-ng/ccu-suniv-f1c100s.h
> new file mode 100644
> index 0000000..1da687a
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h
> @@ -0,0 +1,34 @@
> +/*
> + * Copyright 2017 Icenowy Zheng <icenowy@aosc.io>
> + *
> + * SPDX-License-Identifier: GPL-2.0+

Ditto.

> + */
> +
