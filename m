From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: add adi,ad7780.yaml binding
Date: Fri, 14 Jun 2019 13:43:02 -0600
Message-ID: <20190614194302.GA18613@bogus>
References: <cover.1558746978.git.renatogeh@gmail.com>
 <2426649b2d8224ae72e7706bcb8c4f2c44c581d2.1558746978.git.renatogeh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2426649b2d8224ae72e7706bcb8c4f2c44c581d2.1558746978.git.renatogeh@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Renato Lui Geh <renatogeh@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, stefan.popa@analog.com, alexandru.Ardelean@analog.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-usp@googlegroups.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 24 May 2019 22:26:30 -0300, Renato Lui Geh wrote:
> This patch adds a YAML binding for the Analog Devices AD7780/1 and
> AD7170/1 analog-to-digital converters.
> 
> Signed-off-by: Renato Lui Geh <renatogeh@gmail.com>
> ---
> Changes in v2:
>  - vref-supply to avdd-supply
>  - remove avdd-supply from required list
>  - include adc block in an spi block
> 
>  .../bindings/iio/adc/adi,ad7780.txt           | 48 ----------
>  .../bindings/iio/adc/adi,ad7780.yaml          | 87 +++++++++++++++++++
>  2 files changed, 87 insertions(+), 48 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7780.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7780.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
