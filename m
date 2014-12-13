From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v7 2/5] phy: add a driver for the Rockchip SoC internal
 USB2.0 PHY
Date: Sat, 13 Dec 2014 12:54:14 +0530
Message-ID: <548BE99E.2000409@ti.com>
References: <1418396413-27937-1-git-send-email-lyz@rock-chips.com>	<1418396866-32625-1-git-send-email-lyz@rock-chips.com>
 <CAD=FV=XiP37Q8EkDYpBgh=Ng9nJD9-Uow0qCy78u6kCZomGNPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAD=FV=XiP37Q8EkDYpBgh=Ng9nJD9-Uow0qCy78u6kCZomGNPA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Doug Anderson <dianders@chromium.org>, Yunzhi Li <lyz@rock-chips.com>
Cc: Tao Huang <huangtao@rock-chips.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, Olof Johansson <olof@lixom.net>, Chris <zyw@rock-chips.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Eddie Cai <cf@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, jwerner@chromium.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

hi,

On Saturday 13 December 2014 05:49 AM, Doug Anderson wrote:
> Yunzhi,
> 
> On Fri, Dec 12, 2014 at 7:07 AM, Yunzhi Li <lyz@rock-chips.com> wrote:
>> This patch to add a generic PHY driver for ROCKCHIP usb PHYs,
>> currently this driver can support RK3288. The RK3288 SoC have
>> three independent USB PHY IPs which are all configured through a
>> set of registers located in the GRF (general register files)
>> module.
>>
>> Signed-off-by: Yunzhi Li <lyz@rock-chips.com>
>>
>> ---
>>
>> Changes in v7:
>> - Accept Kishon's comments to use phandle args to find a phy
>>   struct directly and get rid of using a custom of_xlate
>>   function.
> 
> I'm going to assume you didn't test this version, since it doesn't
> work for me.  At suspend time power is high and my printouts in the
> powerup/powerdown code aren't called...
> 
> 
>> +       for_each_available_child_of_node(dev->of_node, child) {
>> +               rk_phy = devm_kzalloc(dev, sizeof(*rk_phy), GFP_KERNEL);
>> +               if (!rk_phy)
>> +                       return -ENOMEM;
>> +
>> +               if (of_property_read_u32(child, "reg", &reg_offset)) {
>> +                       dev_err(dev, "missing reg property in node %s\n",
>> +                               child->name);
>> +                       return -EINVAL;
>> +               }
>> +
>> +               rk_phy->reg_offset = reg_offset;
>> +               rk_phy->reg_base = grf;
>> +
>> +               rk_phy->clk = of_clk_get_by_name(child, "phyclk");
>> +               if (IS_ERR(rk_phy->clk))
>> +                       rk_phy->clk = NULL;
>> +
>> +               rk_phy->phy = devm_phy_create(dev, child, &ops);
>> +               if (IS_ERR(rk_phy->phy)) {
>> +                       dev_err(dev, "failed to create PHY\n");
>> +                       return PTR_ERR(rk_phy->phy);
>> +               }
>> +               phy_set_drvdata(rk_phy->phy, rk_phy);
>> +       }
>> +
>> +       phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> 
> I think your bug is here.  I think you now need to register 3 phy
> providers, not just one.

No there should be only one phy provider. It means the bug is elsewhere.

Thanks
Kishon
