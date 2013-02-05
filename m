From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v3 2/2] iio: Add OF support
Date: Tue, 5 Feb 2013 07:22:19 -0800
Message-ID: <20130205152219.GA15057@roeck-us.net>
References: <1360009566-26347-1-git-send-email-linux@roeck-us.net>
 <1360009566-26347-3-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1360009566-26347-3-git-send-email-linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Anton Vorontsov <cbou-JGs/UdohzUI@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 04, 2013 at 12:26:06PM -0800, Guenter Roeck wrote:
> Provide bindings and parse OF data during initialization.
> 
> Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> ---
> One open question is how to assign of_node to the iio device. We can either do it
> in each driver (which turns out to be a huge patchset), or add something like the
> following to iio_device_register.
> 
> 	if (!indio_dev->dev.of_node && indio_dev->dev.parent)
> 		indio_dev->dev.of_node = indio_dev->dev.parent->of_node;
> 
[ ... ]
> +
> +#else /* CONFIG_OF */
> +
> +static inline struct iio_channel *
> +of_iio_channel_get_by_name(struct device *dev, const char *name)
> +{
> +	return ERR_PTR(-ENOENT);
> +}
> +

The above should be

static inline struct iio_channel *
of_iio_channel_get_by_name(struct device_node *np, const char *name)
{
	return NULL;
}

Will be fixed in the next version.

Guenter
