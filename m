From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: iio: adc: Add docs for AD7606 ADC
Date: Mon, 10 Dec 2018 16:23:12 -0600
Message-ID: <20181210222312.GA30114@bogus>
References: <1544439865-22967-1-git-send-email-stefan.popa@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544439865-22967-1-git-send-email-stefan.popa@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: jic23@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, Michael.Hennerich@analog.com, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stefan.popa@analog.com
List-Id: devicetree@vger.kernel.org

On Mon, 10 Dec 2018 13:04:25 +0200, Stefan Popa wrote:
> Document support for AD7606 Analog to Digital Converter.
> 
> Signed-off-by: Stefan Popa <stefan.popa@analog.com>
> ---
> Changes in v2:
> 	- fixed indentation issues.
> 	- used gpios instead of gpio.
> 	- added vendor prefix for conversion-start-gpios, first-data-gpios,
> 	and range-gpios.
> Changes in v3:
> 	- Added adi,oversampling-ratio-gpios.
> Changes in v4:
> 	- Specified if the gpios are active high or low and set the flag
> 	appropriately.
> 
>  .../devicetree/bindings/iio/adc/adi,ad7606.txt     | 65 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7606.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
