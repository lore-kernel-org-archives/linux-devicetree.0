From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC 1/3] dt-bindings: cpu: Add Renesas RZ/N1D SMP enable method.
Date: Mon, 16 Apr 2018 16:37:30 -0500
Message-ID: <20180416213730.isfggqngv6zjxahg@rob-hp-laptop>
References: <1523871304-48517-1-git-send-email-michel.pollet@bp.renesas.com>
 <1523871304-48517-3-git-send-email-michel.pollet@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1523871304-48517-3-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michel Pollet <michel.pollet@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, phil.edworthy@renesas.com, buserror+upstream@gmail.com, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Carlo Caione <carlo@endlessm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rajendra Nayak <rnayak@codeaurora.org>, Stefan Wahren <stefan.wahren@i2se.com>, Frank Rowand <frank.rowand@sony.com>, Juri Lelli <juri.lelli@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 16, 2018 at 10:34:57AM +0100, Michel Pollet wrote:
> Add a special enable method for second CA8 of the Renesas RZ/N1D
> (R9A06G032).
> 
> Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.txt | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>
