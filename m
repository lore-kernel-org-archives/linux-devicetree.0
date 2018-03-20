From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 04/13] ARM: dts: ipq4019: Update ipq4019-dk01.1 board data
Date: Tue, 20 Mar 2018 00:33:31 -0700
Message-ID: <152153121123.254778.13134751025860491351@swboyd.mtv.corp.google.com>
References: <1521518336-5467-1-git-send-email-sricharan@codeaurora.org>
 <1521518336-5467-5-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521518336-5467-5-git-send-email-sricharan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: absahu@codeaurora.org, andy.gross@linaro.org, bjorn.andersson@linaro.org, catalin.marinas@arm.com, david.brown@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, linux@armlinux.org.uk, marc.zyngier@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, robh@kernel.org, sboyd@codeaurora.org, will.deacon@arm.com
Cc: sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

Quoting Sricharan R (2018-03-19 20:58:47)
> Reviewed-by: Abhishek Sahu <absahu@codeaurora.org>

That is an odd place for a reviewed-by tag.

> Adds missing memory, reserved-memory nodes.
> 
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> ---
>  arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi | 28 +++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
> index e413b21e..ad0fbc9 100644
> --- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
> @@ -20,6 +20,34 @@
>         model = "Qualcomm Technologies, Inc. IPQ4019/AP-DK01.1";
>         compatible = "qcom,ipq4019";
>  
> +       memory {
> +               device_type = "memory";
> +               reg = <0x80000000 0x10000000>; /* 256MB */
> +       };
> +
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               rsvd1@87000000 {
> +                       /* Reserved for other subsystem */
> +                       reg = <0x87000000 0x500000>;
> +                       no-map;
> +               };
> +
> +               wifi_dump@87500000 {
> +                       reg = <0x87500000 0x600000>;
> +                       no-map;
> +               };
> +
> +               rsvd2@87B00000 {

Lowercase hex please.

> +                       /* Reserved for other subsystem */
> +                       reg = <0x87B00000 0x500000>;
> +                       no-map;
> +               };
> +       };
