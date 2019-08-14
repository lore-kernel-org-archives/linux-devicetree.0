From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 5/5] ARM: dts: sunxi: Add missing watchdog interrupts
Date: Wed, 14 Aug 2019 12:44:02 +0800
Message-ID: <CAGb2v66C-Mqdo-xWm4RAw33sFk-gLy-L_YWQ__6BjYU9gcpYug@mail.gmail.com>
References: <20190813124744.32614-1-mripard@kernel.org> <20190813124744.32614-5-mripard@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190813124744.32614-5-mripard@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-kernel <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 13, 2019 at 8:48 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>
> The watchdog has an interrupt on all our SoCs, but it wasn't always listed.
> Add it to the devicetree where it's missing.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

On a separate note, the A31 has four watchdogs in the timer block, and
one interrupt for each watchdog. Should we expand the node to encompass
all of them, or add separate nodes for each additional one?

Thanks
