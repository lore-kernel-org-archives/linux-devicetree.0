From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH v1 3/3] iio:imu:mpu6050: enhance mounting matrix
 support
Date: Mon, 11 Apr 2016 14:12:12 -0500
Message-ID: <20160411191212.GA30801@rob-hp-laptop>
References: <cover.1460113510.git.gregor.boirie@parrot.com>
 <594bc2f45d1894c9c3308509062b991e4a5fcc7e.1460113510.git.gregor.boirie@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <594bc2f45d1894c9c3308509062b991e4a5fcc7e.1460113510.git.gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>, Cristina Opriceana <cristina.opriceana-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Adriana Reus <adriana.reus-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lucas De Marchi <lucas.demarchi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 08, 2016 at 04:12:05PM +0200, Gregor Boirie wrote:
> Add a new rotation matrix sysfs attribute compliant with IIO core
> mounting matrix API.
> Matrix is retrieved from "in_anglvel_mount_matrix" and
> "in_accel_mount_matrix" sysfs attributes. It is declared into mpu6050 DTS
> entry as a "mount-matrix" property.

We have a common DT property, but can't have common sysfs interface?

BTW, sysfs interfaces also have to be documented.

> 
> Old interface is kept for backward userspace compatibility and may be
> retrieved from legacy platform_data mechanism only.
> 
> Signed-off-by: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/imu/inv_mpu6050.txt    | 13 +++++
>  drivers/iio/imu/inv_mpu6050/inv_mpu_core.c         | 56 ++++++++++++++++++++--
>  drivers/iio/imu/inv_mpu6050/inv_mpu_iio.h          |  4 +-
>  include/linux/platform_data/invensense_mpu6050.h   |  5 +-
>  4 files changed, 72 insertions(+), 6 deletions(-)
