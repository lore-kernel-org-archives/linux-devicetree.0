From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND v4 2/6] remoteproc: debugfs: Add ability to boot remote
 processor using debugfs
Date: Thu, 3 Dec 2015 12:26:34 +0000
Message-ID: <20151203122634.GX12874@x1>
References: <1448370862-19120-1-git-send-email-lee.jones@linaro.org>
 <1448370862-19120-3-git-send-email-lee.jones@linaro.org>
 <CAJAp7Og2MPapOQmCSB9o4qwQHsA8_iyAWPhjHYPw6J=xCK2xew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAJAp7Og2MPapOQmCSB9o4qwQHsA8_iyAWPhjHYPw6J=xCK2xew-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, ludovic.barre-qxv4g6HH51o@public.gmane.org, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 27 Nov 2015, Bjorn Andersson wrote:

> On Tue, Nov 24, 2015 at 5:14 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wro=
te:
> > This functionality is especially useful during the testing phase.  =
When
> > used in conjunction with Mailbox's Test Framework we can trivially =
conduct
> > end-to-end testing i.e. boot co-processor, send and receive message=
s to
> > the co-processor, then shut it down again (repeat as required).
> >
>=20
> I want this too!
>=20
> > Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
> > Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  drivers/remoteproc/remoteproc_debugfs.c | 34 +++++++++++++++++++++=
++++++++++++
> >  1 file changed, 34 insertions(+)
> >
> > diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remo=
teproc/remoteproc_debugfs.c
> > index 9d30809..8113c18 100644
> > --- a/drivers/remoteproc/remoteproc_debugfs.c
> > +++ b/drivers/remoteproc/remoteproc_debugfs.c
> > @@ -88,8 +88,42 @@ static ssize_t rproc_state_read(struct file *fil=
p, char __user *userbuf,
> >         return simple_read_from_buffer(userbuf, count, ppos, buf, i=
);
> >  }
> >
> > +static ssize_t rproc_state_write(struct file *filp, const char __u=
ser *userbuf,
> > +                                size_t count, loff_t *ppos)
> > +{
> > +       struct rproc *rproc =3D filp->private_data;
> > +       char buf[10];
> > +       int ret;
> > +
> > +       if (count > sizeof(buf))
> > +               return count;
> > +
> > +       ret =3D copy_from_user(buf, userbuf, count);
> > +       if (ret)
> > +               return -EFAULT;
> > +
> > +       if (buf[count - 1] =3D=3D '\n')
> > +               buf[count - 1] =3D '\0';
>=20
> I believe you can get here with count =3D 0.

I'm pretty sure you can't.

If you are sure that you can, if you can provide me with a way of
testing, I'd be happy to put in provisions.

> > +
> > +       if (!strncmp(buf, "start", count)) {
> > +               ret =3D rproc_boot(rproc);
> > +               if (ret) {
> > +                       dev_err(&rproc->dev, "Boot failed: %d\n", r=
et);
> > +                       return ret;
> > +               }
> > +       } else if (!strncmp(buf, "stop", count)) {
> > +               rproc_shutdown(rproc);
> > +       } else {
> > +               dev_err(&rproc->dev, "Unrecognised option: %s\n", b=
uf);
>=20
> Unrecognized

What I have is correct.

> > +               return -EINVAL;
> > +       }
> > +
> > +       return count;
> > +}
> > +
> >  static const struct file_operations rproc_state_ops =3D {
> >         .read =3D rproc_state_read,
> > +       .write =3D rproc_state_write,
> >         .open =3D simple_open,
> >         .llseek =3D generic_file_llseek,
> >  };
>=20
> Part of these nits
>=20
> Acked-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Thanks.

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
