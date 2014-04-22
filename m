From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 6/7] pinctrl: sunxi: add reset control support
Date: Tue, 22 Apr 2014 13:48:33 +0200
Message-ID: <CACRpkdaedD0n4dD3tnz5HxrZVUUfYo7cwmjrs4grQJ-2+P+RZw@mail.gmail.com>
References: <1397137966-30818-1-git-send-email-boris.brezillon@free-electrons.com>
	<1397137966-30818-7-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1397137966-30818-7-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-doc-owner@vger.kernel.org
To: Boris BREZILLON <boris.brezillon@free-electrons.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, Mike Turquette <mturquette@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Shuge <shuge@allwinnertech.com>, kevin@allwinnertech.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dev@linux-sunxi.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 10, 2014 at 3:52 PM, Boris BREZILLON
<boris.brezillon@free-electrons.com> wrote:

> The A31 SoC define a reset line for the R_PIO block which needs to be
> deasserted.
>
> Try to retrieve a reset control and deassert if one was found.
>
> Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>

Patch applied with Maxime's ACK.

Yours,
Linus Walleij
