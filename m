From: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH] arm64: dts: hikey: Define wl1835 power capabilities
Date: Wed, 13 Jun 2018 18:34:45 +0100
Message-ID: <521dd38a-29b8-5670-4296-84b300921b3d@arm.com>
References: <20180613151305.17240-1-ryan@edited.us>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180613151305.17240-1-ryan@edited.us>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ryan Grachek <ryan@edited.us>
Cc: Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 13/06/18 16:13, Ryan Grachek wrote:
> These properties are required for compatibility with runtime PM.
> Without these properties, MMC host controller will not be aware
> of power capabilities. When the wlcore driver attempts to power
> on the device, it will erroneously fail with -EACCES.
> 

I don't have a hikey620 to test this, but the hikey960 is suffering from the
same issue (see [1]). I added these properties to the dwmmc2 node of the
hikey960 (see snippet) and wlan0 does show up. Would you mind sending a
similar patch for that board ?

Thanks !

Valentin

[1]: https://lkml.org/lkml/2018/6/12/930

--->8

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index 85aadf1b..c706f70 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -613,6 +613,8 @@
        vmmc-supply = <&wlan_en>;
        ti,non-removable;
        non-removable;
+       cap-power-off-card;
+       keep-power-in-suspend;
        #address-cells = <0x1>;
        #size-cells = <0x0>;
        status = "ok";
