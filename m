From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/8] arm64: dts: db820c: add basic board support
Date: Tue, 21 Jun 2016 21:49:16 -0700
Message-ID: <20160622044916.GF1256@tuxbot>
References: <1466529769-2674-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1466529769-2674-2-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466529769-2674-2-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue 21 Jun 10:22 PDT 2016, Srinivas Kandagatla wrote:

[..]
> diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
[..]
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. DB820c";
> +	compatible = "qcom,apq8096-sbc";

I'm still not buying the concept of this being the one and only
single-board-computer.

If this compatible fully and exclusively identifies this particular
board then dtbTool should be updated to follow the product name
"qcom,apq8096-db820c". If on the other hand this identifies a class of
single-board-computers, then the compatible should list both
"qcom,apq8096-dtb820c" and "qcom,apq8096-sbc".



Further more, the ePAPR defines this property as:
"Specifies a list of platform architectures with which this platform is
compatible. This property can be used by operating systems in selecting
platform specific code."

So I think we should follow the common pattern of having the least
significant entry being "qcom,apq8096".

> +};

Regards,
Bjorn
