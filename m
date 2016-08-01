From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v4 1/2] Documentation: bindings: add dt documentation for
 Rockchip PCIe PHY
Date: Mon, 1 Aug 2016 11:03:09 +0800
Message-ID: <56d82103-1561-9410-d058-3b7a3534490f@rock-chips.com>
References: <1469755326-10263-1-git-send-email-shawn.lin@rock-chips.com>
 <20160729213435.GA15549@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160729213435.GA15549@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

在 2016/7/30 5:34, Rob Herring 写道:
> On Fri, Jul 29, 2016 at 09:22:05AM +0800, Shawn Lin wrote:
>> This patch adds a binding that describes the Rockchip PCIe PHY
>> found on Rockchip SoCs PCIe interface.
>>
>> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>
>> ---
>>
>> Changes in v4: None
>> Changes in v3:
>> - rename the node to pcie_phy: pcie-phy suggested by Doug
>>
>> Changes in v2:
>> - add clk and reset description
>> - remove unit-address
>>
>>  .../devicetree/bindings/phy/rockchip-pcie-phy.txt  | 32 ++++++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt
>
> Please add acks when posting new versions.

yup, but I didn't see your ack for my previous version.
Anyway, I will add it if needing to respin one, or Kishon could add
it if all others look good to him when applying these? :)

>
> Rob
>
>
>


-- 
Best Regards
Shawn Lin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
