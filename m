Return-Path: <SRS0=9vUV=SG=codeaurora.org=kvalo@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/4] mwifiex: Flag wake-up interrupt as IRQ_NOAUTOEN
 rather than disabling it too late
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190224140426.3267-4-marc.zyngier@arm.com>
References: <20190224140426.3267-4-marc.zyngier@arm.com>
Message-Id: <20190404102251.6C12561A86@smtp.codeaurora.org>
Date: Thu,  4 Apr 2019 10:22:50 +0000 (UTC)
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Amitkumar Karwar <amitkarwar@gmail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Ganapathi Bhat <gbhat@marvell.com>, Heiko Stuebner <heiko@sntech.de>, Nishant Sarmukadam <nishants@marvell.com>, Rob Herring <robh+dt@kernel.org>, Xinming Hu <huxinming820@gmail.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Marc Zyngier <marc.zyngier@arm.com> wrote:

> The mwifiex driver makes unsafe assumptions about the state of the
> wake-up interrupt. It requests it and only then disable it. Of
> course, the interrupt may be screaming for whatever reason at that
> time, and the handler will then be called without the interrupt
> having been registered with the PM/wakeup subsystem. Oops.
> 
> The right way to handle this kind of situation is to flag the
> interrupt with IRQ_NOAUTOEN before requesting it. It will then
> stay disabled until someone (the wake-up subsystem) enables it.
> 
> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
> Reviewed-by: Brian Norris <briannorris@chromium.org>

Failed to apply:

fatal: sha1 information is lacking or useless (drivers/net/wireless/marvell/mwifiex/main.c).
error: could not build fake ancestor
Applying: mwifiex: Flag wake-up interrupt as IRQ_NOAUTOEN rather than disabling it too late
Patch failed at 0001 mwifiex: Flag wake-up interrupt as IRQ_NOAUTOEN rather than disabling it too late
The copy of the patch that failed is found in: .git/rebase-apply/patch

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/10827971/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
