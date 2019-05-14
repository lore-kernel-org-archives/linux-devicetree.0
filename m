From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] clk: meson: fix MPLL 50M binding id typo
Date: Tue, 14 May 2019 20:01:47 +0200
Message-ID: <CAFBinCAoj99eieXogc6OVyttAdZk+5y83B0Ltuv3iLNryOq0rw@mail.gmail.com>
References: <20190512205743.24131-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190512205743.24131-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, May 12, 2019 at 10:57 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> MPLL_5OM (the capital letter o) should indeed be MPLL_50M (the number)
> Fix this before it gets used.
>
> Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Fixes: 25db146aa726 ("dt-bindings: clk: meson: add g12a periph clock controller bindings")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

thank you for taking care of this issue Jerome!
