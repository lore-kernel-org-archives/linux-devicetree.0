From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC v2 PATCH 02/14] iio: st_accel: Add dt bindings
Date: Mon, 21 Oct 2013 12:37:11 +0100
Message-ID: <20131021113710.GE8144@kartoffel>
References: <1380299538-22047-1-git-send-email-l.czerwinski@samsung.com>
 <1380299538-22047-3-git-send-email-l.czerwinski@samsung.com>
 <524AED0A.6030707@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <524AED0A.6030707-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lukasz Czerwinski <l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org" <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, "denis.ciocca-qxv4g6HH51o@public.gmane.org" <denis.ciocca-qxv4g6HH51o@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 01, 2013 at 04:40:58PM +0100, Jonathan Cameron wrote:
> On 09/27/13 17:32, Lukasz Czerwinski wrote:
> > Add OF support for the st_accel.
> > 
> > Signed-off-by: Lukasz Czerwinski <l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> 
> The dev name changes result in an ABI change.  This was
> being discussed deep in a thread related to Lee's patches
> but I don't think has yet been resolved.
> 
> The issue is that they are exposed to userspace via sysfs
> by both the i2c subsystem and IIO.
> 
> My gut feeling is we are stuck with the underscores but no one has
> definitively come down and said we are find to leave them be
> and break with DT conventions.

I would very much prefer to not have Linux infrastructure problems affect the
device tree.

> 
> We can't even play games with having different naming in the device
> tree and exposed to usespace because there are already DT files
> using the implicit i2c bindings.

We could fix this up my adding explicit (but marked legacy-only/deprecated)
of_device_id table entries for the implicit compatible strings already in use.

Once that's done we can try to clean up the implict match logic. We could at
least prevent implicit matches for drivers with of_match_id tables.

Thanks,
Mark.
