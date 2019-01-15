From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 1/2] arm64: dts: marvell: Add device tree for uDPU board
Date: Tue, 15 Jan 2019 14:42:29 +0100
Message-ID: <20190115134229.GE19687@lunn.ch>
References: <20190111172055.30451-1-vladimir.vid@sartura.hr>
 <20190115121113.5636-1-vladimir.vid@sartura.hr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190115121113.5636-1-vladimir.vid@sartura.hr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vladimir Vid <vladimir.vid@sartura.hr>
Cc: devicetree@vger.kernel.org, Luis Torres <luis.torres@methode.com>, Paul Arola <paul.arola@telus.com>, Scott Roberts <scott.roberts@telus.com>, Luka Perkov <luka.perkov@sartura.hr>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Device tree for the uDPU board.
> + * Based on Marvell Armada 3720 development board (DB-88F3720-DDR3)
> + * Copyright (C) 2016 Marvell
> + * Copyright (C) 2018 Methode
> + * Copyright (C) 2018 Telus

2019?

> + *
> + * Vladimir Vid <vladimir.vid@sartura.hr>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include "armada-372x.dtsi"
> +
> +/ {
> +	model = "Methode uDPU Board";
> +	compatible = "marvell,armada-3720-db", "marvell,armada3720",
> +		     "marvell,armada3710", "methode,udpu";

Compatible strings are sorted as most specific to most generic. So
"methode,udpu" should be first. "marvell,armada-3720-db" can probably
be dropped.

   Andrew
