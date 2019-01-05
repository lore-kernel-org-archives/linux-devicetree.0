From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: meson-saradc: update
 temperature sensor support
Date: Sat, 5 Jan 2019 16:39:56 +0000
Message-ID: <20190105163956.195752d6@archlinux>
References: <20181227215020.9803-1-martin.blumenstingl@googlemail.com>
        <20181227215020.9803-2-martin.blumenstingl@googlemail.com>
        <20190103230209.GA21801@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190103230209.GA21801@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, balbes-150@yandex.ru, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 3 Jan 2019 17:02:09 -0600
Rob Herring <robh@kernel.org> wrote:

> On Thu, 27 Dec 2018 22:50:19 +0100, Martin Blumenstingl wrote:
> > Meson8b and Meson8m2 use a 5-bit wide TSC (temperature sensor
> > coefficient). The SAR ADC registers however can only store (the lower)
> > 4 bits. The fifth (upper-most) bit is stored inside the
> > MESON_HHI_DPLL_TOP_0[9] register from the HHI register area.
> > This adds a syscon property to the HHI register area so a driver can
> > fetch the HHI register map and store the fifth TSC bit in there.
> > 
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > ---
> >  .../devicetree/bindings/iio/adc/amlogic,meson-saradc.txt      | 4 ++++
> >  1 file changed, 4 insertions(+)
> >   
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Thanks,

Jonathan
