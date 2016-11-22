From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 2/2] phy: qcom-qmp: new qmp phy driver for qcom-chipsets
Date: Tue, 22 Nov 2016 13:17:52 +0530
Message-ID: <CAFp+6iFhJ245YEuLNd0jOOLVtf=_GFaD12PdiM__-32W==WRTQ@mail.gmail.com>
References: <1476873827-7191-1-git-send-email-vivek.gautam@codeaurora.org>
 <1476873827-7191-3-git-send-email-vivek.gautam@codeaurora.org>
 <ca4054a8-a813-0f50-3224-1e418eaa7095@ti.com> <CAFp+6iGMp9pkt5NVTG9f-xjF5VOmj3Om5ngvMboyjdcR94Bhag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFp+6iGMp9pkt5NVTG9f-xjF5VOmj3Om5ngvMboyjdcR94Bhag-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: robh+dt <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Kishon,


On Thu, Nov 10, 2016 at 2:33 PM, Vivek Gautam
<vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> Hi Kishon,
>

>>> +unsigned int msm8996_pciephy_tx_offsets[] = { 0x1000, 0x2000, 0x3000 };
>>> +unsigned int msm8996_pciephy_rx_offsets[] = { 0x1200, 0x2200, 0x3200 };
>>> +unsigned int msm8996_pciephy_pcs_offsets[] = { 0x1400, 0x2400, 0x3400 };

>> you can have a separate reg map for each lane and all these can come from dt.
>
> The idea is to avoid the any child nodes for lanes. So, we have the complete
> ioremaped region and these offsets to tx, rx and pcs blocks.

I don't see benefits in using regmap for different lanes.
Do you see benefits in replacing a bunch of readl()/writel() with
regmap_read()/regmap_update_bits()/regmap_write() ?

I can as well use separate 'reg' values for each lanes, and have the offsets
come from dt. Something like below :

 - reg: array of offset and length of the PHY register sets.
       at index 0: offset and length of register set for PHY common
                   serdes block.
       from index 1 - N: offset and length of register set for each lane,
                         for N number of phy lanes (ports).
 - lane-offsets: array of offsets to tx, rx and pcs blocks for phy lanes.

Example:
       pcie_phy: pciephy@34000 {
               compatible = "qcom,msm8996-qmp-pcie-phy";
               reg = <0x034000 0x48f>,
                       <0x035000 5bf>,
                       <0x036000 5bf>,
                       <0x037000 5bf>;
                                       /* tx, rx, pcs */
               lane-offsets = <0x0 0x200 0x400>;


Does this look OK ? Or should i use regmap only ?


Thanks
Vivek
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
