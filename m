From: "jay.xu" <jay.xu@rock-chips.com>
Subject: Re: [PATCH 4/4] ARM64: dts: rockchip: add dts file for RK3399
 evaluation board
Date: Wed, 27 Apr 2016 08:57:19 +0800
Message-ID: <57200E6F.1080507@rock-chips.com>
References: <1461638206-20473-1-git-send-email-jay.xu@rock-chips.com>
 <1461638206-20473-5-git-send-email-jay.xu@rock-chips.com>
 <9945516.Q6LYCrkl5z@diego>
 <CAD=FV=Wgnz-vBo71f3mqFxcOpL7fJX58hXPJ+vk9uHpymqdN5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=Wgnz-vBo71f3mqFxcOpL7fJX58hXPJ+vk9uHpymqdN5Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Cc: lintao <lintao@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Tao Huang <huangtao@rock-chips.com>, David Riley <davidriley@chromium.org>, Julius Werner <jwerner@chromium.org>, smbarber@chromium.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Doug=EF=BC=9A

On 2016=E5=B9=B404=E6=9C=8827=E6=97=A5 04:53, Doug Anderson wrote:
> Hi,
>
> On Tue, Apr 26, 2016 at 5:37 AM, Heiko St=C3=BCbner <heiko@sntech.de>=
 wrote:
>>> +     model =3D "Rockchip RK3399 Evaluation Board";
>>> +     compatible =3D "rockchip,rk3399-evb", "rockchip,rk3399",
>>> +                  "google,rk3399evb-rev2", google,rk3399evb-rev1",
>>> +                  "google,rk3399evb-rev0" ;
>>
>> can you check against which compatibles that coreboot really matches=
?
>>
>> As we said that the evb changed between rev1 and rev2, I would expec=
t the
>> compatible to be something like
>>
>>          compatible =3D "rockchip,rk3399-evb",  "google,rk3399evb-re=
v2",
>>                          "rockchip,rk3399";
>>
>> leaving out the rev1 and rev0
>
> What Heiko suggests seems reasonable to me.
>
> It all depends on what your bootloader is doing and what you guys wan=
t
> to do.  Chrome OS designs that I've worked on have had board
> strappings that you can read a board ID from and that's how the BIOS
> (like coreboot) will figure out which board ID it is running on.  I'm
> not aware of such strappings on rk3399-evb.  Do they exist?
>
> Of course, even without strappings it's possible to get the bootloade=
r
> to work sanely.  You can either define the revision number at build
> time or you can store the revision number somewhere non-volatile.
>
yes, I will talk with coreboot developer about this, maybe to fix it in=
=20
coreboot and just keep simple in dtsi file.

thanks

Jianqun
>
> -Doug
>
>
>
