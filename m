From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH v10 2/3] power-domain: rockchip: add power doamin driver
Date: Tue, 11 Nov 2014 08:53:13 -0800
Message-ID: <7h7fz1of0m.fsf@deeprootsystems.com>
References: <1415690392-9278-1-git-send-email-caesar.wang@rock-chips.com>
	<1415690392-9278-3-git-send-email-caesar.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1415690392-9278-3-git-send-email-caesar.wang@rock-chips.com>
	(Caesar Wang's message of "Tue, 11 Nov 2014 15:19:51 +0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Caesar Wang <caesar.wang@rock-chips.com>
Cc: linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>, Russell King <linux@arm.linux.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, dianders@chromium.org, linux-rockchip@lists.infradead.org, Ulf Hansson <ulf.hansson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, fzf@rock-chips.com, cf@rock-chips.com, Jack Dai <jack.dai@rock-chips.com>, "jinkun.hong" <jinkun.hong@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Caesar Wang <caesar.wang@rock-chips.com> writes:

> In order to meet high performance and low power requirements, a power
> management unit is designed or saving power when RK3288 in low power mode.
> The RK3288 PMU is dedicated for managing the power ot the whole chip.
>
> Signed-off-by: Jack Dai <jack.dai@rock-chips.com>
> Signed-off-by: jinkun.hong <jinkun.hong@rock-chips.com>
> Signed-off-by: Caesar Wang <caesar.wang@rock-chips.com>
>
> ---
>
> Changes in v10:
>     - this switches over domain infos to use masks instead of recomputing
>       them each time and also gets rid of custom domain translator and
>       uses standard onecell on.
>
> Changes in v9:
>     - fix v8 changes as follows:
>     - This reconciles the v2 and v7 code so that we power domain have
>       lists of clocks they toggle on and off during power transitions and
>       independently from power domains clocks we attach clocks to devices
>       comprising power domain and prepare them so they are turn on and off
>       by runtime PM.

I still don't like having lists of clocks in the power-domain DT. 

DT is supposed to describe the hardware, and clocks are properties of
devices, not power-domains, so the DT description should follow from that.

I understand that some device may not be probed etc. when a power-domain
needs to transition, but the power-domain driver can still get the list
of clocks it needs from the device nodes within the domain, so it
shouldn't matter whether devices are probed or not.

Kevin
