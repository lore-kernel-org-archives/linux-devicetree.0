From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v6 1/5] phy: add a driver for the Rockchip SoC internal
 USB2.0 PHY
Date: Fri, 12 Dec 2014 11:04:53 +0530
Message-ID: <548A7E7D.8010703@ti.com>
References: <1418291722-25448-1-git-send-email-lyz@rock-chips.com>
 <1418291722-25448-2-git-send-email-lyz@rock-chips.com>
 <548971AF.1020506@ti.com> <54899FE7.7050808@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <54899FE7.7050808@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Yunzhi Li <lyz@rock-chips.com>, heiko@sntech.de, jwerner@chromium.org, dianders@chromium.org
Cc: huangtao@rock-chips.com, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, zyw@rock-chips.com, Rob Herring <robh+dt@kernel.org>, olof@lixom.net, cf@rock-chips.com, linux-arm-kernel@lists.infradead.org, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thursday 11 December 2014 07:15 PM, Yunzhi Li wrote:
> Hi Kishon:
> 
> On 2014/12/11 18:27, Kishon Vijay Abraham I wrote:
>> Hi,
>>
>> On Thursday 11 December 2014 03:25 PM, Yunzhi Li wrote:
>>> +
>>> +static struct phy *rockchip_usb_phy_xlate(struct device *dev,
>>> +                    struct of_phandle_args *args)
>>> +{
>>> +    struct rockchip_usb_phy_priv *priv = dev_get_drvdata(dev);
>>> +    unsigned int phy_id = args->args[0];
>>> +
>>> +    if (WARN_ON(phy_id < 0 || phy_id >= priv->nphys))
>>> +        return ERR_PTR(-ENODEV);
>>> +
>>> +    return priv->phys[phy_id].phy;
>> I didn't mean that. You can get rid of this entire xlate stuff if you use
>> something like below
>>
>> phy@xxx {
>>     compatible = "";
>>     phy1:usb_phy {
>>     }
>>     phy2:usb_phy {
>>     };
>> };
>>
>>
>> usb@xx {
>>     compatible = "";
>>     phys = <&phy1>; //doesn't need xlate
>>     /* this needs xlate
>>        phys = <&phy 1>;
>>     */
>>     phy-names = "phy";
>> };
> 
> Thank you so much for your suggestion, but still have a question:
> I have to add the #phy-cells property in each phy sub-node, otherwise
> devm_get_phy() will fail and I get log info like
> "/usb@ff500000: could not get #phy-cells for /phy/usbp-phy1". So can the
> #phy-cells property defines in patent node
> also valid for it's child nodes like #address-cells ?

No. You have to add #phy-cells property for every PHY node.

Thanks
Kishon
