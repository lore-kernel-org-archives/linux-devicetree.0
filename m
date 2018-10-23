From: tony <tony.xie@rock-chips.com>
Subject: Re: [PATCH v4 1/5] mfd: rk808: Add RK817 and RK809 support
Date: Tue, 23 Oct 2018 11:33:10 +0800
Message-ID: <219a9cdd-00d7-2920-4986-dcc1c8a27f6c@rock-chips.com>
References: <1535968829-19418-1-git-send-email-tony.xie@rock-chips.com>
 <1535968829-19418-2-git-send-email-tony.xie@rock-chips.com>
 <20180911123907.GN4185@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180911123907.GN4185@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: heiko@sntech.de, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, chenjh@rock-chips.com, xsf@rock-chips.com, zhangqing@rock-chips.com, huangtao@rock-chips.com
List-Id: devicetree@vger.kernel.org


> On Mon, 03 Sep 2018, Tony Xie wrote:
>
>>      The rk809 and rk817 are a Power Management IC (PMIC) for multimedia
>>      and handheld devices. It contains the following components:
>>
>>          - Regulators
>>          - RTC
>>          - Clocking
>>
>>      Both RK809 and RK817 chips are using a similar register map,
>>      so we can reuse the RTC and Clocking and regulators functionality.
>>
>> Signed-off-by: Tony Xie <tony.xie@rock-chips.com>
>> ---
> It's often helpful to place a Changelog in this space.
     I will output the changelog in the first mail when send-mail.
>
>>   drivers/mfd/Kconfig       |   6 +-
>>   drivers/mfd/rk808.c       | 218 +++++++++++++++++++++++++++++++++++++++++++++-
>>   include/linux/mfd/rk808.h | 172 ++++++++++++++++++++++++++++++++++++
>>   kernel/reboot.c           |   1 +
>>   4 files changed, 391 insertions(+), 6 deletions(-)
> I just reviewed v4.
>
> It looks like the review comments are still relevant.
     I will commit the v5 today which includes some modification base on 
your comments base in the v3.
>
