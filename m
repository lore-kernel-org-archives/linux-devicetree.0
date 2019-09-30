From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RFC v2 06/14] dt-bindings/interrupt-controller: pdc: add
 SPI config register
Date: Mon, 30 Sep 2019 17:14:16 -0500
Message-ID: <20190930221416.GA2501@bogus>
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
 <1568411962-1022-7-git-send-email-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1568411962-1022-7-git-send-email-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: swboyd@chromium.org, evgreen@chromium.org, maz@kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, mkshah@codeaurora.org, linux-gpio@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 13 Sep 2019 15:59:14 -0600, Lina Iyer wrote:
> In addition to configuring the PDC, additional registers that interface
> the GIC have to be configured to match the GPIO type. The registers on
> some QCOM SoCs are access restricted, while on other SoCs are not. They
> SoCs with access restriction to these SPI registers need to be written
> from the firmware using the SCM interface. Add a flag to indicate if the
> register is to be written using SCM interface.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.txt   | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
