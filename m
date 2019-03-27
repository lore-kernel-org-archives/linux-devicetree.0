From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: remoteproc: Rename qcom,adsp binding
 document
Date: Wed, 27 Mar 2019 18:43:36 -0500
Message-ID: <20190327234336.GA20438@bogus>
References: <20190306232220.32722-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190306232220.32722-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed,  6 Mar 2019 15:22:20 -0800, Bjorn Andersson wrote:
> The qcom,adsp binding document has evolved to cover the mechanism to
> load and boot firmware on a range of different Hexagon based remote
> subsystems. Rename the binding and update the description to better
> capture this.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../{qcom,adsp.txt => qcom,q6v5-pas.txt}          | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>  rename Documentation/devicetree/bindings/remoteproc/{qcom,adsp.txt => qcom,q6v5-pas.txt} (88%)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
