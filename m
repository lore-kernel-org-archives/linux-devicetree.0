From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77970: Remove non-existing
 STBE region
Date: Wed, 7 Feb 2018 10:45:20 +0100
Message-ID: <20180207094519.bvq24lgacqsopnbc@verge.net.au>
References: <1517922354-28421-1-git-send-email-geert+renesas@glider.be>
 <1517922354-28421-3-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1517922354-28421-3-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "David S . Miller" <davem@davemloft.net>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 06, 2018 at 02:05:53PM +0100, Geert Uytterhoeven wrote:
> R-Car V3M does not have the Stream Buffer for EtherAVB-IF (STBE).
> 
> Note that the RAVB driver does not use this region.
> 
> Fixes: bea2ab136eaacec2 ("arm64: dts: renesas: r8a77970: add EtherAVB support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.17.
