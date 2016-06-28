From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/2] Documentation: dt: reset: Add TI syscon reset
 binding
Date: Tue, 28 Jun 2016 15:57:38 -0500
Message-ID: <20160628205738.GX3737@rob-hp-laptop>
References: <20160627171217.4715-1-afd@ti.com>
 <20160627171217.4715-2-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160627171217.4715-2-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Suman Anna <s-anna@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 27, 2016 at 12:12:16PM -0500, Andrew F. Davis wrote:
> Add TI syscon reset controller binding. This will hook to the reset
> framework and use syscon/regmap to set reset bits. This allows reset
> control of individual SoC subsytems and devices with memory-mapped
> reset registers in a common register memory space.
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  .../devicetree/bindings/reset/ti-syscon-reset.txt  | 91 ++++++++++++++++++++++
>  include/dt-bindings/reset/ti-syscon.h              | 38 +++++++++
>  2 files changed, 129 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
>  create mode 100644 include/dt-bindings/reset/ti-syscon.h

Acked-by: Rob Herring <robh@kernel.org>
