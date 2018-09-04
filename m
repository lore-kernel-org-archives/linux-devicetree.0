From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 00/11] mscc: ocelot: add support for SerDes muxing
 configuration
Date: Tue, 04 Sep 2018 10:17:29 -0700 (PDT)
Message-ID: <20180904.101729.1821343612467900393.davem@davemloft.net>
References: <20180903134522.GC13888@piout.net>
        <20180903.220910.899357653888940454.davem@davemloft.net>
        <20180904151653.GI13888@piout.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180904151653.GI13888@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.belloni@bootlin.com
Cc: andrew@lunn.ch, quentin.schulz@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, kishon@ti.com, f.fainelli@gmail.com, allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Tue, 4 Sep 2018 17:16:53 +0200

> What I meant was that 1/11 and 8/11 should go through MIPS because of
> the potential conflicts. The other patches can go through net-next as
> that will make more sense. Maybe Quentin can split the series in two,
> one for MIPS and one for net if that makes it easier for you to apply.

It would make things easier for me.
