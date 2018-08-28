From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: pinctrl: add wakeup capable GPIOs
 for SDM845
Date: Tue, 28 Aug 2018 15:23:45 -0500
Message-ID: <20180828202345.GA18349@bogus>
References: <20180824200157.9993-1-ilina@codeaurora.org>
 <20180824200157.9993-3-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180824200157.9993-3-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>
Cc: marc.zyngier@arm.com, bjorn.andersson@linaro.org, sboyd@kernel.org, evgreen@chromium.org, linus.walleij@linaro.org, rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, andy.gross@linaro.org, dianders@chromium.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 24, 2018 at 02:01:54PM -0600, Lina Iyer wrote:
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
> Changes in v2:
> 	- Fix PDC IRQ number in example
> 	- Describe IRQ trigger type in example
> ---

Please add acks/reviewed-bys when posting new versions. These changes 
look trivial enough to have kept my R-by.

>  .../bindings/pinctrl/qcom,sdm845-pinctrl.txt  | 104 +++++++++++++++++-
>  1 file changed, 101 insertions(+), 3 deletions(-)
