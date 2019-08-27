From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCHv4 0/3] Odroid c2 usb fixs
Date: Tue, 27 Aug 2019 23:19:36 +0200
Message-ID: <CAFBinCB45YkbgbRNx8aE+yrT7scT6BYZy1h9JozBxsoC6MZGSQ@mail.gmail.com>
References: <20190824184912.795-1-linux.amoon@gmail.com> <CAFBinCCkEE8==-Sqqj_=Ofnx7_H-970dETwEmEPohs74806ZMw@mail.gmail.com>
 <CANAwSgTsua_x6fi7NzC2XjcV19OJcN3NhOT_niKXN4RR4X+qVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANAwSgTsua_x6fi7NzC2XjcV19OJcN3NhOT_niKXN4RR4X+qVQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 26, 2019 at 6:38 AM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Martin,
>
> On Sun, 25 Aug 2019 at 02:48, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > Hi Anand,
> >
> > thank you for the patches
> >
> > On Sat, Aug 24, 2019 at 8:49 PM Anand Moon <linux.amoon@gmail.com> wrote:
> > [...]
> > > Anand Moon (3):
> > >   arm64: dts: meson: odroid-c2: p5v0 is the main 5V power input
> > >   arm64: dts: meson: odroid-c2: Add missing linking regulator to usb bus
> > >   arm64: dts: meson: odroid-c2: Disable usb_otg bus to avoid power
> > >     failed warning
> > this whole series is:
> > Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> Thanks, I have some more patch in line for this board.
great, any improvement counts (especially since most boards are
derived from Amlogic reference designs, so it's likely that more than
just the Odroid-C2 will benefit from your patches) :)
