From: "Huang, Tao" <huangtao@rock-chips.com>
Subject: Re: [PATCH] ARM64: dts: rockchip: add core dtsi file for RK3399 SoCs
Date: Fri, 22 Apr 2016 12:23:06 +0800
Message-ID: <5719A72A.4070603@rock-chips.com>
References: <1461122150-9042-1-git-send-email-jay.xu@rock-chips.com>
 <1461211092-26331-1-git-send-email-jay.xu@rock-chips.com>
 <3937420.4aN2rRBlcO@diego>
 <CAD=FV=X9S4z2WLEJ-KaaCZxfkdO4+-i2hUd3dsYJi5qXEvpVBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=X9S4z2WLEJ-KaaCZxfkdO4+-i2hUd3dsYJi5qXEvpVBQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Cc: Jianqun Xu <jay.xu@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, David Riley <davidriley@chromium.org>, Julius Werner <jwerner@chromium.org>, smbarber@chromium.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi, Doug:
On 2016=E5=B9=B404=E6=9C=8822=E6=97=A5 06:38, Doug Anderson wrote:
>
>>> +     i2c1: i2c@ff110000 {
>>> +             compatible =3D "rockchip,rk3399-i2c";
>> David respun the rk3399 i2c-support on tuesday, so this and the othe=
rs below
>> are waiting on Wolfram to take a look.
> I think it can work with the rk3288-i2c as a fallback, at least for
> low speed stuff, right?  Should this be:
>
> compatible =3D "rockchip,rk3399-i2c", "rockchip,rk3288-i2c"
>
> Looks like that was done for rk3368.
No. For RK3399 I2C controller:
The I2C controller uses the APB clock/clk_i2c as the working clock. The
APB clock will determine the I2C bus clock, clk_i2c is the function clk=
,
up to 200MHz.
Chips such as RK3288/3368 only uses APB clock. So old driver do not wor=
k
on RK3399.

Thanks,
Huang, Tao
