From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: Add Actions S900 clock
 bindings
Date: Mon, 6 Nov 2017 16:44:09 -0600
Message-ID: <20171106224409.7viz5ylvdszeorxk@rob-hp-laptop>
References: <1509997552-29718-1-git-send-email-manivannan.sadhasivam@linaro.org>
 <1509997552-29718-2-git-send-email-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1509997552-29718-2-git-send-email-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, afaerber@suse.de, mark.rutland@arm.com, liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com, devicetree@vger.kernel.org, arnd@arndb.de, davem@davemloft.net, mchehab@kernel.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, viresh.kumar@linaro.org, manivannanece23@gmail.com
List-Id: devicetree@vger.kernel.org

On Tue, Nov 07, 2017 at 01:15:50AM +0530, Manivannan Sadhasivam wrote:
> Add Actions Semi S900 clock bindings.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
> Changes in v2:
> 
> 1. Added binding header to this patch
> 2. Changed clock-controller node name to cmu
> 3. Added clocks property to cmu node
> 4. Changed compatible property value to "actions,s900-cmu"
> 5. Fixed example UART controller node
> 6. Fixed tab vs space issue
> 
>  .../devicetree/bindings/clock/actions,s900-cmu.txt |  47 +++++++
>  include/dt-bindings/clock/actions,s900-cmu.h       | 139 +++++++++++++++++++++
>  2 files changed, 186 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/actions,s900-cmu.txt
>  create mode 100644 include/dt-bindings/clock/actions,s900-cmu.h

Acked-by: Rob Herring <robh@kernel.org>
