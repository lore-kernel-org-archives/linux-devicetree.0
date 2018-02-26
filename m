From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v8 3/9] mfd: madera: Add common support for Cirrus Logic
 Madera codecs
Date: Mon, 26 Feb 2018 10:58:12 -0300
Message-ID: <CAOMZO5DEiwUBsMWfR-a6UgEkEeXvWqXPFAf0pPcwpeJY540xGg@mail.gmail.com>
References: <20180226130558.7634-1-rf@opensource.cirrus.com> <20180226130558.7634-4-rf@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180226130558.7634-4-rf@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 26, 2018 at 10:05 AM, Richard Fitzgerald
<rf@opensource.cirrus.com> wrote:

> --- /dev/null
> +++ b/drivers/mfd/madera-core.c
> @@ -0,0 +1,602 @@
> +// SPDX-License-Identifier: GPL-2.0

As you use SPDX line here....

> +/*
> + * Core MFD support for Cirrus Logic Madera codecs
> + *
> + * Copyright (C) 2015-2018 Cirrus Logic
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; version 2.

You can remove this paragraph.

Same applies to the other places of this series.
