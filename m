From: Frank Lee <tiny.windzz@gmail.com>
Subject: Re: [PATCH v5 00/18] add thermal driver for h6
Date: Tue, 13 Aug 2019 07:36:00 +0800
Message-ID: <CAEExFWu+CNqjDF218kaVu2xHq1yYL8XgxrM1o=S9axNNebb8XA@mail.gmail.com>
References: <20190810052829.6032-1-tiny.windzz@gmail.com> <f479c162-4eac-f320-3583-b9ddbef79b1a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f479c162-4eac-f320-3583-b9ddbef79b1a@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: rui.zhang@intel.com, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, David Miller <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan.Cameron@huawei.com, Nicolas Ferre <nicolas.ferre@microchip.com>, Linux PM <linux-pm@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 5:14 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.c=
om> wrote:
>
> Hi Yangtao,
>
> On 10/08/2019 07:28, Yangtao Li wrote:
> > This patchset add support for A64, H3, H5, H6 and R40 thermal sensor.
>
> Could you add the device-tree configuration in the same series?
> This will allow user to test it.

Ok, it will be added later.

Yangtao

>
> Thanks,
> Cl=C3=A9ment
>
> >
> > Thx to Icenowy and Vasily.
> >
> > BTY, do a cleanup in thermal makfile.
> >
> > Icenowy Zheng (3):
> >    thermal: sun8i: allow to use custom temperature calculation function
> >    thermal: sun8i: add support for Allwinner H5 thermal sensor
> >    thermal: sun8i: add support for Allwinner R40 thermal sensor
> >
> > Vasily Khoruzhick (1):
> >    thermal: sun8i: add thermal driver for A64
> >
> > Yangtao Li (14):
> >    thermal: sun8i: add thermal driver for h6
> >    dt-bindings: thermal: add binding document for h6 thermal controller
> >    thermal: fix indentation in makefile
> >    thermal: sun8i: get ths sensor number from device compatible
> >    thermal: sun8i: rework for sun8i_ths_get_temp()
> >    thermal: sun8i: get ths init func from device compatible
> >    thermal: sun8i: rework for ths irq handler func
> >    thermal: sun8i: support mod clocks
> >    thermal: sun8i: rework for ths calibrate func
> >    dt-bindings: thermal: add binding document for h3 thermal controller
> >    thermal: sun8i: add thermal driver for h3
> >    dt-bindings: thermal: add binding document for a64 thermal controlle=
r
> >    dt-bindings: thermal: add binding document for h5 thermal controller
> >    dt-bindings: thermal: add binding document for r40 thermal controlle=
r
> >
> >   .../bindings/thermal/sun8i-thermal.yaml       | 157 +++++
> >   MAINTAINERS                                   |   7 +
> >   drivers/thermal/Kconfig                       |  14 +
> >   drivers/thermal/Makefile                      |   9 +-
> >   drivers/thermal/sun8i_thermal.c               | 596 +++++++++++++++++=
+
> >   5 files changed, 779 insertions(+), 4 deletions(-)
> >   create mode 100644 Documentation/devicetree/bindings/thermal/sun8i-th=
ermal.yaml
> >   create mode 100644 drivers/thermal/sun8i_thermal.c
> > ---
> > v5:
> > -add more support
> > -some trival fix
> > ---
> > 2.17.1
> >
> >
