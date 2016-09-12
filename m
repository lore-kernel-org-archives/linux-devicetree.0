From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] iio: sx9500: add final devicetree support
Date: Mon, 12 Sep 2016 10:44:52 -0500
Message-ID: <20160912154452.GA29955@rob-hp-laptop>
References: <1472827740.1929.26.camel@googlemail.com>
 <CAOMZO5BeL1EKOQvZQoXXObttHSKxL7UQ1s2r8H4EOuROOb_YnQ@mail.gmail.com>
 <1472828671.1929.32.camel@googlemail.com>
 <CAOMZO5BVDS=AaSyRS0ELBiEKx3RxdstXgA_xJ6ANUzKDxdyBxg@mail.gmail.com>
 <1472829819.12668.3.camel@googlemail.com>
 <CAOMZO5DbJLnH1wm2KuML+O36O-eSYWeGwrxE5pdKSRtB-Js-yA@mail.gmail.com>
 <1472834833.12668.11.camel@googlemail.com>
 <CAOMZO5B8ttBvf-zimO5R_kgpzR2bxF73Ur0vZpBKUX8Ytbs8uQ@mail.gmail.com>
 <1472898600.1918.4.camel@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472898600.1918.4.camel-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Fritz <chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vlad Dogaru <ddvlad-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Sep 03, 2016 at 12:30:00PM +0200, Christoph Fritz wrote:
> This makes sx9500 driver usable on devicetree based platforms too.
> 
> Signed-off-by: Christoph Fritz <chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> ---
> 
> Changes in v2:
> 
>  - fix docu: add optional property reset-gpios
>  - adapt docu: change example "reset-gpios"
> 
>  .../devicetree/bindings/iio/proximity/sx9500.txt   | 24 ++++++++++++++++++++++
>  drivers/iio/proximity/sx9500.c                     |  7 +++++++
>  2 files changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/proximity/sx9500.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
