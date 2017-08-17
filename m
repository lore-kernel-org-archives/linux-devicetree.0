From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: reset: Add Realtek RTD1295
Date: Thu, 17 Aug 2017 16:44:43 -0500
Message-ID: <20170817214443.lez5nxhstkt2pngc@rob-hp-laptop>
References: <20170816003847.6208-1-afaerber@suse.de>
 <20170816003847.6208-2-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170816003847.6208-2-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Roc He <hepeng@zidoo.tv>, =?utf-8?B?6JKL5Li955C0?= <jiang.liqin@geniatech.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 16, 2017 at 02:38:43AM +0200, Andreas Färber wrote:
> Add binding for Realtek RTD1295 reset controller.
> 
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  .../bindings/reset/realtek,rtd129x-reset.txt       |  18 ++++
>  include/dt-bindings/reset/realtek,rtd1295.h        | 112 +++++++++++++++++++++
>  2 files changed, 130 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/realtek,rtd129x-reset.txt
>  create mode 100644 include/dt-bindings/reset/realtek,rtd1295.h

Acked-by: Rob Herring <robh@kernel.org>
