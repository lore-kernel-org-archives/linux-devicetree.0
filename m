From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: reset: Add devicetree binding for
 BM1880 reset controller
Date: Wed, 1 May 2019 19:43:07 -0500
Message-ID: <20190502004307.GA2033@bogus>
References: <20190425125508.5965-1-manivannan.sadhasivam@linaro.org>
 <20190425125508.5965-2-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190425125508.5965-2-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: p.zabel@pengutronix.de, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, 25 Apr 2019 18:25:06 +0530, Manivannan Sadhasivam wrote:
> Add devicetree binding for Bitmain BM1880 SoC reset controller. This SoC
> has two reset controllers each controlling reset lines of different
> peripherals.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../bindings/reset/bitmain,bm1880-reset.txt   |  18 +++
>  .../dt-bindings/reset/bitmain,bm1880-reset.h  | 106 ++++++++++++++++++
>  2 files changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/bitmain,bm1880-reset.txt
>  create mode 100644 include/dt-bindings/reset/bitmain,bm1880-reset.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
