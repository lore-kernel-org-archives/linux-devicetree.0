From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: shmobile: silk: add DU DT support
Date: Mon, 18 Jan 2016 10:41:14 +0900
Message-ID: <20160118014114.GC1905@verge.net.au>
References: <1674850.BZpGW9kEud@wasted.cogentembedded.com>
 <20467499.tt8XqkxVqn@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20467499.tt8XqkxVqn@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 13, 2016 at 02:06:08AM +0300, Sergei Shtylyov wrote:
> Define  the SILK board dependent part of the DU device node.
> Add the device nodes for the Analog Devices ADV7511W HDMI transmitter
> (connected to DU0) and ADV7123  video DAC (connected to DU1). Add the
> necessary subnodes to interconnect DU, HDMI/VDAC devices, and HDMI/VGA
> connectors.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks, I have queued this up for v4.6 after updating the subject with
s/shmobile/dts/ to reflect a request made from the ARM SoC maintainers
regarding prefixes for DT patches.
