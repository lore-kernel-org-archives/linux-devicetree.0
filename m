From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 4/4] iio: frequency: adf4371: Add support for output stage mute
Date: Wed, 26 Jun 2019 13:59:49 -0600
Message-ID: <CAL_JsqL-Pxef5oNAx5-crGxL9Q0Ph5gx2Z=KejLSq_jdgVUvbQ@mail.gmail.com>
References: <1561389236-26464-1-git-send-email-stefan.popa@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561389236-26464-1-git-send-email-stefan.popa@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Popa <stefan.popa@analog.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Michael Hennerich <Michael.Hennerich@analog.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 24, 2019 at 9:14 AM Stefan Popa <stefan.popa@analog.com> wrote:
>
> Another feature of the ADF4371/ADF4372 is that the supply current to the
> RF8P and RF8N output stage can shut down until the ADF4371 achieves lock
> as measured by the digital lock detect circuitry. The mute to lock
> detect bit (MUTE_LD) in REG25 enables this function.
>
> Signed-off-by: Stefan Popa <stefan.popa@analog.com>
> ---
>  .../devicetree/bindings/iio/frequency/adf4371.yaml          |  6 ++++++

If you resend and in the future, please split bindings to separate patch.

>  drivers/iio/frequency/adf4371.c                             | 13 +++++++++++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml b/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
> index a268a9d..6db8742 100644
> --- a/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
> +++ b/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
> @@ -32,6 +32,12 @@ properties:
>      items:
>        - clkin
>
> +  adi,mute-till-lock-en:
> +    description:
> +      If this property is present, then the supply current to RF8P and RF8N
> +      output stage will shut down until the ADF4371/ADF4372 achieves lock as
> +      measured by the digital lock detect circuitry.

You need to define the type:

type: boolean

Maybe Jonathan will fix up.

Rob
