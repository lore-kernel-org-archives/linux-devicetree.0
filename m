From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH 3/8] ARM: dts: imx7s: Adjust anatop-enable-bit for 'reg_1p0d'
Date: Fri, 14 Apr 2017 07:33:49 -0700
Message-ID: <CAHQ1cqFpc5fqa5MvZ6sMyr-Q_ZbBsLvbatrNpV3Y_G1sogc=FA@mail.gmail.com>
References: <20170413133242.5068-1-andrew.smirnov@gmail.com>
 <20170413133242.5068-4-andrew.smirnov@gmail.com> <20170414032853.GF14915@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170414032853.GF14915@dragon>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Andrey Yurovsky <yurovsky@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 13, 2017 at 8:28 PM, Shawn Guo <shawnguo@kernel.org> wrote:
> On Thu, Apr 13, 2017 at 06:32:37AM -0700, Andrey Smirnov wrote:
>> In PMU_REG_1P0Dn ENABLE_LINREG is bit 0. Bit 31 is called OVERRIDE and
>> it serves the function of granting permission to GPC IP block to alter
>> various bit-fields of the register. The reason why this property, that
>> trickeld here from Freescale BSP, is set to 31 is because in the code
>> it came from it is used in conjunction with a notifier handler for
>> REGULATOR_EVENT_PRE_DO_ENABLE and REGULATOR_EVENT_PRE_DO_DISABLE
>> events (not found in upstream kernel) that triggers GPC to start
>> manipulating aforementioned other bitfields.
>>
>> Since:
>>       a) none of the aforementioned machinery is implemented by
>>          upstream
>>       b) using 'anatop-enable-bit' in that capacity is a bit of a
>>          semantic stretch
>>
>> simplify the situation by setting the value of 'anatop-enable-bit' to
>> point to ENABLE_LINREG (same as i.MX6).
>>
>> Cc: yurovsky@gmail.com
>> Cc: Sascha Hauer <kernel@pengutronix.de>
>> Cc: Fabio Estevam <fabio.estevam@nxp.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Russell King <linux@armlinux.org.uk>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>
> Since patch 1 ~ 3 are all about adding anatop-enable-bit, can we squash
> them into one patch?

OK. Will do in v2.
