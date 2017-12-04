From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: ARM: Mediatek: Fix ethsys documentation
Date: Mon, 4 Dec 2017 15:48:41 -0600
Message-ID: <20171204214841.mkkrms5fya4pnnwz@rob-hp-laptop>
References: <20171201120708.30129-1-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171201120708.30129-1-matthias.bgg@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: mark.rutland@arm.com, linux@armlinux.org.uk, sboyd@codeaurora.org, sean.wang@mediatek.com, chen.zhong@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 01, 2017 at 01:07:06PM +0100, Matthias Brugger wrote:
> The ethsys registers a reset controller, so we need to specify a
> reset cell. This patch fixes the documentation.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt | 1 +
>  1 file changed, 1 insertion(+)

For all 3,

Reviewed-by: Rob Herring <robh@kernel.org>
