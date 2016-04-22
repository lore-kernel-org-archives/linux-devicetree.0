From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 2/3] iio:ak8975: add mounting matrix support
Date: Fri, 22 Apr 2016 14:57:02 -0500
Message-ID: <20160422195702.GA23956@rob-hp-laptop>
References: <cover.1461170293.git.gregor.boirie@parrot.com>
 <43de59ea1cc5ba93bebd721b761da4749956afa0.1461170293.git.gregor.boirie@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <43de59ea1cc5ba93bebd721b761da4749956afa0.1461170293.git.gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>, Cristina Opriceana <cristina.opriceana-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas De Marchi <lucas.demarchi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Leonard Crestez <leonard.crestez-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 20, 2016 at 07:23:44PM +0200, Gregor Boirie wrote:
> Expose a rotation matrix to indicate userspace the chip orientation with
> respect to the overall hardware system.
> Matrix is retrieved from "in_mount_matrix". It is declared into ak8975 DTS
> entry as a "mount-matrix" property.
> 
> Signed-off-by: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/iio/magnetometer/ak8975.txt           | 10 +++++++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/iio/magnetometer/ak8975.c                  | 34 +++++++++++++++++++---
>  include/linux/iio/magnetometer/ak8975.h            | 16 ++++++++++
>  3 files changed, 56 insertions(+), 4 deletions(-)
>  create mode 100644 include/linux/iio/magnetometer/ak8975.h
