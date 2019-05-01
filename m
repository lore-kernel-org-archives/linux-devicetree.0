From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: Document external clocks for
 MSM8998 gcc
Date: Wed, 1 May 2019 14:48:54 -0500
Message-ID: <20190501194854.GA10996@bogus>
References: <1556677404-29194-1-git-send-email-jhugo@codeaurora.org>
 <1556677473-29242-1-git-send-email-jhugo@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1556677473-29242-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, agross@kernel.org, bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Tue, 30 Apr 2019 20:24:33 -0600, Jeffrey Hugo wrote:
> The global clock controller on MSM8998 can consume a number of external
> clocks.  Document them.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
