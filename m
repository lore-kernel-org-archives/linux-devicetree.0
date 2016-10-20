From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH 2/2] phy: qcom-qmp: new qmp phy driver for qcom-chipsets
Date: Thu, 20 Oct 2016 09:47:13 +0530
Message-ID: <CAFp+6iGehJQOEt=GcE3Psa5N1ynFmvqWgLncFw1n_j6XjJy1Vg@mail.gmail.com>
References: <1476873827-7191-1-git-send-email-vivek.gautam@codeaurora.org>
 <1476873827-7191-3-git-send-email-vivek.gautam@codeaurora.org> <755a58a3-a167-0750-7712-49b998e7d348@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <755a58a3-a167-0750-7712-49b998e7d348@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon <kishon@ti.com>, robh+dt <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, fengguang.wu@intel.com, kbuild-all@01.org, julia.lawall@lip6.fr
List-Id: devicetree@vger.kernel.org

On Wed, Oct 19, 2016 at 4:24 PM, Vivek Gautam
<vivek.gautam@codeaurora.org> wrote:
> CC: Srinivas Kandagatla
>
>
> On 10/19/2016 04:13 PM, Vivek Gautam wrote:
>>
>> Qualcomm SOCs have QMP phy controller that provides support
>> to a number of controller, viz. PCIe, UFS, and USB.
>> Add a new driver, based on generic phy framework, for this
>> phy controller.
>>
>> USB3-phy changes: Based on phy-msm-ssusb-qmp driver available on
>> msm-4.4 kernel @codeaurora[1].
>> PCIe-phy changes: Based on msm8996-pcie-phy driver posted by
>> Srinivas [2].
>>
>> [1]
>> https://source.codeaurora.org/quic/la/kernel/msm-4.4/log/?h=caf/3.18/msm-3.18
>> [2] https://patchwork.kernel.org/patch/9318947/
>>
>> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
>> Cc: Kishon Vijay Abraham I <kishon@ti.com>
>> ---

[snip]

>> +static int qcom_qmp_phy_com_init(struct qcom_qmp_phy *qphy)
>> +{
>> +       const struct qmp_phy_init_cfg *cfg = qphy->cfg;
>> +       void __iomem *serdes = qphy->serdes;
>> +       int ret;
>> +
>> +       mutex_lock(&qphy->phy_mutex);
>> +       if (qphy->init_count++) {
>> +               mutex_unlock(&qphy->phy_mutex);
>> +               return 0;
>> +       }
>> +
>> +       ret = reset_control_deassert(qphy->phy_rst);
>> +       if (ret) {
>> +               dev_err(qphy->dev, "phy reset deassert failed\n");
>> +               return ret;

Pointed out by Kbuild-test: drivers/phy/phy-qcom-qmp.c:677:2-8:
preceding lock on line 668

The mutex has to be unlocked for all error cases.
Will fix this in the next patch version.

[snip]


Thanks
Vivek


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
