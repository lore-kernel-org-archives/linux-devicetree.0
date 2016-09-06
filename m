From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 7/7] ARM: sun8i: Convert the A23 and A33 to the CCU
Date: Tue, 6 Sep 2016 22:08:05 +0800
Message-ID: <CAGb2v64r-vURPZNhPhKv2+7kByckdxW=fPH-9qAfBLxH992qWQ@mail.gmail.com>
References: <20160906121837.7517-1-maxime.ripard@free-electrons.com> <20160906121837.7517-8-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160906121837.7517-8-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Mylene Josserand <mylene.josserand@free-electrons.com>, linux-clk <linux-clk@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 6, 2016 at 8:18 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Now that we have support for the CCU driver in sunxi-ng, convert the A23
> and A33 DTs to that driver.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

TODO note for later:

    The usb_otg and usbphy node definitions can be moved to the common dtsi
    file, and there compatibles and regs (for usbphy) defined in the SoC
    dtsi.
