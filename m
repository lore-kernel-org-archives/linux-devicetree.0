From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v6 2/5] Documentation: bindings: add dt documentation for
 Rockchip usb PHY
Date: Thu, 11 Dec 2014 10:49:07 -0800
Message-ID: <CAD=FV=WonOfOOd1a+JAOz__hSn8dRqHJ=zh7ppeCNf_jgqhBww@mail.gmail.com>
References: <1418291722-25448-1-git-send-email-lyz@rock-chips.com>
	<1418291722-25448-3-git-send-email-lyz@rock-chips.com>
	<CAD=FV=URDM5yH-t6kRvq=70v3OM=a7z6TesBrzqGZ9m-oxf+qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=URDM5yH-t6kRvq=70v3OM=a7z6TesBrzqGZ9m-oxf+qg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yunzhi Li <lyz@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, jwerner@chromium.org, Olof Johansson <olof@lixom.net>, Tao Huang <huangtao@rock-chips.com>, Chris <zyw@rock-chips.com>, Eddie Cai <cf@rock-chips.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Dec 11, 2014 at 10:46 AM, Doug Anderson <dianders@chromium.org> wrote:
> Yunzhi,
>
> On Thu, Dec 11, 2014 at 1:55 AM, Yunzhi Li <lyz@rock-chips.com> wrote:
>> This patch adds a binding that describes the Rockchip usb PHYs
>> found on Rockchip SoCs usb interface.
>
> Technically the bindings patch is supposed to come before the driver.
> So this should be patch #1 and the driver patch #2.
>
>
>> +Required properties:
>> + - compatible: rockchip,rk3288-usb-phy
>> + - rockchip,grf : phandle to the syscon managing the "general
>> +   register files"
>> + - #phy-cells: should be 1
>> + - #address-cells: should be 1
>> + - #size-cells: should be 0
>> +
>> +Sub-nodes:
>> +Each PHY should be represented as a sub-node.
>> +
>> +Sub-nodes
>> +required properties:
>> +- reg: the PHY number
>> +               "0" - PHY connect to OTG controller
>> +               "1" - PHY connect to HOST0 controller
>> +               "2" - PHY connect to HOST1 controller
>
> You don't have any sub nodes and are using the phy-cells.  Seems like
> you should get rid of this?  ...or I guess switch to using sub nodes
> and set "phy-cells" to 0?

Oh.  You actually have them in the ".dtsi" patch, but not here in the
example.  Hrm.  I don't know enough about phys in general to say
whether they're needed (I will learn if someone else on this thread
doesn't just know), but if they are required then they ought to be in
the example...
