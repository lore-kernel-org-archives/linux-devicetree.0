From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: meson8b: odroidc1: Enable usb phy node
Date: Wed, 23 Jan 2019 23:55:04 +0530
Message-ID: <CANAwSgQXFWNP4NdmheyE2O25FzBk7VOwbY1h7rx4GrH9J4XiZg@mail.gmail.com>
References: <20190113181808.5768-1-linux.amoon@gmail.com> <7hef93mi88.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7hef93mi88.fsf@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Emiliano Ingrassia <ingrassia@epigenesys.com>
List-Id: devicetree@vger.kernel.org

Hi Kevin,
On Wed, 23 Jan 2019 at 22:20, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Anand Moon <linux.amoon@gmail.com> writes:
>
> > Add missing vbus-supply link to phy controller for usb_phy0
> > and usb_phy1 nodes, this changes fixed the power issue
> > on usb ports usb, changes help fix usb reset warning.
> >
> > [  821.991470] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> > [  825.243385] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> > [  828.151310] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> > [  830.991241] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> >
> > Fixes: 2eb79a4d15ff (ARM: dts: meson: enabling the USB Host controller on Odroid-C1/C1+ board)
> > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > Rebased on Kevin's amlogic/v5.0/fixes branch
>
> As requested, dropping this series from the fixes branch pending further
> debug and testing.
>
> Kevin

[snip]

Thanks your very much.

Best Regards
-Anand
