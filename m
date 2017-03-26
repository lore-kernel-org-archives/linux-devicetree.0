From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/3] firmware: qcom: scm: Expose download-mode control
Date: Sat, 25 Mar 2017 22:13:28 -0700
Message-ID: <20170326051328.GD70446@Bjorns-MacBook-Pro-2.local>
References: <20170318041523.29757-1-bjorn.andersson@linaro.org>
 <20170318041523.29757-2-bjorn.andersson@linaro.org>
 <20170324150633.2s3o3kiecnoeo4qt@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170324150633.2s3o3kiecnoeo4qt@rob-hp-laptop>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, David Brown <david.brown@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri 24 Mar 08:06 PDT 2017, Rob Herring wrote:

> On Fri, Mar 17, 2017 at 09:15:22PM -0700, Bjorn Andersson wrote:
[..]
> > diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> > index 20f26fbce875..8467a181f22c 100644
> > --- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> > +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> > @@ -18,6 +18,7 @@ Required properties:
> >   * Core, iface, and bus clocks required for "qcom,scm"
> >  - clock-names: Must contain "core" for the core clock, "iface" for the interface
> >    clock and "bus" for the bus clock per the requirements of the compatible.
> > +- qcom,dload-mode-addr: Specifies the address for the download mode magic (optional)
> 
> Size? 1 cell, 2 cell(, red cell, blue cell) or follows #addr-cells?
> 

I believe this implementation only applies to the 64-bit systems, but
it's probably better to make it follow (or at least claim that it
follows) #address-cells.

I can update the description to include this.

Regards,
Bjorn
