From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v10 2/3] power-domain: rockchip: add power doamin driver
Date: Wed, 12 Nov 2014 11:22:57 -0800
Message-ID: <CAD=FV=V-qhi5rPxe_WGcS1JAZba_euFY3YuUyO_4mbqvJPUtzQ@mail.gmail.com>
References: <1415690392-9278-1-git-send-email-caesar.wang@rock-chips.com>
	<1415690392-9278-3-git-send-email-caesar.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1415690392-9278-3-git-send-email-caesar.wang@rock-chips.com>
Sender: linux-doc-owner@vger.kernel.org
To: Caesar Wang <caesar.wang@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Heiko Stuebner <heiko@sntech.de>, Russell King <linux@arm.linux.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Ulf Hansson <ulf.hansson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, ZhenFu Fang <fzf@rock-chips.com>, Eddie Cai <cf@rock-chips.com>, Jack Dai <jack.dai@ro>
List-Id: devicetree@vger.kernel.org

Caesar,

On Mon, Nov 10, 2014 at 11:19 PM, Caesar Wang
<caesar.wang@rock-chips.com> wrote:
> +       pm_genpd_init(&pd->genpd, NULL, false);

As Dmitry pointed out in another context, maybe this should be
"pm_genpd_init(&pd->genpd, NULL, !is_on);"
