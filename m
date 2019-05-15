From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: iio: frequency: Add docs for ADF4371 PLL
Date: Wed, 15 May 2019 08:51:40 -0500
Message-ID: <CAL_JsqKvHBoKiMUaA8=rLtM_kCMas8sQgp+k6DTKgUfpVX3+iQ@mail.gmail.com>
References: <1557918043-25733-1-git-send-email-stefan.popa@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557918043-25733-1-git-send-email-stefan.popa@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Popa <stefan.popa@analog.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Michael Hennerich <Michael.Hennerich@analog.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 15, 2019 at 6:00 AM Stefan Popa <stefan.popa@analog.com> wrote:
>
> Document support for Analog Devices ADF4371 SPI Wideband Synthesizer.
>
> Signed-off-by: Stefan Popa <stefan.popa@analog.com>
> ---
>  .../devicetree/bindings/iio/frequency/adf4371.yaml | 54 ++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/frequency/adf4371.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
