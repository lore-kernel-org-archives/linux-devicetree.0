From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] dt-binding: remoteproc: Fixup ADSP loader bindings
Date: Wed, 9 Nov 2016 18:52:27 -0600
Message-ID: <20161110005227.7zammvklgscdo2lu@rob-hp-laptop>
References: <1478122689-5117-1-git-send-email-spjoshi@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1478122689-5117-1-git-send-email-spjoshi@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sarangdhar Joshi <spjoshi@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Trilok Soni <tsoni@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 02, 2016 at 02:38:09PM -0700, Sarangdhar Joshi wrote:
> Fixup "dt-binding: remoteproc: Introduce ADSP loader binding"
> patch to include XO clock required for booting up Qualcomm ADSP
> Processor.

I don't think this is accepted yet, so please squash this into the ADSP 
binding.

> 
> Signed-off-by: Sarangdhar Joshi <spjoshi@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
