Return-Path: <SRS0=UHH3=WD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from ns.pmeerw.net ([84.19.176.117]:39184 "EHLO ns.pmeerw.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388448AbfHGQro (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 7 Aug 2019 12:47:44 -0400
Date: Wed, 7 Aug 2019 18:41:50 +0200 (CEST)
From: Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Subject: Re: [PATCH v2 4/4] dt-bindings: iio: adc: Add AD7606B ADC
 documentation
In-Reply-To: <20190807133137.11185-4-beniamin.bia@analog.com>
Message-ID: <alpine.DEB.2.21.1908071830110.32509@vps.pmeerw.net>
References: <20190807133137.11185-1-beniamin.bia@analog.com> <20190807133137.11185-4-beniamin.bia@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: devicetree-owner@vger.kernel.org
To: Beniamin Bia <beniamin.bia@analog.com>
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, biabeniamin@outlook.com
List-ID: <devicetree@vger.kernel.org>

On Wed, 7 Aug 2019, Beniamin Bia wrote:

minor comment below

> Documentation for AD7606B Analog to Digital Converter and software
> mode was added.
> 
> Signed-off-by: Beniamin Bia <beniamin.bia@analog.com>
> ---
> Changes in v2:
> -nothing changed
> 
>  Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
> index 509dbe9c84d2..2afe31747a70 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
> @@ -13,6 +13,7 @@ maintainers:
>  description: |
>    Analog Devices AD7606 Simultaneous Sampling ADC
>    https://www.analog.com/media/en/technical-documentation/data-sheets/ad7606_7606-6_7606-4.pdf
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/AD7606B.pdf
>    https://www.analog.com/media/en/technical-documentation/data-sheets/AD7616.pdf
>  
>  properties:
> @@ -22,6 +23,7 @@ properties:
>        - adi,ad7606-8
>        - adi,ad7606-6
>        - adi,ad7606-4
> +      - adi,ad7606b
>        - adi,ad7616
>  
>    reg:
> @@ -87,7 +89,7 @@ properties:
>  
>    adi,sw-mode:
>      description:
> -      Software mode of operation, so far available only for ad7616.
> +      Software mode of operation, so far available only for ad7616 and ad7606B.

how about ad7606b to match the properties above?

>        It is enabled when all three oversampling mode pins are connected to
>        high level. The device is configured by the corresponding registers. If the
>        adi,oversampling-ratio-gpios property is defined, then the driver will set the
> 

-- 

Peter Meerwald-Stadler
Mobile: +43 664 24 44 418
