From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 00/11] mscc: ocelot: add support for SerDes muxing
 configuration
Date: Mon, 03 Sep 2018 22:09:10 -0700 (PDT)
Message-ID: <20180903.220910.899357653888940454.davem@davemloft.net>
References: <20180903093308.24366-1-quentin.schulz@bootlin.com>
        <20180903133415.GF4445@lunn.ch>
        <20180903134522.GC13888@piout.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180903134522.GC13888@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.belloni@bootlin.com
Cc: andrew@lunn.ch, quentin.schulz@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, kishon@ti.com, f.fainelli@gmail.com, allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Mon, 3 Sep 2018 15:45:22 +0200

> On 03/09/2018 15:34:15+0200, Andrew Lunn wrote:
>> > I suggest patches 1 and 8 go through MIPS tree, 2 to 5 and 11 go through
>> > net while the others (6, 7, 9 and 10) go through the generic PHY subsystem.
>> 
>> Hi Quentin
>> 
>> Are you expecting merge conflicts? If not, it might be simpler to gets
>> ACKs from each maintainer, and then merge it though one tree.
>> 
> 
> There are some other DT changes for this cycle so those should probably
> go through MIPS.

No objection for this going through the MIPS tree, and from me:

Acked-by: David S. Miller <davem@davemloft.net>
