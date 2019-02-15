From: agajjar <Akash_Gajjar@mentor.com>
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: rockpro64 dts remove unused
 node
Date: Fri, 15 Feb 2019 17:38:16 +0530
Message-ID: <ac22440d-3b64-1cf2-205c-52ea7c1c23f9@mentor.com>
References: <20190213170651.3210-1-Akash_Gajjar@mentor.com>
 <20190213170651.3210-3-Akash_Gajjar@mentor.com> <4653141.o6ZdamfZ6d@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4653141.o6ZdamfZ6d@diego>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Oskari Lemmela <oskari@lemmela.net>, Shohei Maruyama <cheat.sc.linux@outlook.com>, Levin Du <djw@t-chip.com.cn>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 2/15/2019 2:48 PM, Heiko Stübner wrote:
> Am Mittwoch, 13. Februar 2019, 18:06:38 CET schrieb Akash Gajjar:
>> lcd panel pinmux and vcc1v8_s3 regulator is redundant and has a no impact,
>> so removing it.
>>
>> Signed-off-by: Akash Gajjar <Akash_Gajjar@mentor.com>
Hi Heiko,
> vcc1v8_s3 is actually also a emmc supply, so I'd like to keep it around
> for completenes sake.

Emmc module is supplied by PMIC vcc3v3_s3 (SWITCH_REG1) and vcc_1v8 
(DCD_REG4).

So I believe removing vcc1v8_s3 has no impact on emmc supply line.


Thanks,
Akash

>
> I've now dropped the regulator portions so that only the lcd-pinmux
> gets removed and reworded the commit message accordingly
> and applied the result for 5.1
>
> Thanks
> Heiko
>
>
>
