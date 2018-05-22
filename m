Return-Path: <robherring2@gmail.com>
Date: Tue, 22 May 2018 12:19:03 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] iio: dac: Add support for external reference voltage
 through the regulator framework.
Message-ID: <20180522171903.GA24256@rob-hp-laptop>
References: <1526775557.32235.33.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1526775557.32235.33.camel@gmail.com>
To: Silvan Murer <silvan.murer@gmail.com>
Cc: lars@metafoo.de, jic23@kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sun, May 20, 2018 at 02:19:17AM +0200, Silvan Murer wrote:
> Add support for external reference voltage through the regulator framework.
> 
> Signed-off-by: Silvan Murer <silvan.murer@gmail.com>
> Reviewed-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
> Changes in v3:
> 	- remove extra spaces and tab
> Changes in v2:
> 	- Add 'optional properties' documentation
> 	- Return an error when a regulator is specified
> 	- Use internal reference when no regulator is specified
> 	- Use iio_device_register instead of devm_iio_device_register
> 
> �.../devicetree/bindings/iio/dac/ltc2632.txt��������| 14 +++++

Reviewed-by: Rob Herring <robh@kernel.org>

In the future, please split bindings to separate patch.

> �drivers/iio/dac/ltc2632.c��������������������������| 70 +++++++++++++++++++---
> �2 files changed, 75 insertions(+), 9 deletions(-)
