From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: add binding for Rockchip OTP
 controller
Date: Mon, 14 Oct 2019 14:50:00 -0500
Message-ID: <20191014195000.GA17233@bogus>
References: <20190925184957.14338-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190925184957.14338-1-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
Cc: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, christoph.muellner@theobroma-systems.com, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

On Wed, 25 Sep 2019 20:49:56 +0200, Heiko Stuebner wrote:
> Newer Rockchip SoCs use a different IP for accessing special one-
> time-programmable memory, so add a binding for these controllers.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  .../bindings/nvmem/rockchip-otp.txt           | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/rockchip-otp.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
