From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/6] dt-bindings: iio: accel: Add docs for ADXL372
Date: Thu, 9 Aug 2018 15:34:35 -0600
Message-ID: <20180809213435.GA20267@rob-hp-laptop>
References: <1533653540-24796-1-git-send-email-stefan.popa@analog.com>
 <1533653540-24796-3-git-send-email-stefan.popa@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1533653540-24796-3-git-send-email-stefan.popa@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Popa <stefan.popa@analog.com>
Cc: jic23@kernel.org, broonie@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, knaack.h@gmx.de, pmeerw@pmeerw.net, mark.rutland@arm.com, davem@davemloft.net, mchehab+samsung@kernel.org, gregkh@linuxfoundation.org, akpm@linux-foundation.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 07, 2018 at 05:52:16PM +0300, Stefan Popa wrote:
> Add the device tree binding documentation for the ADXL372 3-axis digital
> accelerometer.
> 
> Signed-off-by: Stefan Popa <stefan.popa@analog.com>
> ---
>  .../devicetree/bindings/iio/accel/adxl372.txt      | 22 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/accel/adxl372.txt

Please add acks/reviewed-by's when posting new versions.
