From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 2/2] phy: qcom-qmp: new qmp phy driver for qcom-chipsets
Date: Wed, 2 Nov 2016 09:33:41 +0000
Message-ID: <b9cc6c7a-0819-fa6a-d4f9-b057dddda5bb@linaro.org>
References: <1476873827-7191-1-git-send-email-vivek.gautam@codeaurora.org>
 <1476873827-7191-3-git-send-email-vivek.gautam@codeaurora.org>
 <a969a6be-472d-a463-790b-1e2f373d19b2@linaro.org>
 <CAFp+6iG=3QRU+Ffj+8xJaPrpy0p7TyjeX0khiOGQMtz-z-hiSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAFp+6iG=3QRU+Ffj+8xJaPrpy0p7TyjeX0khiOGQMtz-z-hiSg@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: kishon <kishon@ti.com>, robh+dt <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 02/11/16 07:26, Vivek Gautam wrote:
>>> +               phy_desc->tx = base + qphy->cfg->tx_offsets[id];
>>> >> +               phy_desc->rx = base + qphy->cfg->rx_offsets[id];
>>> >> +               phy_desc->pcs = base + qphy->cfg->pcs_offsets[id];
>>> >> +
>>> >> +               /*
>>> >> +                * Get PHY's Pipe clock, if any; USB3 and PCIe are PIPE
>>> >> +                * based phys, so they essentially have pipe clock
>>> >> +                */
>>> >> +               memset(&prop_name, 0, sizeof(prop_name));
>>> >> +               snprintf(prop_name, MAX_PROP_NAME, "pipe%d", id);
>>> >> +               phy_desc->pipe_clk = devm_clk_get(dev, prop_name);
>>> >> +               if (IS_ERR(phy_desc->pipe_clk)) {
>>> >> +                       if (qphy->cfg->type == PHY_TYPE_PCIE ||
>>> >> +                           qphy->cfg->type == PHY_TYPE_USB3) {
>>> >> +                               ret = PTR_ERR(phy_desc->pipe_clk);
>>> >> +                               if (ret != -EPROBE_DEFER)
>>> >> +                                       dev_err(dev,
>>> >> +                                       "failed to get lane%d pipe_clk\n",
>>> >> id);
>>> >> +                               return ret;
>>> >> +                       } else {
>>> >> +                               phy_desc->pipe_clk = NULL;
>>> >> +                       }
>>> >> +               }
>> >
>> >
>> > Do we need to really need phy type for this?
>> > You should proably make a flag in cfg to mark this rather then using phy
>> > type. Hopefully it will also simplify the logic.
> The pipe clock is something that's specific to PCIe and USB3 type
> phys (both are PIPE3 specs based phys). So i think it is okay
> to use the PHY_TYPE_{*} macros here. Looks a bit cleaner rather
> than having a cfg flag. No ?
Yes, it makes sense, I was not sure of full details of the pipe3 specs, 
now that you made it more clear.
Remember to add this in comments.

Thanks,
srini
>
> Using PHY_TYPE_{*} macros will also keep the doors open to
> other PHY types that are added at a later point in time.
>
>> >
