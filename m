From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH V3 0/5] firmware: Add support for TI System Control Interface (TI-SCI) protocol driver
Date: Wed, 07 Sep 2016 11:55:38 -0700
Message-ID: <7hshtbtu8l.fsf@baylibre.com>
References: <20160906190127.23522-1-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <20160906190127.23522-1-nm@ti.com> (Nishanth Menon's message of
        "Tue, 6 Sep 2016 14:01:22 -0500")
Sender: linux-pm-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Cc: Rob Herring <robh@kernel.org>, Tero Kristo <t-kristo@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>, Russell King <rmk+kernel@armlinux.org.uk>, Russ Dill <Russ.Dill@ti.com>, Sudeep Holla <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org, narmstrong@baylibre.com
List-Id: devicetree@vger.kernel.org

Nishanth Menon <nm@ti.com> writes:

> Hi,
>
> Version 3 of the series with change in the way we describe the children
> nodes (no change to drivers required - only the dts description changes).
>
> Texas Instruments' Keystone generation System on Chips (SoC)
> starting with 66AK2G02[1], now include a dedicated SoC System Control
> entity called PMMC(Power Management Micro Controller) in line with
> ARM architecture recommendations. The function of this module is
> to integrate all system operations in a centralized location.
> Communication with the SoC System Control entity from various
> processing units like ARM/DSP occurs over Message Manager hardware
> block.
>
> This series adds the base support for TI System Control Interface
> (TI-SCI) protocol[2]. The protocol is built on top of Texas
> Instrument's Message Manager communication mechanism[3].
>
> Overall architecture is very similar to SCPI[4] as follows:

Dumb Q: I'm curious about the limitations in SCPI that were found that
made TI decided to implement its own version.

Thanks,

Kevin
