From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/3] mfd: lubbock_io: add lubbock_io board
Date: Tue, 20 Jan 2015 10:29:19 +0000
Message-ID: <20150120102919.GP5767@x1>
References: <1421406010-14851-1-git-send-email-robert.jarzmik@free.fr>
 <1421406010-14851-2-git-send-email-robert.jarzmik@free.fr>
 <20150119091705.GG21886@x1>
 <87ppaah9k5.fsf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87ppaah9k5.fsf-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 19 Jan 2015, Robert Jarzmik wrote:
> Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:
> > On Fri, 16 Jan 2015, Robert Jarzmik wrote:

[...]

> >> +	res =3D platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> >
> > platform_get_irq()?
> No. I need the flags.

Where are they used?

[...]

> >> +	if (ret) {
> >> +		dev_err(&pdev->dev, "Couldn't request main irq : ret =3D %d\n",
> >> +			ret);
> >
> > I'm not keen on this type of formatting.  Besides the system will
> > print out the returned error on failure.
> Well, it will print -EINVAL or -ENODEV. When I'll receive an request =
on the
> driver with -ENODEV, how will I know it will come from this request_i=
rq() or
> another part of the code ... Well I can remove it if you want, but I =
think it's
> an error.

I'm not asking you to remove the entire message, just the junk at the
end.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
