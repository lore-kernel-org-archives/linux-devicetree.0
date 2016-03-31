From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 3/5] dt-binding: Add Qualcomm WCNSS control binding
Date: Thu, 31 Mar 2016 10:16:25 -0700
Message-ID: <20160331171625.GZ8929@tuxbot>
References: <1459226126-16725-1-git-send-email-bjorn.andersson@linaro.org>
 <1459226126-16725-3-git-send-email-bjorn.andersson@linaro.org>
 <20160331142817.GA22092@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160331142817.GA22092@rob-hp-laptop>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu 31 Mar 07:28 PDT 2016, Rob Herring wrote:

> On Mon, Mar 28, 2016 at 09:35:24PM -0700, Bjorn Andersson wrote:
[..]
> > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt
> > new file mode 100644
> > index 000000000000..5488904b6185
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt
> > @@ -0,0 +1,104 @@
> > +Qualcomm WCNSS Binding
> > +
> > +This binding describes the Qualcomm WCNSS hardware. It consists of control
> > +block and a BT, WiFi and FM radio block, all useing SMD as command channels.
> > +
> > +- compatible:
> > +	Usage: required
> > +	Value type: <string>
> > +	Definition: must be: "qcom,wcnss",
> 
> This should be more specific.
> 

Okay, will have to go back to Qualcomm and try to figure out what kind
of version there actually is on this component.

[..]
> > += SUBNODES
> > +The subnodes of the wcnss node are optional and describe the individual blocks in
> > +the WCNSS.
> > +
> > +== Bluetooth
> > +The following properties are defined to the bluetooth node:
> > +
> > +- compatible:
> > +	Usage: required
> > +	Value type: <string>
> > +	Definition: must be: "qcom,btqcomsmd"
> 
> This should be more specific to the chip and there's no need to have 
> qcom twice.
> 

There's only a single implementation of this downstream, so same answer
as above...

> > +
> > +== WiFi
> > +The following properties are defined to the WiFi node:
> > +
> > +- compatible:
> > +	Usage: required
> > +	Value type: <string>
> > +	Definition: must be one of:
> > +		    "qcom,wcn3620-wlan",
> > +		    "qcom,wcn3660-wlan",
> > +		    "qcom,wcn3680-wlan"

Digging through documentation and trying to answer the questions above
made me realize that these numbers are for the external rf component,
not the variants of the logic inside the SoC; and as such wrong.

> > +
> > +- qcom,wcnss-mmio:
> > +	Usage: required
> > +	Value type: <prop-encoded-array>
> > +	Definition: should specify base address and size of the WiFi related
> > +		    registers of WCNSS
> 
> This is an address visible to the cpu?
> 

Yes it is; the device is controlled both through SMD and mmio accessible
registers, where the SMD interface is the primary interface.

SMD being the primary "bus" I believe I can't use reg to denote this
register range. Should I describe this in some other form?

Regards,
Bjorn
