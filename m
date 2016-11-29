From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: Add support for QUSB2 phy
Date: Tue, 29 Nov 2016 10:52:35 +0530
Message-ID: <CAFp+6iFfVeL4Lzf+od9J97He=w2ir7o+D+OYY5nONt6W_tz5Ag@mail.gmail.com>
References: <1479816163-5260-1-git-send-email-vivek.gautam@codeaurora.org>
 <1479816163-5260-2-git-send-email-vivek.gautam@codeaurora.org> <20161128224953.GL6095@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20161128224953.GL6095@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: kishon <kishon@ti.com>, robh+dt <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Tue, Nov 29, 2016 at 4:19 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:

Thanks for reviewing the patch-series.

> On 11/22, Vivek Gautam wrote:
>> diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
>> new file mode 100644
>> index 0000000..38c8b30
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
>> @@ -0,0 +1,55 @@
>> +Optional properties:
>> + - nvmem-cells: a list of phandles to nvmem cells that contain fused
>> +             tuning parameters for qusb2 phy, one for each entry
>> +             in nvmem-cell-names.
>> + - nvmem-cell-names: must be "tune2_hstx_trim_efuse" for cell containing
>
> Do we really need efuse in the name? Seems redundant given this
> is already an nvmem.

Correct, we don't need 'efuse' in the name. Thanks for pointing out.


Best Regards
Vivek

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
