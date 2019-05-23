From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] soc: qcom: apr: Don't use reg for domain id
Date: Thu, 23 May 2019 07:45:08 -0700
Message-ID: <20190523144508.GH2085@tuxbook-pro>
References: <20190522015342.29501-1-bjorn.andersson@linaro.org>
 <e7046725-578d-8854-872b-a7837d0fc20a@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e7046725-578d-8854-872b-a7837d0fc20a@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu 23 May 07:38 PDT 2019, Srinivas Kandagatla wrote:

> 
> 
> On 22/05/2019 02:53, Bjorn Andersson wrote:
> > The reg property represents the address and size on the bus that a
> > device lives, but for APR the parent is a rpmsg bus, which does not have
> > numerical addresses. Simply defining #address/#size-cells to 1 and 0,
> > respectively, to silence the compiler is not an appropriate solution.
> > 
> I agree.
> 
> > Replace the use of "reg" with an APR specific property.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> Can you also change the example too.
> 

Of course, sorry for missing that.

> other than that am okay with the change.
> 
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 

Thanks,
Bjorn

> --srini
> > 
> > The APR device was recently added to msm8996.dtsi, but this is still
> > depending on working SMMU to provide functional audio support.
> > 
> >   Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt | 2 +-
> >   drivers/soc/qcom/apr.c                                  | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
> > index bcc612cc7423..38d3c06abc41 100644
> > --- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
> > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
> > @@ -9,7 +9,7 @@ used for audio/voice services on the QDSP.
> >   	Value type: <stringlist>
> >   	Definition: must be "qcom,apr-v<VERSION-NUMBER>", example "qcom,apr-v2"
> > -- reg
> > +- qcom,apr-domain
> >   	Usage: required
> >   	Value type: <u32>
> >   	Definition: Destination processor ID.
> > diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
> > index 74f8b9607daa..b83d71b2e0a4 100644
> > --- a/drivers/soc/qcom/apr.c
> > +++ b/drivers/soc/qcom/apr.c
> > @@ -276,7 +276,7 @@ static int apr_probe(struct rpmsg_device *rpdev)
> >   	if (!apr)
> >   		return -ENOMEM;
> > -	ret = of_property_read_u32(dev->of_node, "reg", &apr->dest_domain_id);
> > +	ret = of_property_read_u32(dev->of_node, "qcom,apr-domain", &apr->dest_domain_id);
> >   	if (ret) {
> >   		dev_err(dev, "APR Domain ID not specified in DT\n");
> >   		return ret;
> > 
