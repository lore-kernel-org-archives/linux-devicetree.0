From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] iio: accel: Add support for Domintech DMARD06
 accelerometer
Date: Wed, 27 Jul 2016 09:57:40 -0500
Message-ID: <20160727145740.GA23467@rob-hp-laptop>
References: <1469460078-6460-1-git-send-email-mamlinav@gmail.com>
 <1469460078-6460-3-git-send-email-mamlinav@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1469460078-6460-3-git-send-email-mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 25, 2016 at 06:21:18PM +0300, Aleksei Mamlin wrote:
> This patch add support for Domintech DMARD05, DMARD06 and DMARD07
> accelerometers.
> 
> Signed-off-by: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/accel/dmard06.txt      |  19 ++

This could go into trivial-devices.txt, but this is fine too:

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/iio/accel/Kconfig                          |  11 +
>  drivers/iio/accel/Makefile                         |   1 +
>  drivers/iio/accel/dmard06.c                        | 241 +++++++++++++++++++++
>  4 files changed, 272 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/accel/dmard06.txt
>  create mode 100644 drivers/iio/accel/dmard06.c
