From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ARM: dts: rockchip: Add dynamic-power-coefficient for rk3288
Date: Fri, 12 Apr 2019 12:08:21 +0200
Message-ID: <9063550.zi1cCdPW0A@diego>
References: <20190412000158.248080-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412000158.248080-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

Am Freitag, 12. April 2019, 02:01:58 CEST schrieb Matthias Kaehlcke:
> The value was determined with the following method:
> 
> - take CPUs 1-3 offline
> - for each OPP
>   - set cpufreq min and max freq to OPP freq
>   - start dhrystone benchmark
>   - measure CPU power consumption during 10s
>   - calculate Cx for OPPx
>     - Cx = (Px - P1) / (Vx²fx - V1²f1)          [1]
>       using the following units: mW / Ghz / V   [2]
> - C = avg(C2, ..., Cn)
> 
> [1] see commit 4daa001a1773 ("arm64: dts: juno: Add cpu
>      dynamic-power-coefficient information")
> [2] https://patchwork.kernel.org/patch/10493615/#22158551
> 
> FTR, these are the values for the different OPPs:
> 
> freq (kHz)   	mV		Px (mW)		Cx
> 
> 126000		900		39
> 216000		900		66		370
> 312000		900		95		372
> 408000		900		122		363
> 600000		900		177		359
> 696000		950		230		363
> 816000		1000		297		361
> 1008000		1050		404		362
> 1200000		1100		528		362
> 1416000		1200		770		377
> 1512000		1300		984		385
> 1608000		1350		1156		394
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

I've applied this for 5.2 but moved the new entries
below the clock properties for some more alphabetic ordering.


Heiko
