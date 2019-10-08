From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v2] arm64: dts: marvell: add ESPRESSObin variants
Date: Tue, 08 Oct 2019 14:57:27 +0200
Message-ID: <877e5ftmx4.fsf@FE-laptop>
References: <20190603155354.3902-1-tmn505@gmail.com> <87a7abtn0y.fsf@FE-laptop>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87a7abtn0y.fsf@FE-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Maciej Nowak <tmn505@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Konstantin Porotchkin <kostap@marvell.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> Hi Tomasz Maciej Nowak,
>
>> This commit adds dts for different variants of ESPRESSObin board:
>>
>> ESPRESSObin with soldered eMMC,
>>
>> ESPRESSObin V7, compared to prior versions some passive elements changed
>> and ethernet ports labels positions have been reversed,
>>
>> ESPRESSObin V7 with soldered eMMC.
>>
>> Since most of elements are the same, one common dtsi is created and
>> referenced in each dts of particular variant.
>>
>> Signed-off-by: Tomasz Maciej Nowak <tmn505@gmail.com>
>
>
> Applied on mvebu/dt

I meant mvebu/dt64

>
> Sorry for the delay.
>
> Thanks,
>
> Gregory
-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
