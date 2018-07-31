Return-Path: <vkoul@kernel.org>
Date: Tue, 31 Jul 2018 11:58:17 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v6 3/3] input: pm8941-pwrkey: Add resin entry
Message-ID: <20180731062817.GB2421@vkoul-mobl>
References: <20180731044807.16878-1-vkoul@kernel.org>
 <20180731044807.16878-4-vkoul@kernel.org>
 <20180731061342.GA114542@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180731061342.GA114542@dtor-ws>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 30-07-18, 23:13, Dmitry Torokhov wrote:
> Hi Vinod,
> 
> On Tue, Jul 31, 2018 at 10:18:07AM +0530, Vinod Koul wrote:
> > Since handling is abstracted in this driver, we need to add resin entry
> > in id table along with pwrkey_data.
> > 
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> 
> I added "qcom,pm8941-resin" to the binding doc and applied. Thank you.

That is also fine, I wasn't sure of the preference and sent as separate
ones. Thanks for applying

-- 
~Vinod
