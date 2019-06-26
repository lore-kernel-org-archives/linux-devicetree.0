From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH V4 4/5] dt-bindings: iio: adc: Convert ad7124
 documentation to YAML
Date: Wed, 26 Jun 2019 08:44:36 -0600
Message-ID: <CAL_JsqLHpT1z3O5QctG6WWB6bcOms5XYTOOrq6tK6uOZPNQtDQ@mail.gmail.com>
References: <20190625081128.22190-1-mircea.caprioru@analog.com> <20190625081128.22190-4-mircea.caprioru@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190625081128.22190-4-mircea.caprioru@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mircea Caprioru <mircea.caprioru@analog.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, Stefan Popa <stefan.popa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 25, 2019 at 2:12 AM Mircea Caprioru
<mircea.caprioru@analog.com> wrote:
>
> Convert AD7124 bindings documentation to YAML format.
>
> Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
> ---
>
> Changelog v2:
> - modified SPDX license to GPL-2.0 OR BSD-2-Clause
> - added regex for a range from 0 to 15
> - added minimum and maximum constraints for reg property
> - set type and range of values for adi,reference-select property
> - used items for diff-channels property
> - set bipolar, adi,buffered-positive and negative to type: boolean
>
> Changelog v3:
> - moved adi,buffered-positive and negative properties to own commit
>
> Changelog v4:
> - removed old txt dt-binding
>
>  .../bindings/iio/adc/adi,ad7124.txt           |  75 ---------
>  .../bindings/iio/adc/adi,ad7124.yaml          | 144 ++++++++++++++++++
>  2 files changed, 144 insertions(+), 75 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7124.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
