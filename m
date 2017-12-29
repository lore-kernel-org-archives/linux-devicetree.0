From: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Subject: Re: [PATCH v4 06/15] clk: Add Ingenic jz4770 CGU driver
Date: Fri, 29 Dec 2017 13:55:12 +0100
Message-ID: <CAOFm3uEbEx+HTsOANchqiReuDBa96O0Y-V-igLGWPF-OxQ2jtw@mail.gmail.com>
References: <20170702163016.6714-2-paul@crapouillou.net> <20171228135634.30000-1-paul@crapouillou.net>
 <20171228135634.30000-7-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171228135634.30000-7-paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maarten ter Huurne <maarten-Ph2Y2OKCxY1M656bX5wj8A@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Mr Crapouillou-Cercueil-Sir,

On Thu, Dec 28, 2017 at 2:56 PM, Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org> wrote:
> Add support for the clocks provided by the CGU in the Ingenic JZ4770
> SoC.

<snip>

> --- /dev/null
> +++ b/drivers/clk/ingenic/jz4770-cgu.c
> @@ -0,0 +1,487 @@
> +/*
> + * JZ4770 SoC CGU driver
> + *
> + * Copyright 2017, Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 or later
> + * as published by the Free Software Foundation.
> + */

Do you mind using a simpler one-line SPDX identifier instead of this
fine but clearly crapouillish legalese boilerplate? Unless you are
trying to turn the kernel in a legal compendium, of course ;)

This is documented in Thomas doc patches. This would apply to your
entire patch set.
Thank you for your kind consideration!
-- 
Cordially
Philippe Ombredanne
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
