From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 5/5] arm64: dts: meson: sei510: add network support
Date: Sat, 11 May 2019 19:16:16 +0200
Message-ID: <CAFBinCDA3kqCK9riSkNAv9069ASN8E2ECdsffi+U7mYRqHrfJg@mail.gmail.com>
References: <20190510164940.13496-1-jbrunet@baylibre.com> <20190510164940.13496-6-jbrunet@baylibre.com>
 <7ho94ac4jn.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7ho94ac4jn.fsf@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Kevin,

On Sat, May 11, 2019 at 12:45 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Jerome Brunet <jbrunet@baylibre.com> writes:
>
> > Enable the network interface of the SEI510 which use the internal PHY.
> >
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
> I tried testing this series on SEI510, but I must still be missing some
> defconfig options, as the default defconfig doesn't lead to a working
> interface.
>
>
> I tried adding this kconfig fragment[1], and the dwmac probes/inits but
> I must still be missing something, as the dwmac is still failing to find
> a PHY.  Boot log: https://termbin.com/ivf3
>
> I have the same result testing on the u200.
I wonder if we're simply missing the pinctrl definitions in the ethmac node:
  pinctrl-0 = <&eth_rmii_pins>;
  pinctrl-names = "default";

I don't know how the SoC works internally but I am assuming that the
MDIO pins are routed to the "internal PHY" (within the chip).
also we need the eth_rmii_pins anyways for the RXD/TXD pins which are
connected to the physical Ethernet port on the board.
bonus question: while writing this email I'm surprised to see that on
GXL we don't use the rmii pins anywhere, why is Ethernet working fine
there?


Martin
