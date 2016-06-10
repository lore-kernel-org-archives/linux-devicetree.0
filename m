From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/2] ARM: dts: apq8064: rename db600c to SD_600eval
Date: Fri, 10 Jun 2016 13:49:20 +0100
Message-ID: <575AB750.80803@linaro.org>
References: <1465551298-21457-1-git-send-email-srinivas.kandagatla@linaro.org>
 <575AB433.3060006@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <575AB433.3060006@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>, Andy Gross <andy.gross@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 10/06/16 13:36, Georgi Djakov wrote:
> Hi Srini,
>
> On 06/10/2016 12:34 PM, Srinivas Kandagatla wrote:
>> This board has been renamed recently and announced at
>> https://eragon.einfochips.com/products/sd-600eval.html
>>
>> So rename this board files so that it reflects actual product in market.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   arch/arm/boot/dts/Makefile                         |   2 +-
>>   .../boot/dts/qcom-apq8064-arrow-db600c-pins.dtsi   |  52 ---
>>   arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts    | 349 ---------------------
>>   .../dts/qcom-apq8064-arrow-sd-600eval-pins.dtsi    |  52 +++
>>   .../arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts | 349 +++++++++++++++++++++
>>   5 files changed, 402 insertions(+), 402 deletions(-)
>>   delete mode 100644 arch/arm/boot/dts/qcom-apq8064-arrow-db600c-pins.dtsi
>>   delete mode 100644 arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts
>>   create mode 100644 arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval-pins.dtsi
>>   create mode 100644 arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts
>>
>
> If you use git format-patch -M, we will see and track the renamed files
> easier than deleting and adding the files.
Yep, that would give good diff stat as well.
Thanks for suggestion, will resend v2 with that change.

--srini
>
> BR,
> Georgi
>
