From: Andy Gross <agross@codeaurora.org>
Subject: Re: [PATCH v1 3/7] ARM: dts: qs600: Add real regulators to sdcc
Date: Mon, 27 Jul 2015 15:36:45 -0500
Message-ID: <20150727203645.GC12739@qualcomm.com>
References: <1438004945-16175-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1438005020-16306-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1438005020-16306-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 27, 2015 at 02:50:20PM +0100, Srinivas Kandagatla wrote:

<snip>

>  			/* WLAN */
>  			sdcc4: sdcc@121c0000 {
>  				status = "okay";
> +				vmmc-supply = <&v3p3_fixed>;
> +				vqmmc-supply = <&v3p3_fixed>;
> +				mmc-pwrseq = <&sdcc4_pwrseq>;

Where is sdcc4_pwrseq defined?


-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
