Return-Path: <SRS0=/eRK=FO=nexb.com=pombredanne@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180216170033.3834-2-mdf@kernel.org>
References: <20180216170033.3834-1-mdf@kernel.org> <20180216170033.3834-2-mdf@kernel.org>
From: Philippe Ombredanne <pombredanne@nexb.com>
Date: Tue, 20 Feb 2018 08:45:39 +0100
Message-ID: <CAOFm3uFjoR+qpOR0tHUk78h4BA-qeweoqs3+y_ut==Q34V-0Sw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] net: ethernet: nixge: Add support for National
 Instruments XGE netdev
Content-Type: text/plain; charset="UTF-8"
To: Moritz Fischer <mdf@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>
List-ID: <devicetree@vger.kernel.org>

Hi Moritz,

On Fri, Feb 16, 2018 at 6:00 PM, Moritz Fischer <mdf@kernel.org> wrote:
> Add support for the National Instruments XGE 1/10G network device.
>
> It uses the EEPROM on the board via NVMEM.
>
> Signed-off-by: Moritz Fischer <mdf@kernel.org>

<snip>

> --- /dev/null
> +++ b/drivers/net/ethernet/ni/nixge.c
> @@ -0,0 +1,1352 @@
> +// SPDX-License-Identifier: GPL-2.0

<snip>

> +MODULE_LICENSE("GPL");

This does not match your license above. Per module.h "GPL" would mean "GPL-2.0+"
Can you use one or the other an\d ensure both of these are in sync?

-- 
Cordially
Philippe Ombredanne
