From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: iio: adc: Add docs for AD7768-1
Date: Wed, 16 Jan 2019 15:40:55 -0600
Message-ID: <20190116214055.GA3346@bogus>
References: <1547555643-2248-1-git-send-email-stefan.popa@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1547555643-2248-1-git-send-email-stefan.popa@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: jic23@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, Michael.Hennerich@analog.com, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stefan.popa@analog.com
List-Id: devicetree@vger.kernel.org

On Tue, 15 Jan 2019 14:34:03 +0200, Stefan Popa wrote:
> Document support for AD7768-1 Analog to Digital Converter.
> 
> Signed-off-by: Stefan Popa <stefan.popa@analog.com>
> ---
> Changes in v2:
> 	- Added information regarding the simultaneous sampling of the SYNC-IN pin
> 	- Added the reset-gpios in the binding.
> 
>  .../devicetree/bindings/iio/adc/adi,ad7768-1.txt   | 41 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
