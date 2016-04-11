From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH v1 2/3] iio:ak8975: add mounting matrix support
Date: Mon, 11 Apr 2016 14:07:36 -0500
Message-ID: <20160411190736.GA11591@rob-hp-laptop>
References: <cover.1460113510.git.gregor.boirie@parrot.com>
 <443cbafb38dc5ce38cbb7753aa6a4230d7188df9.1460113510.git.gregor.boirie@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <443cbafb38dc5ce38cbb7753aa6a4230d7188df9.1460113510.git.gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>, Cristina Opriceana <cristina.opriceana-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Adriana Reus <adriana.reus-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lucas De Marchi <lucas.demarchi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 08, 2016 at 04:12:04PM +0200, Gregor Boirie wrote:
> Expose a rotation matrix to indicate userspace the chip orientation with
> respect to the overall hardware system.
> 
> Signed-off-by: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/iio/magnetometer/ak8975.txt           | 10 ++++++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/iio/magnetometer/ak8975.c                  | 40 ++++++++++++++++++++--
>  include/linux/iio/magnetometer/ak8975.h            | 16 +++++++++
>  3 files changed, 64 insertions(+), 2 deletions(-)
>  create mode 100644 include/linux/iio/magnetometer/ak8975.h
