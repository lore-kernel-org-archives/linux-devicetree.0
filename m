From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH V3 4/4] dt-bindings: iio: adc: ad7192: Add binding
 documentation for AD7192
Date: Wed, 14 Aug 2019 20:39:04 -0600
Message-ID: <CAL_JsqKONxFbS-nUMc1c=-9HcXCrOVmOOfn9htKOJOjAS6HCKg@mail.gmail.com>
References: <20190814073150.4602-1-mircea.caprioru@analog.com> <20190814073150.4602-4-mircea.caprioru@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814073150.4602-4-mircea.caprioru@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mircea Caprioru <mircea.caprioru@analog.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, Stefan Popa <stefan.popa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 14, 2019 at 1:32 AM Mircea Caprioru
<mircea.caprioru@analog.com> wrote:
>
> This patch add device tree binding documentation for AD7192 adc in YAML
> format.
>
> Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
> ---
> Changelog V2:
> - remove description from spi and interrupt properties
> - changed the name of the device from ad7192 to adc in the example
>
> Changelog V3:
> - added semicolon at the end of the dt example
>
>  .../bindings/iio/adc/adi,ad7192.yaml          | 121 ++++++++++++++++++
>  1 file changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
