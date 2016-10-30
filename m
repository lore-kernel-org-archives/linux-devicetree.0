From: Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
Subject: Re: [PATCH 07/10] staging: iio: tsl2583: convert
 illuminance0_calibscale sysfs attr to use iio_chan_spec
Date: Sun, 30 Oct 2016 16:04:09 -0400
Message-ID: <20161030200409.GA14808@basecamp.onstation.org>
References: <1477648821-3786-1-git-send-email-masneyb@onstation.org>
 <1477648821-3786-8-git-send-email-masneyb@onstation.org>
 <a0fc532f-f034-d817-00f6-a28ec60daf6a@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a0fc532f-f034-d817-00f6-a28ec60daf6a-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Mark.Rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Oct 30, 2016 at 06:37:40PM +0000, Jonathan Cameron wrote:
> On 28/10/16 11:00, Brian Masney wrote:
> > The illuminance0_calibscale sysfs attribute is not currently created by
> > the IIO core. This patch adds the appropriate mask to iio_chan_spec,
> > along with the appropriate data handling in the read_raw() and
> > write_raw() functions, so that the sysfs attribute is created by the IIO
> > core. With this change, this sysfs entry will have its prefix changed
> > from illuminance0_ to in_illuminance_.
> > 
> > Signed-off-by: Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
> Hmm. Could probably have computed the mean on the fly but fine as is.

Hi Jonathan,
   Thanks for your feedback. I'll have another patch set ready for you
by next weekend with my next round of cleanups to that driver. I'll
change this so that it calculates the mean on the fly unless I hear
otherwise from you.

Brian

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
