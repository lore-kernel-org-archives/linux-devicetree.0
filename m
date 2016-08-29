From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] phy: rcar-gen3-usb2: revise the example of device
 tree doc
Date: Mon, 29 Aug 2016 10:51:48 -0500
Message-ID: <20160829155148.GA29325@rob-hp-laptop>
References: <1472021362-8085-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1472021362-8085-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1472021362-8085-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: kishon@ti.com, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 24, 2016 at 03:49:21PM +0900, Yoshihiro Shimoda wrote:
> The clocks property should be set to &cpg, not &mstpX_clks.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
