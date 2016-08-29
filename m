From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/3] Add R8A7792/Wheat board support
Date: Mon, 29 Aug 2016 11:02:46 +0200
Message-ID: <20160829090245.GB12085@verge.net.au>
References: <3665116.9BjHTnhfR3@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3665116.9BjHTnhfR3@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 26, 2016 at 11:16:49PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
>    Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-20160826-v4.8-rc3' tag. We add the device tree support for
> the R8A7792-based Wheat board. I have only sparse board documentation
> at this point, according to which this board somewhat differs from the other
> R-Car evaluation boards in that it has debug serial port, debug Ethernet chip,
> and a NOR flash on the separate debug board (connected to the main board
> with a ribbon cable). I'm not sure how to approach this (DT overlay, perhaps?),
> for now I'm just posting the debug UART/Ethernet support the same way it was
> done for the Blanche board -- these components seem to be the same between 
> these 2 boards...
> 
> [1/3] DT: arm: shmobile: document Wheat board
> [2/3] ARM: dts: wheat: initial device tree
> [3/3] ARM: dts: wheat: add Ethernet support

Thanks, I have queued this up.
