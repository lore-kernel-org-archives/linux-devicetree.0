From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 6/6] documentation: bindings: document PMIC8921/8058 RTC
Date: Wed, 05 Mar 2014 12:58:55 -0800
Message-ID: <5317900F.5030803@codeaurora.org>
References: <1394047776-13827-1-git-send-email-joshc@codeaurora.org> <1394047776-13827-7-git-send-email-joshc@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1394047776-13827-7-git-send-email-joshc@codeaurora.org>
Sender: linux-doc-owner@vger.kernel.org
To: Josh Cartwright <joshc@codeaurora.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/05/14 11:29, Josh Cartwright wrote:
> diff --git a/Documentation/devicetree/bindings/rtc/qcom,pm8xxx-rtc.txt b/Documentation/devicetree/bindings/rtc/qcom,pm8xxx-rtc.txt
> new file mode 100644
> index 0000000..699bd30
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/qcom,pm8xxx-rtc.txt
> @@ -0,0 +1,29 @@
> +* Real-Time Clock for Qualcomm 8058/8921 PMICs
> +
> +Required properties:
> +- compatible: should be one of the following.
> +    * "qcom,pm8058-rtc"
> +    * "qcom,pm8921-rtc"
> +- reg: base address of the register region
> +- reg-names: corresponding reg names for the regions listed in the 'reg'
> +             property, must contain:
> +     "rtc_base" - base of the RTC register region

optional reg-names?

> +- interrupts: interrupt list for the RTC, must contain a single interrupt
> +              specifier for the alarm interrupt
> +- interrupt-names: corresponding interrupt names for the interrupts listed in
> +                   the 'interrupts' property, must contain:
> +     "alarm" - summary interrupt for PMIC peripherals

optional interrupt-names?

> +
> +Option properties:
> +- linux,allow-set-time: indicates that the setting of RTC time is allowed by
> +                        the host CPU

Is this a "linux" property? It seems like something that other OSes
would want to know about and doesn't require any explicit knowledge
about operating  system things (like keymaps for example).

> +
> +Example:
> +
> +	rtc {

rtc@11d

> +		compatible = "qcom,pm8921-rtc";
> +		reg = <0x11D>;
> +		reg-names = "rtc_base";
> +		interrupts = <0x27 0>;
> +		interrupt-names = "alarm";
> +	};

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation

