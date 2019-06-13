From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 02/16] bindings: soc: ti: add documentation for k3 ringacc
Date: Thu, 13 Jun 2019 12:09:39 -0600
Message-ID: <20190613180939.GA6840@bogus>
References: <20190506123456.6777-1-peter.ujfalusi@ti.com>
 <20190506123456.6777-3-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190506123456.6777-3-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: vkoul@kernel.org, robh+dt@kernel.org, nm@ti.com, ssantosh@kernel.org, dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, grygorii.strashko@ti.com, lokeshvutla@ti.com, t-kristo@ti.com, tony@atomide.com
List-Id: devicetree@vger.kernel.org

On Mon, 6 May 2019 15:34:42 +0300, Peter Ujfalusi wrote:
> From: Grygorii Strashko <grygorii.strashko@ti.com>
> 
> The Ring Accelerator (RINGACC or RA) provides hardware acceleration to
> enable straightforward passing of work between a producer and a consumer.
> There is one RINGACC module per NAVSS on TI AM65x SoCs.
> 
> This patch introduces RINGACC device tree bindings.
> 
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
>  .../devicetree/bindings/soc/ti/k3-ringacc.txt | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/ti/k3-ringacc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
