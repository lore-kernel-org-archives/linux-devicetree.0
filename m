From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH] ARM64: dts: meson-gxbb-odroidc2: Fix usb phy regulator warning
Date: Fri, 11 Jan 2019 21:46:56 +0530
Message-ID: <CANAwSgTX4Rs7xXzjpNi-zizRyyO0FiFF0baOuQZ0fx9WEM9NCA@mail.gmail.com>
References: <20190111092235.28161-1-linux.amoon@gmail.com> <772bd70c-2cd9-a1be-d18f-7824a9ea0556@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <772bd70c-2cd9-a1be-d18f-7824a9ea0556@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Hi Neil,

On Fri, 11 Jan 2019 at 19:10, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi Anand,
>
> On 11/01/2019 10:22, Anand Moon wrote:
> > Add missing vin-supply 5V regulator node on usb_phy nodes needed
> > to power usb bus ports. Override the dr_mode from "host" to "peripheral"
> > for initialization of dwc2 usb0 phy node,changes fix the below
> > warning for usb initialization.
>
> I would have switch the dr_mode to peripheral in another patch,
> fix the regulator issue in this patch only.
>
> Neil
>
[snip]

Ok will split this into two patches and send after next dts updates.

Best Regards
-Anand
