From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH 1/2] phy: qcom-qusb2: New driver for QUSB2 PHY on Qcom chips
Date: Thu, 20 Oct 2016 09:43:40 +0530
Message-ID: <CAFp+6iFzUQsNjoVohDDvrgNm_DJdUTOyeUx28r0c_3g3Uz8Nyw@mail.gmail.com>
References: <1476873827-7191-1-git-send-email-vivek.gautam@codeaurora.org> <1476873827-7191-2-git-send-email-vivek.gautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1476873827-7191-2-git-send-email-vivek.gautam@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: kishon <kishon@ti.com>, robh+dt <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>, fengguang.wu@intel.com, kbuild-all@01.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 19, 2016 at 4:13 PM, Vivek Gautam
<vivek.gautam@codeaurora.org> wrote:
> PHY transceiver driver for QUSB2 phy controller that provides
> HighSpeed functionality for DWC3 controller present on
> Qualcomm chipsets.
>
> This driver is based on phy-msm-qusb driver available in
> msm-4.4 kernel @codeaurora[1]
>
> [1] https://source.codeaurora.org/quic/la/kernel/msm-4.4/log/?h=caf/3.18/msm-3.18
>
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> ---

[snip]

> +       qphy->ref_clk_src = devm_clk_get(dev, "ref_clk_src");
> +       if (IS_ERR(qphy->ref_clk_src)) {
> +               qphy->ref_clk_src = NULL;
> +               ret = PTR_ERR(qphy->ref_clk_src);

Pointed out by Kbuild test: ERROR: PTR_ERR applied after
initialization to constant on line

Will correct this in the next patch version.

Same for ref_clk and iface_clk.

> +               if (ret != -EPROBE_DEFER)
> +                       dev_dbg(dev, "clk get failed for ref_clk_src\n");
> +       }
> +
> +       qphy->ref_clk = devm_clk_get(dev, "ref_clk");
> +       if (IS_ERR(qphy->ref_clk)) {
> +               qphy->ref_clk = NULL;
> +               ret = PTR_ERR(qphy->ref_clk);

[snip]


Thanks
Vivek


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
