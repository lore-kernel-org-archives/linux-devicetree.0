From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: net: Add Qualcomm ethqos binding
Date: Thu, 17 Jan 2019 09:33:30 +0530
Message-ID: <20190117040330.GE13372@vkoul-mobl.Dlink>
References: <20190108162926.17806-1-vkoul@kernel.org>
 <20190108162926.17806-2-vkoul@kernel.org>
 <20190115210317.GA12206@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190115210317.GA12206@bogus>
Sender: netdev-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: David S Miller <davem@davemloft.net>, netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, Niklas Cassel <niklas.cassel@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 15-01-19, 15:03, Rob Herring wrote:
> On Tue, Jan 08, 2019 at 09:59:22PM +0530, Vinod Koul wrote:
> > Add support for Qualcomm ethqos found in some SoCs like QCS404.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  .../devicetree/bindings/net/qcom,dwmac.txt    | 129 ++++++++++++++++++
> >  1 file changed, 129 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/qcom,dwmac.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/net/qcom,dwmac.txt b/Documentation/devicetree/bindings/net/qcom,dwmac.txt
> > new file mode 100644
> > index 000000000000..652d2213c3ac
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/qcom,dwmac.txt
> 
> qcom,ethqos.txt?

Sure, will update

> > @@ -0,0 +1,129 @@
> > +Qualcomm Ethernet ETHQOS device
> > +
> 
> Perhaps some details like speeds and version of IP. There's lots of 
> variants.

yeah it does Gigabit, so will update that as well.

> 
> > +This device has following properties:
> > +
> > +Required properties:
> > +
> > +- compatible: Should be qcom,ethqos-qcs404"
> 
> qcom,qcs404-ethqos

Makes sense, thanks

-- 
~Vinod
