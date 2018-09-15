From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next v3 08/11] MIPS: mscc: ocelot: add SerDes mux DT
 node
Date: Fri, 14 Sep 2018 19:30:01 -0700
Message-ID: <d7ca96be-5a66-0a9a-62b2-936595122058@gmail.com>
References: <cover.ff40d591b548a6da31716e6e600f11a303e0e643.1536912834.git-series.quentin.schulz@bootlin.com>
 <ba95add3d931177ef55666e856164523903d1148.1536912834.git-series.quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ba95add3d931177ef55666e856164523903d1148.1536912834.git-series.quentin.schulz@bootlin.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>, alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, andrew@lunn.ch
Cc: allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org



On 09/14/18 01:16, Quentin Schulz wrote:
> The Microsemi Ocelot has a set of register for SerDes/switch port muxing
> as well as PCIe muxing for a specific SerDes, so let's add the device
> and all SerDes in the Device Tree.
> 
> Acked-by: Paul Burton <paul.burton@mips.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
