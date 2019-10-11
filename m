From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: display: clps711x-fb: fix
 native-mode setting
Date: Fri, 11 Oct 2019 10:30:21 -0500
Message-ID: <20191011153021.GA10765@bogus>
References: <20190918193853.25689-1-martin@kaiser.cx>
 <20191005130921.12874-1-martin@kaiser.cx>
 <20191005130921.12874-3-martin@kaiser.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191005130921.12874-3-martin@kaiser.cx>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Alexander Shiyan <shc_work@mail.ru>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
List-Id: devicetree@vger.kernel.org

On Sat,  5 Oct 2019 15:09:21 +0200, Martin Kaiser wrote:
> Move the native-mode setting inside the display-timing node. Outside of
> display-timing, it is ignored.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
> changes in v2
>  fix the example in this binding as well
> 
>  Documentation/devicetree/bindings/display/cirrus,clps711x-fb.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks.

Rob
