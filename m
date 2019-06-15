From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2] soc: qcom: apr: Don't use reg for domain id
Date: Sat, 15 Jun 2019 00:07:29 -0700
Message-ID: <20190615070729.GB31088@tuxbook-pro>
References: <20190523150153.13136-1-bjorn.andersson@linaro.org>
 <20190614165724.GA3083@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190614165724.GA3083@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri 14 Jun 09:57 PDT 2019, Rob Herring wrote:

> On Thu, 23 May 2019 08:01:53 -0700, Bjorn Andersson wrote:
> > The reg property represents the address and size on the bus that a
> > device lives, but for APR the parent is a rpmsg bus, which does not have
> > numerical addresses. Simply defining #address/#size-cells to 1 and 0,
> > respectively, to silence the compiler is not an appropriate solution.
> > 
> > Replace the use of "reg" with an APR specific property.
> > 
> > Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> > Changes since v1:
> > - Fixed example to match change
> > 
> >  Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt | 6 +++---
> >  drivers/soc/qcom/apr.c                                  | 2 +-
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks Rob, patch applied.

Regards,
Bjorn
