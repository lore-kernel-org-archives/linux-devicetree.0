From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r8a77995: Remove non-existing
 STBE region
Date: Wed, 7 Feb 2018 10:45:35 +0100
Message-ID: <20180207094534.yuydjkdtxmgkddm4@verge.net.au>
References: <1517922354-28421-1-git-send-email-geert+renesas@glider.be>
 <1517922354-28421-4-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1517922354-28421-4-git-send-email-geert+renesas@glider.be>
Sender: netdev-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "David S . Miller" <davem@davemloft.net>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 06, 2018 at 02:05:54PM +0100, Geert Uytterhoeven wrote:
> R-Car D3 does not have the Stream Buffer for EtherAVB-IF (STBE).
> 
> Note that the RAVB driver does not use this region.
> 
> Fixes: f9ba0c4cfe6169b7 ("arm64: dts: renesas: r8a77995: Add EthernetAVB device node")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.17.
