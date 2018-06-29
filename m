From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v2 1/3] arm64: dts: actions: Enable clock controller for
 S700
Date: Fri, 29 Jun 2018 19:38:50 +0200
Message-ID: <c3a62fea-a769-d2fc-2fef-c43ac9c95de6@suse.de>
References: <20180626192820.28237-3-sravanhome@gmail.com>
 <20180628191805.3722-1-sravanhome@gmail.com>
 <20180628191805.3722-2-sravanhome@gmail.com>
 <153029379879.143105.2037926027438984922@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <153029379879.143105.2037926027438984922@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Saravanan Sekar <sravanhome@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, catalin.marinas@arm.com, mturquette@baylibre.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, manivannan.sadhasivam@linaro.org, pn@denx.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am 29.06.2018 um 19:36 schrieb Stephen Boyd:
> Quoting Saravanan Sekar (2018-06-28 12:18:03)
>> diff --git a/arch/arm64/boot/dts/actions/s700-cubieboard7.dts b/arch/arm64/boot/dts/actions/s700-cubieboard7.dts
>> index ef79d7905f44..28f3f4a0f7f0 100644
>> --- a/arch/arm64/boot/dts/actions/s700-cubieboard7.dts
>> +++ b/arch/arm64/boot/dts/actions/s700-cubieboard7.dts
>> diff --git a/arch/arm64/boot/dts/actions/s700.dtsi b/arch/arm64/boot/dts/actions/s700.dtsi
>> index 66dd5309f0a2..3530b705df90 100644
>> --- a/arch/arm64/boot/dts/actions/s700.dtsi
>> +++ b/arch/arm64/boot/dts/actions/s700.dtsi
> 
> Can the above part be split from the below part? I don't want to merge
> dts bits into clk tree, when those should normally go through arm-soc.
> 
>> diff --git a/include/dt-bindings/clock/actions,s700-cmu.h b/include/dt-bindings/clock/actions,s700-cmu.h
>> new file mode 100644

This part needs to go into the bindings patch, which should be 1/3, not
3/3 please.

Thanks,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
