From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: net: bluetooth: Add device tree
 bindings for QTI chip wcn3998
Date: Tue, 12 Mar 2019 09:59:28 -0700
Message-ID: <20190312165928.GD200579@google.com>
References: <1552393379-26330-1-git-send-email-c-hbandi@codeaurora.org>
 <1552393379-26330-3-git-send-email-c-hbandi@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1552393379-26330-3-git-send-email-c-hbandi@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Harish Bandi <c-hbandi@codeaurora.org>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org, anubhavg@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

+DT folks

Please add them in future versions (script/scripts/get_maintainer.pl
<patches> should have listed them)

On Tue, Mar 12, 2019 at 05:52:59PM +0530, Harish Bandi wrote:
> This patch enables regulators for the Qualcomm Bluetooth wcn3998
> controller.

No, it doesn't.

The next version should probably say something like "Add compatible
string for the Qualcomm WCN3998 Bluetooth controller.

Is there any particular reason why QCA drivers folks use 'wcn' instead
of 'WCN'? The QCA documentations calls it WCN399x, so I'd suggest to
consistently use the uppercase name in comments and documentation (and
log messages?).

> Signed-off-by: Harish Bandi <c-hbandi@codeaurora.org>
> ---
> changes in v3:
> - updated to latest code base.

This comment is useless, please describe what changed wrt the previous
version.

> ---
>  .../devicetree/bindings/net/qualcomm-bluetooth.txt        | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> index 824c0e2..1221535 100644
> --- a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> +++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> @@ -53,3 +53,18 @@ serial@898000 {
>  		max-speed = <3200000>;
>  	};
>  };
> +
> +&blsp1_uart3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&blsp1_uart3_default>;
> +	status = "okay";
> +
> +	bluetooth: wcn3998-bt {
> +		compatible = "qcom,wcn3998-bt";
> +		vddio-supply = <&vreg_l6_1p8>;
> +		vddxo-supply = <&vreg_l5_1p8>;
> +		vddrf-supply = <&vreg_s5_1p35>;
> +		vddch0-supply = <&vdd_ch0_3p3>;
> +		max-speed = <3200000>;
> +	};
> +};
> \ No newline at end of file

I think the example isn't really needed since it's essentially the
same as the one for 'qcom,wcn3990-bt'.

But the important part is missing: add the new compatible string under
´Required properties´. You also want to update the documentation that
mentiones 'qcom,wcn3990-bt' to 'qcom,wcn399x-bt' (assuming for now
that other possible WCN399x chips would be similar).

You mentioned in an earlier version of the series that there are
multiple WCN3998 variants with different requirements for
voltage/current. This seems to suggests that multiple compatible
strings are needed to distinguish between them.

Thanks

Matthias
