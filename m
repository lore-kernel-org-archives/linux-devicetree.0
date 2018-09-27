From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: pinctrl: qcom: Add SDM660 pinctrl
 binding
Date: Thu, 27 Sep 2018 13:46:32 -0500
Message-ID: <20180927184632.GA31215@bogus>
References: <20180925173801.3835-1-ctatlor97@gmail.com>
 <20180926162644.10039-1-ctatlor97@gmail.com>
 <20180926162644.10039-2-ctatlor97@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180926162644.10039-2-ctatlor97@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: ctatlor97@gmail.com, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 26 Sep 2018 17:26:43 +0100, Craig Tatlor wrote:
> Add the binding for the TLMM pinctrl block found in the SDM660 platform.
> 
> Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
> ---
> Changes from v3: 
>    Updated for tile structure
>    change irq field
> 
>  .../bindings/pinctrl/qcom,sdm660-pinctrl.txt  | 181 ++++++++++++++++++
>  1 file changed, 181 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdm660-pinctrl.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
