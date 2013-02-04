From: Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] iio: Update iio_channel_get API to use consumer
 device pointer as argument
Date: Mon, 4 Feb 2013 13:38:48 -0800
Message-ID: <20130204213848.GA2358@lizard.fhda.edu>
References: <1360009566-26347-1-git-send-email-linux@roeck-us.net>
 <1360009566-26347-2-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1360009566-26347-2-git-send-email-linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 04, 2013 at 12:26:05PM -0800, Guenter Roeck wrote:
> For iio_channel_get to work with OF based configurations, it needs the
> consumer device pointer instead of the consumer device name as argument.
> 
> Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> ---
>  drivers/extcon/extcon-adc-jack.c    |    3 +--
>  drivers/iio/inkern.c                |   11 ++++++++++-
>  drivers/power/generic-adc-battery.c |    4 ++--
>  drivers/power/lp8788-charger.c      |    8 ++++----
>  include/linux/iio/consumer.h        |    5 +++--
>  5 files changed, 20 insertions(+), 11 deletions(-)

Looks OK to me, Ack for drivers/power part.

Thanks.
Anton
