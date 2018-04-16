From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: power: Add Actions Semi S900 SPS
Date: Mon, 16 Apr 2018 13:48:35 -0500
Message-ID: <20180416184835.paip4cerjemyqcwn@rob-hp-laptop>
References: <20180411164036.8046-1-manivannan.sadhasivam@linaro.org>
 <20180411164036.8046-2-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180411164036.8046-2-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: afaerber@suse.de, liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com, devicetree@vger.kernel.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, hzhang@ucrobotics.com, bdong@ucrobotics.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, manivannanece23@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, Apr 11, 2018 at 10:10:33PM +0530, Manivannan Sadhasivam wrote:
> Define power domains for Actions Semi S900 SoC Smart Power System (SPS).
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../devicetree/bindings/power/actions,owl-sps.txt  |  2 ++
>  include/dt-bindings/power/owl-s900-powergate.h     | 23 ++++++++++++++++++++++
>  2 files changed, 25 insertions(+)
>  create mode 100644 include/dt-bindings/power/owl-s900-powergate.h

Reviewed-by: Rob Herring <robh@kernel.org>
