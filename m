From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH net-next 02/10] dt-bindings: net: ocelot: remove hsio
 from the list of register address spaces
Date: Tue, 14 Aug 2018 14:41:35 +0200
Message-ID: <20180814124135.GK943@piout.net>
References: <cover.aa759035f6eefdd0bb2a5ae335dab5bd5399bd46.1532954208.git-series.quentin.schulz@bootlin.com>
 <3558e538b55a2249b0a179c04c27e9d3715bbbaa.1532954208.git-series.quentin.schulz@bootlin.com>
 <20180813223103.GA16669@rob-hp-laptop>
 <20180814064953.vboz2gryq4jff34n@qschulz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180814064953.vboz2gryq4jff34n@qschulz>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, andrew@lunn.ch, f.fainelli@gmail.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, allan.nielsen@microsemi.com, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

On 14/08/2018 08:49:53+0200, Quentin Schulz wrote:
> Understood but it's an intermediate patch. Later (patch 8), the SerDes
> muxing "controller" is added as a child to this node. There most likely
> will be some others in the future (temperature sensor for example).
> 
> Furthermore, there's already a simple-mfd without children in this file:
> https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/mips/mscc.txt#L19
> 
> How should we handle this case?
> 

There were child nodes in previous version of the binding. You can
remove simple-mfd now. The useful registers that are not used by any
drivers are gpr and chipid.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
