From: John Crispin <john@phrozen.org>
Subject: Re: [PATCH v1 3/3] net: ethernet: add ag71xx driver
Date: Wed, 17 Apr 2019 09:46:25 +0200
Message-ID: <e7b75751-85fe-db7a-a39e-d1991e104403@phrozen.org>
References: <20190417062201.15745-1-o.rempel@pengutronix.de>
 <20190417062201.15745-4-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190417062201.15745-4-o.rempel@pengutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksij Rempel <o.rempel@pengutronix.de>, Paul Burton <paul.burton@mips.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Jay Cliburn <jcliburn@gmail.com>, Chris Snook <chris.snook@gmail.com>, "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 17/04/2019 08:22, Oleksij Rempel wrote:
> index 000000000000..0e1374ddac63
> --- /dev/null
> +++ b/drivers/net/ethernet/atheros/ag71xx.c
> @@ -0,0 +1,1971 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Atheros AR71xx built-in ethernet mac driver
> + *
> + *  Copyright (C) 2019 Oleksij Rempel<o.rempel@pengutronix.de>
> + *  Copyright (C) 2008-2010 Gabor Juhos<juhosg@openwrt.org>
> + *  Copyright (C) 2008 Imre Kaloz<kaloz@openwrt.org>
> + *

Hi,

I think this list needs to be extended by quite a bit. we should to a 
git log --follow inside the openwrt tree. a ton of people have done a 
lot of work on the codebase over the years.

     John


> + *  Based on Atheros' AG7100 driver
> + */
