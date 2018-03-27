From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 5/6] dt-bindings: phy-qcom-usb2: Update bindings for sdm845
Date: Tue, 27 Mar 2018 14:57:55 -0700
Message-ID: <CAD=FV=U03Hijg5NPiY5=5JQJpobJnUNAkf361OOdNRLVc5joWQ@mail.gmail.com>
References: <1521785487-29866-1-git-send-email-mgautam@codeaurora.org> <1521785487-29866-6-git-send-email-mgautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521785487-29866-6-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manu Gautam <mgautam@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Vivek Gautam <vivek.gautam@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Mar 22, 2018 at 11:11 PM, Manu Gautam <mgautam@codeaurora.org> wrote:
> Update compatible strings for USB2 PHYs on sdm845.
> There are two QUSB2 PHYs present on sdm845. Few PHY registers
> programming is different for these PHYs related to electrical
> parameters, otherwise both are same.
>
> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> index 42c9742..b99a57f 100644
> --- a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> @@ -6,7 +6,9 @@ QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
>  Required properties:
>   - compatible: compatible list, contains
>                "qcom,msm8996-qusb2-phy" for 14nm PHY on msm8996,
> -              "qcom,qusb2-v2-phy" for QUSB2 V2 PHY.
> +              "qcom,qusb2-v2-phy" for QUSB2 V2 PHY,
> +              "qcom,sdm845-qusb2-phy-1" for primary PHY on sdm845,
> +              "qcom,sdm845-qusb2-phy-2" for secondary PHY on sdm845.

Similar question to the one I posed on
<https://patchwork.kernel.org/patch/10302761/> for the QMP PHY.  What
is "qcom,qusb2-v2-phy"?  Is it some ideal abstract version of the PHY?
 Do we expect that anyone would actually use that compatible string?

In this case in <https://patchwork.kernel.org/patch/10302755/> it
looks as if you're using the same settings as
"qcom,sdm845-qusb2-phy-2", so presumably "qcom,qusb2-v2-phy" should
just be deleted.


-Doug
