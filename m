From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: gnss: add mediatek binding
Date: Thu, 14 Feb 2019 10:11:21 +0100
Message-ID: <20190214091121.GI28278@localhost>
References: <1547744074-28308-1-git-send-email-lollivier@baylibre.com>
 <1547744074-28308-3-git-send-email-lollivier@baylibre.com>
 <20190125090755.GB3691@localhost>
 <867eeo7pjm.fsf@baylibre.com>
 <20190211083349.GU4686@localhost>
 <86mun2v27r.fsf@baylibre.com>
 <CALZWD59e356Of+R4H2ZNHJyQcPCQNNdS+1DTc8qNDYp9ZnUpXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALZWD59e356Of+R4H2ZNHJyQcPCQNNdS+1DTc8qNDYp9ZnUpXA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Loys Ollivier <lollivier@baylibre.com>
Cc: Johan Hovold <johan@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 13, 2019 at 04:24:00PM +0100, Loys Ollivier wrote:
> On Mon 11 Feb 2019 at 14:17, Loys Ollivier <lollivier@baylibre.com> wrote:
> > On Mon 11 Feb 2019 at 08:33, Johan Hovold <johan@kernel.org> wrote:

> >> Right, but please do look around for other receivers using this chipset
> >> so that we can make the binding generic enough to cover those as well
> >> (e.g. by choosing representative resource names).
> >>
> > OK will have a look.
> 
> The only mt3339-based receivers I have found are:
> - [0] Globaltop
> - [1] Locosys / Pololu
> They both only provide the UART interface and do not list the I2C/SPI
> interfaces.
> 
> [0] https://cdn-shop.adafruit.com/datasheets/GlobalTop-FGPMMOPA6H-Datasheet-V0A.pdf
> [1] https://www.pololu.com/file/0J641/LS20030~3_datasheet_v1.3.pdf

I found tree more:

 - Globaltop PA6C

   - https://cdn-shop.adafruit.com/datasheets/GlobalTop-FGPMMOPA6C-Datasheet-V0A-Preliminary.pdf

 - Linx RM series
   - https://linxtechnologies.com/wp/wp-content/uploads/rxm-gps-rm.pdf

 - ublox IT530
   - https://www.u-blox.com/sites/default/files/products/documents/IT530_DataSheet_%28FTX-HW-12008%29.pdf

All with uart-interface only and similar pins names, although the ublox
device do have some additional features we can worry about later.

As all but the ublox device use VBACKUP for the backup supply, do you
mind if I change the binding to use "vbackup-supply" instead of
"v-bckp-supply" (which is a ublox-ism) when applying?

Thanks,
Johan
