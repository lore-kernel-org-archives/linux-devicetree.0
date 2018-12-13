From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v1] pinctrl: mediatek: improve Kconfig dependencies
Date: Thu, 13 Dec 2018 08:49:46 -0800
Message-ID: <7hlg4ts76d.fsf@baylibre.com>
References: <e4eb66dec2901016e01767932461c5d560762f66.1544666839.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e4eb66dec2901016e01767932461c5d560762f66.1544666839.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Weijie Gao <weijie.gao@mediatek.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>
List-Id: devicetree@vger.kernel.org

Ryder Lee <ryder.lee@mediatek.com> writes:

> Remove prompts to make all pinctrl cores to non-visible symbols and
> make sure the target SoCs would be coupled with the corresponding
> cores.
>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

Tested-by: Kevin Hilman <khilman@baylibre.com>

Tested on the mt7623-rfb1 board which has been failing in kernelCI, and
this patch gets things booting again.

Kevin
