From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v3 2/4] phy: qcom-qusb2: New driver for QUSB2 PHY on Qcom chips
Date: Thu, 29 Dec 2016 12:27:53 +0530
Message-ID: <CAFp+6iEKzxKJJCH0+riheGzQwWThfENk6yZoUSSeXuPnLyPdhQ@mail.gmail.com>
References: <1482253431-23160-1-git-send-email-vivek.gautam@codeaurora.org>
 <1482253431-23160-3-git-send-email-vivek.gautam@codeaurora.org> <20161228230150.GB17126@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20161228230150.GB17126@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: robh+dt <robh+dt@kernel.org>, kishon <kishon@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 29, 2016 at 4:31 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 12/20, Vivek Gautam wrote:
>> PHY transceiver driver for QUSB2 phy controller that provides
>> HighSpeed functionality for DWC3 controller present on
>> Qualcomm chipsets.
>>
>> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
>
> One comment below, but otherwise
>
> Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>
>
>> +static void qusb2_phy_set_tune2_param(struct qusb2_phy *qphy)
>> +{
>> +     struct device *dev = &qphy->phy->dev;
>> +     u8 *val;
>> +
>> +     /*
>> +      * Read efuse register having TUNE2 parameter's high nibble.
>> +      * If efuse register shows value as 0x0, or if we fail to find
>> +      * a valid efuse register settings, then use default value
>> +      * as 0xB for high nibble that we have already set while
>> +      * configuring phy.
>> +      */
>> +     val = nvmem_cell_read(qphy->cell, NULL);
>> +     if (IS_ERR(val) || !val[0]) {
>> +             dev_dbg(dev, "failed to read a valid hs-tx trim value, %ld\n",
>> +                                                             PTR_ERR(val));
>
> If val is 0 PTR_ERR(0) will be junk? I guess that's ok for debug
> print.

May be -EINVAL is better for debug print. Even when val[0]
is 0, val will still be a valid pointer, and so PTR_ERR(val) will
essentially be the pointer casted to long.



Thanks
Vivek
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
