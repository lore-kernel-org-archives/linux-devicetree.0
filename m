From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 3/6] ARM: dts: apq8064-ifc6410: add notify led support.
Date: Thu, 03 Sep 2015 16:49:03 +0100
Message-ID: <55E86BEF.3010403@linaro.org>
References: <1439903069-19752-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1439903409-20233-1-git-send-email-srinivas.kandagatla@linaro.org>
 <55DCDFC1.4010803@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <55DCDFC1.4010803@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, agross@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 25/08/15 22:36, Stephen Boyd wrote:
> On 08/18/2015 06:10 AM, Srinivas Kandagatla wrote:
>> diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
>> b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
>> index b1f9ddb..08daafe 100644
>> --- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
>> +++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
>> @@ -221,6 +221,18 @@
>>               status = "okay";
>>           };
>> +        leds {
>> +            compatible = "gpio-leds";
>> +            pinctrl-names = "default";
>> +            pinctrl-0 = <&notify_led>;
>> +
>> +            led@1 {
>> +                label = "apq8064:green:user1";
>> +                gpios = <&pm8921_gpio 18 GPIO_ACTIVE_HIGH>;
>> +                default-state = "on";
>> +            };
>> +        };
>
> Wrong place. Should be in root, not soc node.
yep, Will move it to the root.
>
