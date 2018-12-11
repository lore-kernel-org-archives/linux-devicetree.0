From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2.2 24/34] dt-bindings: arm: Convert Rockchip board/soc
 bindings to json-schema
Date: Tue, 11 Dec 2018 09:21:09 -0600
Message-ID: <CAL_Jsq+0+-yzB8mAodaK75Es6RPn=L5SCkFD7wgC-ZxaJtb3mg@mail.gmail.com>
References: <20181203213223.16986-1-robh@kernel.org> <2386212.ILKoqq0Ivo@phil>
 <CAL_JsqL9PyD=0jy+GF5g8ee-FO_ijvArnzEohuvqK5Od3yr7fg@mail.gmail.com> <30286035.tdc4tAKEPf@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <30286035.tdc4tAKEPf@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: "heiko@sntech.de" <heiko@sntech.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, ARM-SoC Maintainers <arm@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 10, 2018 at 4:45 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> From: Rob Herring <robh@kernel.org>
>
> Convert Rockchip SoC bindings to DT schema format using json-schema.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> [move to per-board entries and added recently added boards]
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> Hi Rob,
>
> thanks for the libyaml hint, now dtc does check my dts nicely and
> emits quite a number of little complaints ;-) .
>
> Also that suggestion to move the original firefly release+beta boards
> together was great and I just did that.
>
> Should look ok now, if so I'll apply it tomorrow.

LGTM
