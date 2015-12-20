From: Caesar Wang <caesar.upstream@gmail.com>
Subject: Re: [PATCH v1 0/6] Support the rk3036 Kylin board
Date: Sun, 20 Dec 2015 20:49:14 +0800
Message-ID: <5676A3CA.6090205@gmail.com>
References: <1450362112-8075-1-git-send-email-wxt@rock-chips.com> <9746732.gszC1tXaj9@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9746732.gszC1tXaj9@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: Caesar Wang <wxt@rock-chips.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, keescook@google.com, leozwang@google.com
List-Id: devicetree@vger.kernel.org

Hi Heiko,

=E5=9C=A8 2015=E5=B9=B412=E6=9C=8820=E6=97=A5 01:16, Heiko St=C3=BCbner=
 =E5=86=99=E9=81=93:
> Hi Caesar,
>
> Am Donnerstag, 17. Dezember 2015, 22:21:46 schrieb Caesar Wang:
>> Kylin-board is based on RK3036 SOCs, add the initiation
>> version for working.
> I've applied:
> - patch1 (please include the "rockchip:" part in dts subjects)
> - patch3 (dito)
> - patch4 (after merging in patch6 and dropping the hdmi+lcdc parts)

Okay, thanks!

Sync to the rockchip github=20
<https://github.com/rockchip-linux/kernel/commits/develop4.4>.

> Please resubmit the missing parts (audio + graphics) against my dts-b=
ranch [0]
> after the relevant maintainers have added the code-parts to their tre=
es.

=46or codec:
RT5616 is existing  in
https://git.kernel.org/cgit/linux/kernel/git/broonie/sound.git/log/?h=3D=
for-next=20
now.

=46or 3036 vop:
I would like wait a moment from Mark Yao updating the driver.


>
> Thanks
> Heiko
>
> [0] https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip=
=2Egit/log/?h=3Dv4.5-armsoc/dts32
>
>> This series patches have the following decriptions:
>>
>> PATCH[1/6]:
>> ARM: dts: fix the correct pinctrl control for rk3036
>>
>> The pinctrl gpio pull up/down is incorrect since the rk3036 SoCs
>> can't set the status in the internal.
>> ---
>>
>> PATCH[2/6]:
>> ARM: dts: add the lcdc and hdmi node for rk3036
>>
>> Add the devices is related to display.
>> Based on the series patches of Mark Yao's
>> ---
>>
>> PATCH[3/6]:
>> ARM: dts: add the sdio/sdmmc node for rk3036
>>
>> Add the wifi/sd card work for kylin board.
>> ---
>>
>> PATCH[4/6]:
>> ARM: dts: rockchip: add the kylin board for rk3036
>>
>> Add the dts for kylin board.
>> ---
>>
>> PATCH[5/6]:
>> ARM: dts: add the sound codec for kylin board
>>
>> Make the codec rt5616 working on kylin board.
>> The realteak have been upstream for Mark Brown,
>> I guess need some days to review.
>>
>> ---
>>
>> PATCH[6/6]:
>> ARM: dts: add the sdio node for kylin board
>>
>> Enable the sdio for kylin board.
>> ---
>>
>>
>>
>> Caesar Wang (6):
>>    ARM: dts: fix the correct pinctrl control for rk3036
>>    ARM: dts: add the lcdc and hdmi node for rk3036
>>    ARM: dts: add the sdio/sdmmc node for rk3036
>>    ARM: dts: rockchip: add the kylin board for rk3036
>>    ARM: dts: add the sound codec for kylin board
>>    ARM: dts: add the sdio node for kylin board
>>
>>   Documentation/devicetree/bindings/arm/rockchip.txt |   4 +
>>   arch/arm/boot/dts/Makefile                         |   1 +
>>   arch/arm/boot/dts/rk3036-kylin.dts                 | 345
>> +++++++++++++++++++++ arch/arm/boot/dts/rk3036.dtsi                 =
     |
>> 167 ++++++++-- 4 files changed, 498 insertions(+), 19 deletions(-)
>>   create mode 100644 arch/arm/boot/dts/rk3036-kylin.dts
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
