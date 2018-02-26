Return-Path: <SRS0=x5pc=FU=verge.net.au=horms@kernel.org>
Date: Mon, 26 Feb 2018 11:58:24 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] DT: net: renesas,ravb: document R8A77980 bindings
Message-ID: <20180226105822.ax6zc4gakhifgxzc@verge.net.au>
References: <1eb6b81c-500e-ef21-7c21-e8bc7a1ff227@cogentembedded.com>
 <ad5fce6e-81df-f898-387e-3c40417fe691@cogentembedded.com>
 <20180224.215317.982381501908572398.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180224.215317.982381501908572398.davem@davemloft.net>
To: David Miller <davem@davemloft.net>
Cc: sergei.shtylyov@cogentembedded.com, robh+dt@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sat, Feb 24, 2018 at 09:53:17PM -0500, David Miller wrote:
> From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Date: Sat, 24 Feb 2018 21:01:15 +0300
> 
> > On 02/01/2018 11:13 PM, Sergei Shtylyov wrote:
> > 
> >> Renesas R-Car V3H (R8A77980) SoC has the R-Car gen3 compatible EtherAVB
> >> device, so document the SoC specific bindings.
> >> 
> >> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >> 
> >> ---
> >> The patch is against DaveM's 'net-next.git' repo but I wouldn't mind if it's
> >> applied to 'net.git' instead. :-)
> > 
> >    David, I see this patch was marked as "not applicable" in patchwork. Why, because
> > it was posted during the merge window?
> 
> No because I thought the relevant architecture tree would take a mere
> DT update.

Hi Dave,

I am happy to take these kinds of changes for the ravb and sh_eth drivers
if that is your preference. I am also just as happy for you to take them,
which I think has been the case for similar changes in the past.
