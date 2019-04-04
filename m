From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 3/4] mwifiex: Flag wake-up interrupt as IRQ_NOAUTOEN
 rather than disabling it too late
Date: Thu,  4 Apr 2019 10:22:50 +0000 (UTC)
Message-ID: <20190404102251.0C5FA60A43@smtp.codeaurora.org>
References: <20190224140426.3267-4-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190224140426.3267-4-marc.zyngier@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Ganapathi Bhat <gbhat@marvell.com>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, Xinming Hu <huxinming820@gmail.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Amitkumar Karwar <amitkarwar@gmail.com>, linux-rockchip@lists.infradead.org, Nishant Sarmukadam <nishants@marvell.com>, Rob Herring <robh+dt@kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

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
