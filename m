From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 5/6] staging:iio:ad2s90: Add SPDX license identifier
Date: Fri, 9 Nov 2018 20:13:05 -0200
Message-ID: <CAOMZO5DVr7TBoNtB7Bwjv1rpaCdOyg8+iU=iCwBRjSD4iWeBUw@mail.gmail.com>
References: <20181109220044.24843-1-matheus.bernardino@usp.br> <20181109220044.24843-6-matheus.bernardino@usp.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181109220044.24843-6-matheus.bernardino@usp.br>
Sender: linux-kernel-owner@vger.kernel.org
To: matheus.bernardino@usp.br
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Peter Meerwald <pmeerw@pmeerw.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-iio@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, kernel-usp@googlegroups.com, alexandru.ardelean@analog.com, victorcolombo@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Matheus,

On Fri, Nov 9, 2018 at 8:01 PM Matheus Tavares
<matheus.bernardino@usp.br> wrote:
>
> This patch adds the SPDX GPL-2.0-only license identifier to ad2s90.c,
> which solves the checkpatch.pl warning:
> "WARNING: Missing or malformed SPDX-License-Identifier tag in line 1".
>
> Signed-off-by: Matheus Tavares <matheus.bernardino@usp.br>
> ---
>  drivers/staging/iio/resolver/ad2s90.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/staging/iio/resolver/ad2s90.c b/drivers/staging/iio/resolver/ad2s90.c
> index 949ff55ac6b0..f439da721df8 100644
> --- a/drivers/staging/iio/resolver/ad2s90.c
> +++ b/drivers/staging/iio/resolver/ad2s90.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0-only

This should be:
// SPDX-License-Identifier: GPL-2.0
