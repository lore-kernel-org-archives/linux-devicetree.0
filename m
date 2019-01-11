From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: clock: Add DT bindings for Actions Semi
 S500 CMU
Date: Fri, 11 Jan 2019 08:56:42 -0600
Message-ID: <20190111145642.GA25726@bogus>
References: <20181231185517.18517-1-manivannan.sadhasivam@linaro.org>
 <20181231185517.18517-3-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181231185517.18517-3-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: sboyd@kernel.org, mturquette@baylibre.com, afaerber@suse.de, linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Edgar Bernardi Righi <edgar.righi@lsitec.org.br>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 01, 2019 at 12:25:13AM +0530, Manivannan Sadhasivam wrote:
> From: Edgar Bernardi Righi <edgar.righi@lsitec.org.br>
> 
> Add devicetree bindings for Actions Semi S500 Clock Management Unit.
> 
> Signed-off-by: Edgar Bernardi Righi <edgar.righi@lsitec.org.br>
> [Mani: Documented S500 CMU compatible]
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
> 
> Rob, I have removed your Reviewed-by tag for this patch since the
> earlier revision contained only bindings constants and lacked the
> compatible documentation, which is added now.
> 
>  .../bindings/clock/actions,owl-cmu.txt        |  7 +-
>  include/dt-bindings/clock/actions,s500-cmu.h  | 78 +++++++++++++++++++
>  2 files changed, 82 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/clock/actions,s500-cmu.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/actions,owl-cmu.txt b/Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
> index 2ef86ae96df8..86183f559022 100644
> --- a/Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
> +++ b/Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
> @@ -2,13 +2,14 @@
>  
>  The Actions Semi Owl Clock Management Unit generates and supplies clock
>  to various controllers within the SoC. The clock binding described here is
> -applicable to S900 and S700 SoC's.
> +applicable to S900,S700 and S500 SoC's.

space needed after the ','.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
