From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: net: renesas-ravb: Make stream buffer
 optional
Date: Fri, 9 Feb 2018 16:55:02 -0600
Message-ID: <20180209225502.sxaccekae5kpvbqx@rob-hp-laptop>
References: <1517922354-28421-1-git-send-email-geert+renesas@glider.be>
 <1517922354-28421-2-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1517922354-28421-2-git-send-email-geert+renesas@glider.be>
Sender: netdev-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "David S . Miller" <davem@davemloft.net>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 06, 2018 at 02:05:52PM +0100, Geert Uytterhoeven wrote:
> The Stream Buffer for EtherAVB-IF (STBE) is an optional component, and
> is not present on all SoCs.
> 
> Document this in the DT bindings, including a list of SoCs that do have
> it.
> 
> Fixes: 785ec87483d1e24a ("ravb: document R8A77970 bindings")
> Fixes: f231c4178a655b09 ("dt-bindings: net: renesas-ravb: Add support for R8A77995 RAVB")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/net/renesas,ravb.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
