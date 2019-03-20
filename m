From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/4] clk: meson: meson8b: use a sparate clock table for Meson8m2
Date: Wed, 20 Mar 2019 21:38:33 +0100
Message-ID: <CAFBinCC61EgCS2djT2NZdYnGsHM1VS3_zOzaxSDyHGdguLCFyg@mail.gmail.com>
References: <20190319215121.29340-1-martin.blumenstingl@googlemail.com>
 <20190319215121.29340-3-martin.blumenstingl@googlemail.com> <1d52f584-1a5d-8b0d-ecd0-8c041f2b9c18@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1d52f584-1a5d-8b0d-ecd0-8c041f2b9c18@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Neil,

On Wed, Mar 20, 2019 at 9:15 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> There is a typo in the subject "s/sparate/separate/" !
good catch - I'll wait until the weekend and send a fixed version then!

> On 19/03/2019 22:51, Martin Blumenstingl wrote:
> > Meson8, Meson8b and Meson8m2 implement a similar clock controller.
> > However, there are a few differences between the three actual IP blocks.
> >
> > One example where Meson8m2 differs from Meson8b is the VPU clock setup:
> > - the VPU input mux can choose between "fclk_div4", "fclk_div3",
> >   "fclk_div5" and "fclk_div7" on Meson8b
> > - however, on Meson8m2 it can choose between "fclk_div4", "fclk_div3",
> >   "fclk_div5" and "gp_pll" (GP_PLL only exists on Meson8m2, it's the
> >   predecessor of the GP0_PLL clock on GXBB/GXL/GXM))
>
> By curiosity, what is the default (maximum) setup ? On GX & G12A, fclk_div3 is the default/max setup.
u-boot on my Meson8m2 board uses GP_PLL as input (364MHz)
u-boot on my Meson8b (Odroid-C1) uses fclk_div7 as input (approx. 364MHz)
if you want I can look up the divider (I don't remember it from the
top of my head)

[...]
> Apart the typo in the subject,
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
thank you!


Regards
Martin
