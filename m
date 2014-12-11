From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v5 1/5] phy: add a driver for the Rockchip SoC internal
 USB2.0 PHY
Date: Thu, 11 Dec 2014 11:57:47 +0530
Message-ID: <54893963.7060304@ti.com>
References: <1418208371-18851-1-git-send-email-lyz@rock-chips.com>	
 <1418208371-18851-2-git-send-email-lyz@rock-chips.com>	
 <5489338C.1030109@ti.com> <1418278322.18092.30.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1418278322.18092.30.camel@perches.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joe Perches <joe@perches.com>
Cc: huangtao@rock-chips.com, devicetree@vger.kernel.org, heiko@sntech.de, linux-rockchip@lists.infradead.org, dianders@chromium.org, linux-kernel@vger.kernel.org, zyw@rock-chips.com, cf@rock-chips.com, Rob Herring <robh+dt@kernel.org>, Yunzhi Li <lyz@rock-chips.com>, olof@lixom.net, jwerner@chromium.org, linux-arm-kernel@lists.infradead.org, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thursday 11 December 2014 11:42 AM, Joe Perches wrote:
> On Thu, 2014-12-11 at 11:32 +0530, Kishon Vijay Abraham I wrote:
>> On Wednesday 10 December 2014 04:16 PM, Yunzhi Li wrote:
>>> diff --git a/drivers/phy/phy-rockchip-usb.c b/drivers/phy/phy-rockchip-usb.c
> []
>>> +/*
>>> + * The higher 16-bit of this register is used for write protection
>>> + * only if BIT(13 + 16) set to 1 the BIT(13) can be written.
>>> + */
>>> +#define SIDDQ_MSK		BIT(13 + 16)
> 
> huh?
> 
> This #define looks _very_ odd.
> 
> Is this supposed to be a single bit 29 or
> some range?

>From what I understood, the most significant 16 bits are write locks to the
least significant 16 bits.

So If I have to write something on bit 0, I have to set bit 16.
If I have to write something on bit 1, I have to set bit 17.
If I have to write something on bit 2, I have to set bit 18.
and so on.

Thanks
Kishon
