From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 5/7] pinctrl: sunxi: define A31 R_PIO pin functions
Date: Tue, 22 Apr 2014 13:47:01 +0200
Message-ID: <CACRpkdam1a0TUPx4rMG6mzXwRdYZgfeZdBUhk0hnWAbKVQKr=A@mail.gmail.com>
References: <1397137966-30818-1-git-send-email-boris.brezillon@free-electrons.com>
	<1397137966-30818-6-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1397137966-30818-6-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-doc-owner@vger.kernel.org
To: Boris BREZILLON <boris.brezillon@free-electrons.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, Mike Turquette <mturquette@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Shuge <shuge@allwinnertech.com>, kevin@allwinnertech.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dev@linux-sunxi.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 10, 2014 at 3:52 PM, Boris BREZILLON
<boris.brezillon@free-electrons.com> wrote:

> The A31 SoC provides both PL and PM pio bank through the R_PIO block.
>
> These pins all support gpio function and can bbe assigned to system
> peripherals (like TWI, P2WI, JTAG, ...)
>
> Add new compatible string to the DT bindings doc.
>
> Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
> Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

PARTLY APPLIED.

The patch to the DT bindings apparently depend on some
patch that I do *NOT* have in my tree, please figure out what is
going on here and help me figure out what and how to apply the
changes to the bindings.

The hunk adding the docs was dropped from the patch, please
develop new series on top of my pinctrl devel branch as I
push it out.

Yours,
Linus Walleij
