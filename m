From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RESEND v1 1/5] dt-bindings: pinctrl: add wakeup capable
 GPIOs for SDM845
Date: Mon, 20 Aug 2018 17:16:47 -0500
Message-ID: <20180820221647.GA8711@bogus>
References: <20180817191026.32245-1-ilina@codeaurora.org>
 <20180817191026.32245-2-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180817191026.32245-2-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: marc.zyngier@arm.com, bjorn.andersson@linaro.org, sboyd@kernel.org, evgreen@chromium.org, linus.walleij@linaro.org, rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, andy.gross@linaro.org, dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Fri, 17 Aug 2018 13:10:22 -0600, Lina Iyer wrote:
> Update the documentation to use interrupts-extended format for
> specifying the TLMM summary IRQ line that is requested from GIC and the
> PDC interrupts corresponding to the wakeup capable GPIOs.
> 
> Update the example to show PDC interrupts for the wakeup capable GPIOs
> for SDM845.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
>  .../bindings/pinctrl/qcom,sdm845-pinctrl.txt  | 58 ++++++++++++++++++-
>  1 file changed, 55 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
