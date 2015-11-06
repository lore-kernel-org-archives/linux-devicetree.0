From: Matthew McClintock <mmcclint@codeaurora.org>
Subject: Re: [PATCH 1/5] pinctrl: qcom: ipq4019: Add IPQ4019 pinctrl support
Date: Thu, 5 Nov 2015 21:24:22 -0600
Message-ID: <837CDC90-83D6-4E94-9D04-C3CD5BBD628C@codeaurora.org>
References: <1446761276-9111-1-git-send-email-mmcclint@codeaurora.org> <1446761276-9111-2-git-send-email-mmcclint@codeaurora.org> <20151106023411.GA17997@rob-hp-laptop>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151106023411.GA17997@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Andy Gross <agross@codeaurora.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Varadarajan Narayanan <varada@codeaurora.org>, linux-kernel@vger.kernel.org, qca-upstream.external@qca.qualcomm.com, Sricharan R <sricharan@codeaurora.org>, Mathieu Olivari <mathieu@codeaurora.org>
List-Id: devicetree@vger.kernel.org


> On Nov 5, 2015, at 8:34 PM, Rob Herring <robh@kernel.org> wrote:
> 
> On Thu, Nov 05, 2015 at 04:07:52PM -0600, Matthew McClintock wrote:
>> From: Varadarajan Narayanan <varada@codeaurora.org>
>> 
>> Add pinctrl driver support for IPQ4019 platform
>> 
>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>> Signed-off-by: Mathieu Olivari <mathieu@codeaurora.org>
>> Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
>> Signed-off-by: Matthew McClintock <mmcclint@codeaurora.org>
>> ---
>> .../bindings/pinctrl/qcom,ipq4019-pinctrl.txt      |  116 ++
>> drivers/pinctrl/qcom/Kconfig                       |    8 +
>> drivers/pinctrl/qcom/Makefile                      |    1 +
>> drivers/pinctrl/qcom/pinctrl-ipq4019.c             | 1280 ++++++++++++++++++++
>> 4 files changed, 1405 insertions(+)
>> create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
>> create mode 100644 drivers/pinctrl/qcom/pinctrl-ipq4019.c
>> 
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
>> new file mode 100644
>> index 0000000..045c5aa
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
>> @@ -0,0 +1,116 @@
>> +Qualcomm Atheros IPQ4019 TLMM block
>> +
>> +Required properties:
>> +- compatible: "qcom,ipq4019-pinctrl"
> 
> Perhaps the name should have TLMM in it. Whatever that stands for.

Sure, this was a holdover from Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt mostly. Will elaborate on v2 though.

-M
