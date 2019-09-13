From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: Add missing clocks requirement in Samsung SoC watchdog
Date: Fri, 13 Sep 2019 15:36:16 +0100
Message-ID: <5d7ba961.1c69fb81.d2fcd.6ff4@mx.google.com>
References: <20190907144541.16949-1-krzk@kernel.org> <20190907144541.16949-2-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190907144541.16949-2-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat,  7 Sep 2019 16:45:41 +0200, Krzysztof Kozlowski wrote:
> The Samsung SoC watchdog driver always required providing a clock
> (either through platform data or from DT).  However when bindings were
> added in commit 9487a9cc7140 ("watchdog: s3c2410: Add support for device
> tree based probe"), they missed the requirement of clock.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/watchdog/samsung-wdt.yaml          | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
