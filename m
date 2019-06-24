From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH V3 4/5] dt-bindings: iio: adc: Convert ad7124
 documentation to YAML
Date: Mon, 24 Jun 2019 07:50:02 -0600
Message-ID: <CAL_JsqJY_bO7EQa=Sfqs8Prwj483Q8Xs0+eX+HZyGsyr-4p-oQ@mail.gmail.com>
References: <20190624080845.18537-1-mircea.caprioru@analog.com> <20190624080845.18537-4-mircea.caprioru@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190624080845.18537-4-mircea.caprioru@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mircea Caprioru <mircea.caprioru@analog.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, Stefan Popa <stefan.popa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 24, 2019 at 2:09 AM Mircea Caprioru
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
>  .../bindings/iio/adc/adi,ad7124.yaml          | 144 ++++++++++++++++++
>  1 file changed, 144 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml

The subject says 'Convert', but where's the removal of the old binding?

Rob
