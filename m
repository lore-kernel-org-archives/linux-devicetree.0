From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 6/6] iio: mma8452: leave sysfs namings to the iio core
Date: Sat, 12 Sep 2015 11:09:45 +0100
Message-ID: <55F3F9E9.1070009@kernel.org>
References: <1441107913-4112-1-git-send-email-martink@posteo.de>
 <1441107913-4112-7-git-send-email-martink@posteo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441107913-4112-7-git-send-email-martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org, roberta.dobrescu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christoph.muellner-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org, Martin Kepplinger <martin.kepplinger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/09/15 12:45, Martin Kepplinger wrote:
> This doesn't actually change anything since the core names the sysfs folder
> for the iio event attributes "events" anyways. It only leaves the job to the
> core.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
> Signed-off-by: Christoph Muellner <christoph.muellner-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
Applied to the togreg branch of iio.git - initially pushed out as testing for the
autobuilders to play with it.

Thanks,

Jonathan
> ---
>  drivers/iio/accel/mma8452.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 15d50c9..1eccc2d 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -772,7 +772,6 @@ static struct attribute *mma8452_event_attributes[] = {
>  
>  static struct attribute_group mma8452_event_attribute_group = {
>  	.attrs = mma8452_event_attributes,
> -	.name = "events",
>  };
>  
>  #define MMA8452_CHANNEL(axis, idx, bits) { \
> 
