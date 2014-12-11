From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v5 1/5] phy: add a driver for the Rockchip SoC internal
 USB2.0 PHY
Date: Thu, 11 Dec 2014 14:06:21 +0530
Message-ID: <54895785.104@ti.com>
References: <1418208371-18851-1-git-send-email-lyz@rock-chips.com>
 <1418208371-18851-2-git-send-email-lyz@rock-chips.com>
 <5489338C.1030109@ti.com> <54894B52.3060105@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <54894B52.3060105@rock-chips.com>
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

On Thursday 11 December 2014 01:14 PM, Yunzhi Li wrote:
> Hi Kishon:
> 
> On 2014/12/11 14:02, Kishon Vijay Abraham I wrote:
>> Hi,
>>
>> On Wednesday 10 December 2014 04:16 PM, Yunzhi Li wrote:
>>> This patch to add a generic PHY driver for ROCKCHIP usb PHYs,
>>> currently this driver can support RK3288. The RK3288 SoC have
>>> three independent USB PHY IPs which are all configured through a
>>> set of registers located in the GRF (general register files)
>>> module.
>>>
>>> Signed-off-by: Yunzhi Li <lyz@rock-chips.com>
>>>
>>> +
>>> +#define ROCKCHIP_RK3288_UOC(n)    (0x320 + n * 0x14)
>>> +
>>> +/*
>>> + * The higher 16-bit of this register is used for write protection
>>> + * only if BIT(13 + 16) set to 1 the BIT(13) can be written.
>>> + */
>>> +#define SIDDQ_MSK        BIT(13 + 16)
>> I think here the "MSK" is misleading. it should be something that refers write
>> protection?
> So, #define SIDDQ_WRITE_ENA  BIT(29) , could be ok ?

yeah. should be fine.
>>> +#define SIDDQ_ON        BIT(13)
>>> +#define SIDDQ_OFF        (0 << 13)
>>> +
>>> +struct rockchip_usb_phy {
>>> +    struct regmap    *reg_base;
>>> +    unsigned int    reg_offset;
>>> +    struct clk    *clk;
>>> +    struct phy    *phy;
>>> +    unsigned    index;
>>> +};
>>> +
>>> +struct rockchip_usb_phy_priv {
>>> +    struct rockchip_usb_phy    *phys;
>>> +    unsigned        nphys;
>>> +};
>>> +
>>> +static int rockchip_usb_phy_power(struct rockchip_usb_phy *phy,
>>> +                       bool siddq)
>>> +{
>>> +    return regmap_write(phy->reg_base, phy->reg_offset,
>>> +                SIDDQ_MSK | (siddq ? SIDDQ_ON : SIDDQ_OFF));
>> Shouldn't we actually reset the bit for power off?
> Sorry, which bit you refer to here  and why should it be reset? could you give
> more infomation.

Never mind. Initially was thinking it might affect bits other than siddq but
anyway you have write lock. So should be fine.

Thanks
Kishon
