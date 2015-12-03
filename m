From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND v4 2/6] remoteproc: debugfs: Add ability to boot remote
 processor using debugfs
Date: Thu, 3 Dec 2015 17:28:30 +0000
Message-ID: <20151203172830.GB26902@x1>
References: <1448370862-19120-1-git-send-email-lee.jones@linaro.org>
 <5329827.I5W30K072M@wuerfel>
 <20151203130341.GA26902@x1>
 <2600153.9u9Z7N2IT1@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2600153.9u9Z7N2IT1@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ludovic.barre-qxv4g6HH51o@public.gmane.org, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 03 Dec 2015, Arnd Bergmann wrote:

> On Thursday 03 December 2015 13:03:41 Lee Jones wrote:
> > On Thu, 03 Dec 2015, Arnd Bergmann wrote:
> >=20
> > > On Thursday 03 December 2015 12:26:34 Lee Jones wrote:
> > > > > >
> > > > > > +static ssize_t rproc_state_write(struct file *filp, const =
char __user *userbuf,
> > > > > > +                                size_t count, loff_t *ppos=
)
> > > > > > +{
> > > > > > +       struct rproc *rproc =3D filp->private_data;
> > > > > > +       char buf[10];
> > > > > > +       int ret;
> > > > > > +
> > > > > > +       if (count > sizeof(buf))
> > > > > > +               return count;
> > > > > > +       ret =3D copy_from_user(buf, userbuf, count);
> > > > > > +       if (ret)
> > > > > > +               return -EFAULT;
> > > > > > +
> > > > > > +       if (buf[count - 1] =3D=3D '\n')
> > > > > > +               buf[count - 1] =3D '\0';
> > > > >=20
> > > > > I believe you can get here with count =3D 0.
> > > >=20
> > > > I'm pretty sure you can't.
> > > >=20
> > > > If you are sure that you can, if you can provide me with a way =
of
> > > > testing, I'd be happy to put in provisions.
> > > >=20
> > >=20
> > > I think that a zero-length write() from user space ends up in the=
 write
> > > file operation.
> >=20
> > I tested this and didn't see it enter write().  My conclusion was t=
hat
> > if the file doesn't change, then nothing is triggered.
> >=20
>=20
> Ah, interesting. I haven't tried myself, and just tried to read the
> code. Maybe glibc already catches zero-length writes before it gets
> into the kernel, or I just missed the part of the syscall that checks
> for this.

Glibc is responsible indeed:
 =20
  http://osxr.org/glibc/source/io/write.c

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
