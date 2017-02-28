From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] [RFC] iio: dht11: Add optional support for supply
 control via regulator framework
Date: Mon, 27 Feb 2017 18:09:00 -0600
Message-ID: <20170228000900.sn2wnpzbtjup3wz5@rob-hp-laptop>
References: <1487869613-11927-1-git-send-email-harald@ccbib.org>
 <1487869613-11927-2-git-send-email-harald@ccbib.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1487869613-11927-2-git-send-email-harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 23, 2017 at 05:06:53PM +0000, Harald Geyer wrote:
> If a supply is provided via DT, release the supply whenever we don't read
> the sensor. Also use notifications to track the actual status of the
> supply to ensure that we meet the timing requirements stated in the
> datasheet.
> 
> This change is motivated by the hope that these sensors will work more
> reliably if power-cycled regularly.
> 
> Signed-off-by: Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
> ---
> This is an RFC this time, because I want to run extensive long term tests
> with DHT11 and DHT22 before officially proposing this for inclusion. I
> have learned my lessons with this quirky bits of HW... :(
> 
> However since this will take a lot of time (mostly physical, but also
> man hours), I'd like to get review comments now instead of risking a
> second iteration of long term tests.
> 
>  .../devicetree/bindings/iio/humidity/dht11.txt     | 10 ++++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/iio/humidity/dht11.c                       | 57 ++++++++++++++++++++--
>  2 files changed, 64 insertions(+), 3 deletions(-)
