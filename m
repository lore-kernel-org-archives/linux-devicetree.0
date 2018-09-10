From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: pinctrl: add wakeup capable GPIOs
 for SDM845
Date: Mon, 10 Sep 2018 11:28:22 -0500
Message-ID: <20180910162822.GA5636@bogus>
References: <20180904211810.5506-1-ilina@codeaurora.org>
 <20180904211810.5506-3-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180904211810.5506-3-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>
Cc: marc.zyngier@arm.com, bjorn.andersson@linaro.org, sboyd@kernel.org, evgreen@chromium.org, linus.walleij@linaro.org, rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, andy.gross@linaro.org, dianders@chromium.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 04, 2018 at 03:18:07PM -0600, Lina Iyer wrote:
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
>  .../bindings/pinctrl/qcom,sdm845-pinctrl.txt  | 104 +++++++++++++++++-
>  1 file changed, 101 insertions(+), 3 deletions(-)

As I also mentioned in v2. Please add acks/reviewed-bys when posting new 
versions.

Rob
