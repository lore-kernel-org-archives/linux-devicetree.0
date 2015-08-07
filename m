From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v1 1/7] ARM: dts: ifc6410: Add pwrseq support for WLAN
Date: Fri, 07 Aug 2015 10:32:41 +0100
Message-ID: <55C47B39.3030607@linaro.org>
References: <1438087956-17307-1-git-send-email-srinivas.kandagatla@linaro.org> <1438088022-17350-1-git-send-email-srinivas.kandagatla@linaro.org> <55B959C4.2090600@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <55B959C4.2090600@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: agross@codeaurora.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 29/07/15 23:55, Stephen Boyd wrote:
> On 07/28/2015 05:53 AM, Srinivas Kandagatla wrote:
>> +
>> +        sdcc4_pwrseq:pwrseq {
>
> Missing space here between label and node name.
>
I will fix this in next version.
>> +            compatible = "mmc-pwrseq-simple";
>> +            reset-gpios = <&pm8921_gpio 43 GPIO_ACTIVE_LOW>;
>> +        };
>> +
>
> Also this node is not part of the SoC so it should be in the root,
> possibly under some sort of power-sequences node so that all the
> sequences are grouped in one place.
Good spot and suggestion. I will do that in next version.

--srini
>
