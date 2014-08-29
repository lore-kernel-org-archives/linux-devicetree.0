From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] pinctrl: single: AM437x: Add pinctrl compatibility
Date: Fri, 29 Aug 2014 09:29:23 +0200
Message-ID: <CACRpkdZzfN7VQipTUKzfc-W5N4NSTxSou+aagBVh4so=X8gi-g@mail.gmail.com>
References: <1408716062-26055-1-git-send-email-nm@ti.com>
	<1408716062-26055-4-git-send-email-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1408716062-26055-4-git-send-email-nm@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>, Paul Walmsley <paul@pwsan.com>, Kevin Hilman <khilman@deeprootsystems.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux-OMAP <linux-omap@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Keerthy <j-keerthy@ti.com>, =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Dave Gerlach <d-gerlach@ti.com>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 22, 2014 at 4:01 PM, Nishanth Menon <nm@ti.com> wrote:

> From: Keerthy <j-keerthy@ti.com>
>
> AM437x pinctrl definitions now differ from traditional 16 bit OMAP pin
> ctrl definitions, in that all 32 bits are used to describe a single pin
>
> Also the location of wakeupenable and event bits have changed.
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> [nm@ti.com: minor updates]
> Signed-off-by: Nishanth Menon <nm@ti.com>

Patch applied with Tony's ACK.

Yours,
Linus Walleij
