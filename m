From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 11/13] dt-bindings: document PX30 usb2phy General
 Register Files
Date: Mon, 30 Sep 2019 17:58:40 -0500
Message-ID: <20190930225840.GA14866@bogus>
References: <20190917082659.25549-1-heiko@sntech.de>
 <20190917082659.25549-11-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190917082659.25549-11-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-rockchip@lists.infradead.org, christoph.muellner@theobroma-systems.com, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

On Tue, 17 Sep 2019 10:26:57 +0200, Heiko Stuebner wrote:
> One of the separate General Register Files contains the registers for
> controlling the usb2phy, so add the necessary binding compatible for it.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  Documentation/devicetree/bindings/soc/rockchip/grf.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
