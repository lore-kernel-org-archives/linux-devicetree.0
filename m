From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2 1/3] Documentation: bindings: add dt documentation for cdn DP controller
Date: Wed, 14 Feb 2018 10:13:31 +0100
Message-ID: <2259273.IWOZNSGJqo@diego>
References: <20180213143549.15197-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180213143549.15197-1-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Brian Norris <briannorris@chromium.org>, groeck@chromium.org, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Chris Zhong <zyw@rock-chips.com>, kernel@collabora.com
List-Id: devicetree@vger.kernel.org

Am Dienstag, 13. Februar 2018, 15:35:47 CET schrieb Enric Balletbo i Serra:
> From: Chris Zhong <zyw@rock-chips.com>
> 
> This patch adds a binding that describes the cdn DP controller for
> rk3399.
> 
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> Changes since v1:
> - Add the cdn-dp bindings as requested by Heiko
>   - The bindingis were sent already and acked by Rob but for some reason
>     never landed. So as these series are related I incorporated this
>     patch again [1].
> 
> [1] https://patchwork.kernel.org/patch/9278077/

applied for 4.17 (into drm-misc).

The driver uses 3 additional resets now, which I just added to the
reset-names.


Heiko
