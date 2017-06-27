From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v1 2/6] [media] ov9650: add device tree support
Date: Tue, 27 Jun 2017 08:36:42 +0300
Message-ID: <20170627053642.GW12407@valkosipuli.retiisi.org.uk>
References: <1498143942-12682-1-git-send-email-hugues.fruchet@st.com>
 <1498143942-12682-3-git-send-email-hugues.fruchet@st.com>
 <20170626163102.GQ12407@valkosipuli.retiisi.org.uk>
 <D780984B-70A1-4E9C-A887-DD2CBAAC7CCA@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <D780984B-70A1-4E9C-A887-DD2CBAAC7CCA-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Cc: Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 26, 2017 at 07:46:34PM +0200, H. Nikolaus Schaller wrote:
> Hi,
> 
> > Am 26.06.2017 um 18:31 schrieb Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>:
> > 
> > Hi Hugues,
> > 
> > On Thu, Jun 22, 2017 at 05:05:38PM +0200, Hugues Fruchet wrote:
> >> @@ -1545,15 +1577,22 @@ static int ov965x_remove(struct i2c_client *client)
> >> }
> >> 
> >> static const struct i2c_device_id ov965x_id[] = {
> >> -	{ "OV9650", 0 },
> >> -	{ "OV9652", 0 },
> >> +	{ "OV9650", 0x9650 },
> >> +	{ "OV9652", 0x9652 },
> > 
> > This change does not appear to match with the patch description nor it the
> > information is used. How about not changing it, unless there's a reason to?
> > The same for the data field of the of_device_id array below.
> 
> I think it could/should be used to check if the camera chip that is found
> by reading the product-id and version registers does match what the device
> tree expects and abort probing on a mismatch.

Makes sense. But it should be a separate patch, shouldn't it?

You could also put the id to the ops struct, and choose the ops struct that
way. Entirely up to you.

-- 
Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
