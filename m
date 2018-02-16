From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 0/4] Move DP phy switch to PHY driver
Date: Fri, 16 Feb 2018 19:29:15 +0530
Message-ID: <5d20a7bf-f96a-f030-1350-aea2c5cd8153@ti.com>
References: <1486712654-15431-1-git-send-email-zyw@rock-chips.com>
 <a9eac594-33d5-6171-51ca-66204008fc1f@ti.com> <1752563.I66u68YxnT@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1752563.I66u68YxnT@diego>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>, Shawn Lin <shawn.lin@rock-chips.com>, Will Deacon <will.deacon@arm.com>, Kever Yang <kever.yang@rock-chips.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, groeck@chromium.org, Chris Zhong <zyw@rock-chips.com>, robh@kernel.org, Brian Norris <briannorris@chromium.org>, linux-rockchip@lists.infradead.org, Jianqun Xu <jay.xu@rock-chips.com>, Caesar Wang <wxt@rock-chips.com>, devicetree@vger.kernel.org, Elaine Zhang <zhangqing@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, seanpaul@chromium.org, William wu <wulf@rock-chips.com>, linux-arm-kernel@lists.infradead.org, mark.yao@rock-chips.com, Douglas Anderson <dianders@chromium.org>, Tomasz Figa <tfiga@chromium.org>, David Wu <david.wu@rock-chips.com>
List-Id: devicetree@vger.kernel.org



On Friday 16 February 2018 06:35 PM, Heiko St=FCbner wrote:
> Hi Kishon,
> =

> Am Freitag, 16. Februar 2018, 12:04:42 CET schrieb Kishon Vijay Abraham I:
>> On Friday 10 February 2017 01:14 PM, Chris Zhong wrote:
>>> There are 2 Type-c PHYs in RK3399, but only one DP controller. Hence
>>> only one PHY can connect to DP controller at one time, the other should
>>> be disconnected. The GRF_SOC_CON26 register has a switch bit to do it,
>>> set this bit means enable PHY 1, clear this bit means enable PHY 0.
>>>
>>> If the board has 2 Type-C ports, the DP driver get the phy id from
>>> devm_of_phy_get_by_index, and then control this switch according to
>>> this id. But some others board only has one Type-C port, it may be PHY 0
>>> or PHY 1. The dts node id can not tell us the correct PHY id. Hence move
>>> this switch to PHY driver, the PHY driver can distinguish between PHY 0
>>> and PHY 1, and then write the correct register bit.
>>
>> Changed subject of "Documentation: bindings: add uphy-dp-sel for Rockchip
>> USB Type-C PHY" as suggested by Rob, rebased "phy: rockchip-typec: suppo=
rt
>> DP phy switch" to the latest kernel and merged.
> =

> I'm not sure how far along you are with your merging, but you might want =
to =

> revert this one.
> =

> In your inbox you should find more recent threads about the type-c phy
> where Rob strongly suggested moving the whole grf registers out of the
> dt and into the driver.
> =

> Enric Balletbo did just that and posted a series (including the dp-move)
> yesterday (refined in a v2 from today).
> =

> Alternatively Enric could rebase his series on top of that recent change.

I can drop this series and take Enric's series. All of them are still in my
local system.

Thanks
Kishon
