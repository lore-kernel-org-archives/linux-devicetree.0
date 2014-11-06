From: Kever Yang <kever.yang@rock-chips.com>
Subject: Re: [PATCH v8 1/3] power-domain: rockchip: add power domain drivers
Date: Thu, 06 Nov 2014 17:06:32 +0800
Message-ID: <545B3A18.9030405@rock-chips.com>
References: <1415254961-5746-1-git-send-email-caesar.wang@rock-chips.com> <1415254961-5746-2-git-send-email-caesar.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1415254961-5746-2-git-send-email-caesar.wang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Caesar Wang <caesar.wang@rock-chips.com>, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>, Russell King <linux@arm.linux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "jinkun.hong" <jinkun.hong@rock-chips.com>, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, dianders@chromium.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, fzf@rock-chips.com, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, cf@rock-chips.com, Jack Dai <jack.dai@rock-chips.com>
List-Id: devicetree@vger.kernel.org


On 11/06/2014 02:22 PM, Caesar Wang wrote:
> In order to meet high performance and low power requirements, a power
> management unit is designed or saving power when RK3288 in low power mode.
> The RK3288 PMU is dedicated for managing the power ot the whole chip.
>
> Signed-off-by: Jack Dai<jack.dai@rock-chips.com>
> Signed-off-by: jinkun.hong<jinkun.hong@rock-chips.com>
> Signed-off-by: Caesar Wang<caesar.wang@rock-chips.com>
>
> ---
>
> Changes in v8:
>      - This reconciles the v2 and v7 code so that we power domain have
>      lists of clocks they toggle on and off during power transitions and
>      independently from power domains clocks we attach clocks to devices
>      comprising power domain and prepare them so they are turned on and off
>      by runtime PM.
There are more changes like the new rockchip_pm_add_one_domain.
>
> Changes in v7:
>      - Delete unused variables
