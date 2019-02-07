From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: reset: Add HI3670 reset controller
 binding
Date: Thu, 7 Feb 2019 16:47:26 +0530
Message-ID: <20190207111726.GA30269@Mani-XPS-13-9360>
References: <20190201153841.21903-1-manivannan.sadhasivam@linaro.org>
 <20190201153841.21903-2-manivannan.sadhasivam@linaro.org>
 <1549536094.4557.8.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1549536094.4557.8.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: xuwei5@hisilicon.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, guodong.xu@linaro.org
List-Id: devicetree@vger.kernel.org

Hi Philipp,

On Thu, Feb 07, 2019 at 11:41:34AM +0100, Philipp Zabel wrote:
> Hi Manivannan,
> 
> On Fri, 2019-02-01 at 21:08 +0530, Manivannan Sadhasivam wrote:
> > HI3670 SoC is architecturally same as the HI3660 SoC. Hence, the same
> > driver is reused for HI3670 SoC and the binding is documented here.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  .../devicetree/bindings/reset/hisilicon,hi3660-reset.txt     | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt b/Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt
> > index 2bf3344b2a02..5d60ec541331 100644
> > --- a/Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt
> > +++ b/Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt
> > @@ -5,11 +5,12 @@ Please also refer to reset.txt in this directory for common reset
> >  controller binding usage.
> >  
> >  The reset controller registers are part of the system-ctl block on
> > -hi3660 SoC.
> > +hi3660 and hi3670 SoCs.
> >  
> >  Required properties:
> > -- compatible: should be
> > +- compatible: should be one of the following:
> >  		 "hisilicon,hi3660-reset"
> > +		 "hisilicon,hi3670-reset"
> 
> If the HI3670 reset controller is compatible to the HI3660 reset
> controller, this could be:
> 
> - compatible: should be one of the following:
>               "hisilicon,hi3660-reset" for HI3660
>               "hisilicon,hi3670-reset", "hisilicon,hi3660-reset" for HI3670
> 
> That way there would be no need to change the driver and it would be
> documented that the two reset controllers are compatible.
> 

Yeah, I thought about the fallback approach initially but was unsure
about which method to adopt. Will use fallback compatible in next
revision.

Thanks,
Mani

> regards
> Philipp
