From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio:light: Add support for STMicro VL6180 sensor
Date: Fri, 3 Mar 2017 01:05:41 -0600
Message-ID: <20170303070541.aevjulduzucui3wm@rob-hp-laptop>
References: <20170302184031.GA27741@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170302184031.GA27741-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manivannan Sadhasivam <manivannanece23-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 03, 2017 at 12:10:31AM +0530, Manivannan Sadhasivam wrote:
> This patch adds support for STMicro VL6180 - ALS and proximity sensor. Sensor is capable of measuring the light
> intensity as well as object distance using TOF(Time of Flight) technology.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannanece23-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/light/vl6180.txt       |  16 +

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/iio/light/Kconfig                          |  10 +
>  drivers/iio/light/Makefile                         |   1 +
>  drivers/iio/light/vl6180.c                         | 544 +++++++++++++++++++++
>  4 files changed, 571 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/light/vl6180.txt
>  create mode 100644 drivers/iio/light/vl6180.c
