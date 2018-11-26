From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: Add Qualcomm Synopsys High-Speed
 USB PHY binding
Date: Mon, 26 Nov 2018 08:46:54 -0600
Message-ID: <CAL_JsqLyQAvbPVyHNtGFYrW2BYOGwj7uuRehd=c-3gyAcMKWRA@mail.gmail.com>
References: <20181119110812.15825-1-shawn.guo@linaro.org> <20181119110812.15825-2-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181119110812.15825-2-shawn.guo@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Sriharsha Allenki <sallenki@codeaurora.org>, Anu Ramanathan <anur@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod <vkoul@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 19, 2018 at 5:08 AM Shawn Guo <shawn.guo@linaro.org> wrote:
>
> From: Sriharsha Allenki <sallenki@codeaurora.org>
>
> It adds bindings for Synopsys 28nm femto phy controller that supports
> LS/FS/HS usb connectivity on Qualcomm chipsets.
>
> Signed-off-by: Sriharsha Allenki <sallenki@codeaurora.org>
> Signed-off-by: Anu Ramanathan <anur@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  .../phy/qcom,snps-28nm-usb-hs-phy.txt         | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,snps-28nm-usb-hs-phy.txt

Reviewed-by: Rob Herring <robh@kernel.org>
