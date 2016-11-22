From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 2/2] phy: qcom-qmp: new qmp phy driver for qcom-chipsets
Date: Tue, 22 Nov 2016 14:39:31 +0530
Message-ID: <58340B4B.8090403@ti.com>
References: <1476873827-7191-1-git-send-email-vivek.gautam@codeaurora.org>
 <1476873827-7191-3-git-send-email-vivek.gautam@codeaurora.org>
 <ca4054a8-a813-0f50-3224-1e418eaa7095@ti.com>
 <CAFp+6iGMp9pkt5NVTG9f-xjF5VOmj3Om5ngvMboyjdcR94Bhag@mail.gmail.com>
 <CAFp+6iFhJ245YEuLNd0jOOLVtf=_GFaD12PdiM__-32W==WRTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFp+6iFhJ245YEuLNd0jOOLVtf=_GFaD12PdiM__-32W==WRTQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: robh+dt <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tuesday 22 November 2016 01:17 PM, Vivek Gautam wrote:
> Hi Kishon,
> 
> 
> On Thu, Nov 10, 2016 at 2:33 PM, Vivek Gautam
> <vivek.gautam@codeaurora.org> wrote:
>> Hi Kishon,
>>
> 
>>>> +unsigned int msm8996_pciephy_tx_offsets[] = { 0x1000, 0x2000, 0x3000 };
>>>> +unsigned int msm8996_pciephy_rx_offsets[] = { 0x1200, 0x2200, 0x3200 };
>>>> +unsigned int msm8996_pciephy_pcs_offsets[] = { 0x1400, 0x2400, 0x3400 };
> 
>>> you can have a separate reg map for each lane and all these can come from dt.
>>
>> The idea is to avoid the any child nodes for lanes. So, we have the complete
>> ioremaped region and these offsets to tx, rx and pcs blocks.
> 
> I don't see benefits in using regmap for different lanes.
> Do you see benefits in replacing a bunch of readl()/writel() with
> regmap_read()/regmap_update_bits()/regmap_write() ?

By reg map, I meant register spaces allocated for different lanes.
> 
> I can as well use separate 'reg' values for each lanes, and have the offsets
> come from dt. Something like below :
> 
>  - reg: array of offset and length of the PHY register sets.
>        at index 0: offset and length of register set for PHY common
>                    serdes block.
>        from index 1 - N: offset and length of register set for each lane,
>                          for N number of phy lanes (ports).
>  - lane-offsets: array of offsets to tx, rx and pcs blocks for phy lanes.
> 
> Example:
>        pcie_phy: pciephy@34000 {
>                compatible = "qcom,msm8996-qmp-pcie-phy";
>                reg = <0x034000 0x48f>,
>                        <0x035000 5bf>,
>                        <0x036000 5bf>,
>                        <0x037000 5bf>;
>                                        /* tx, rx, pcs */
>                lane-offsets = <0x0 0x200 0x400>;

right, I meant something like this.

Thanks
Kishon
