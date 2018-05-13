From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] dt-bindings: net: ravb: Add support for r8a77990 SoC
Date: Sun, 13 May 2018 09:58:05 +0200
Message-ID: <20180513075803.plrkbwmzksjnz45u@verge.net.au>
References: <1526008736-26496-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180511.155942.16024095909155343.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180511.155942.16024095909155343.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: yoshihiro.shimoda.uh@renesas.com, netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, sergei.shtylyov@cogentembedded.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, May 11, 2018 at 03:59:42PM -0400, David Miller wrote:
> From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Date: Fri, 11 May 2018 12:18:56 +0900
> 
> > Add documentation for r8a77990 compatible string to renesas ravb device
> > tree bindings documentation.
> > 
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> I'm assuming this isn't targetted at one of my trees.  Just FYI.

Hi Dave,

I think this is appropriate for net-next but if not I can take it.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>


Shimoda-san,

please use "[PATCH net-next]" for non-bugfix networking updates which
are targeted at Dave's net-next tree. Bug fixes should be for "net".
Patches should of course apply cleanly to whichever tree it is targeted at.
