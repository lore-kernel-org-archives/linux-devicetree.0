From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] DT: net: renesas,ravb: document R8A77980 bindings
Date: Mon, 5 Feb 2018 00:09:29 -0600
Message-ID: <20180205060929.bg2b25fhzi7olhzi@rob-hp-laptop>
References: <1eb6b81c-500e-ef21-7c21-e8bc7a1ff227@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1eb6b81c-500e-ef21-7c21-e8bc7a1ff227@cogentembedded.com>
Sender: netdev-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 01, 2018 at 11:13:45PM +0300, Sergei Shtylyov wrote:
> Renesas R-Car V3H (R8A77980) SoC has the R-Car gen3 compatible EtherAVB
> device, so document the SoC specific bindings.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> The patch is against DaveM's 'net-next.git' repo but I wouldn't mind if it's
> applied to 'net.git' instead. :-)
> 
>  Documentation/devicetree/bindings/net/renesas,ravb.txt |    1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>
