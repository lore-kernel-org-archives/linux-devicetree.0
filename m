From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v1 2/7] ARM: dts: ifc6410: add real regulators for sdcc
 nodes.
Date: Tue, 28 Jul 2015 09:07:17 +0100
Message-ID: <55B73835.3020304@linaro.org>
References: <1438004945-16175-1-git-send-email-srinivas.kandagatla@linaro.org> <1438005012-16263-1-git-send-email-srinivas.kandagatla@linaro.org> <20150727203254.GB12739@qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20150727203254.GB12739@qualcomm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 27/07/15 21:32, Andy Gross wrote:
> On Mon, Jul 27, 2015 at 02:50:12PM +0100, Srinivas Kandagatla wrote:
>
> <snip>
>
>>   			sdcc3: sdcc@12180000 {
>>   				status = "okay";
>> +				vmmc-supply = <&pm8921_l6>;
>>   				pinctrl-names	= "default";
>>   				pinctrl-0	= <&card_detect>;
>>   				cd-gpios	= <&tlmm_pinmux 26 GPIO_ACTIVE_LOW>;
>> @@ -187,6 +200,8 @@
>>   			/* WLAN */
>>   			sdcc4: sdcc@121c0000 {
>>   				status = "okay";
>> +				vmmc-supply = <&ext_3p3v>;
>
> Where is ext_3p3v defined?
Oops,  This is missing in this patch, I think re-ordering few other 
patches introduced this. I will send a these 3 patches as we discussed.

--srini
>
>> +				vqmmc-supply = <&pm8921_lvs1>;
>
