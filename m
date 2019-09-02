From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 2/2] dt-bindings: reset: pdc: Convert PDC Global
 bindings to yaml
Date: Mon, 02 Sep 2019 17:14:34 +0200
Message-ID: <1567437274.3666.9.camel@pengutronix.de>
References: <20190901174407.30756-1-sibis@codeaurora.org>
         <20190901174407.30756-3-sibis@codeaurora.org>
         <20190902150138.GA29400@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190902150138.GA29400@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Sibi Sankar <sibis@codeaurora.org>
Cc: robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, sboyd@kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 2019-09-02 at 16:01 +0100, Rob Herring wrote:
> On Sun,  1 Sep 2019 23:14:07 +0530, Sibi Sankar wrote:
> > Convert PDC Global bindings to yaml and add SC7180 PDC global to the list
> > of possible bindings.
> > 
> > Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> > ---
> >  .../bindings/reset/qcom,pdc-global.txt        | 52 -------------------
> >  .../bindings/reset/qcom,pdc-global.yaml       | 47 +++++++++++++++++
> >  2 files changed, 47 insertions(+), 52 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
> >  create mode 100644 Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Thank you, both applied to reset/next.

regards
Philipp
