From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4 4/4] dt-bindings: iio: adc: ad7192: Add binding
 documentation for AD7192
Date: Tue, 3 Sep 2019 18:29:37 +0100
Message-ID: <20190903172937.GA15494@bogus>
References: <20190902130831.23057-1-mircea.caprioru@analog.com>
 <20190902130831.23057-4-mircea.caprioru@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190902130831.23057-4-mircea.caprioru@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: jic23@kernel.org, Michael.Hennerich@analog.com, stefan.popa@analog.com, lars@metafoo.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, Mircea Caprioru <mircea.caprioru@analog.com>
List-Id: devicetree@vger.kernel.org

On Mon, 2 Sep 2019 16:08:31 +0300, Mircea Caprioru wrote:
> This patch add device tree binding documentation for AD7192 adc in YAML
> format.
> 
> Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
> ---
> Changelog V2:
> - no changes here
> 
> Changelog V3:
> - no changes here
> 
> Changelog V4:
> - remove the const value from avdd and dvdd supply
> 
>  .../bindings/iio/adc/adi,ad7192.yaml          | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
