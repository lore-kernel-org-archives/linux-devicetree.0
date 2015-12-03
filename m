From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND v4 2/6] remoteproc: debugfs: Add ability to boot remote
 processor using debugfs
Date: Thu, 3 Dec 2015 13:03:41 +0000
Message-ID: <20151203130341.GA26902@x1>
References: <1448370862-19120-1-git-send-email-lee.jones@linaro.org>
 <CAJAp7Og2MPapOQmCSB9o4qwQHsA8_iyAWPhjHYPw6J=xCK2xew@mail.gmail.com>
 <20151203122634.GX12874@x1>
 <5329827.I5W30K072M@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5329827.I5W30K072M@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Bjorn Andersson <bjorn@kryo.se>, Ohad Ben-Cohen <ohad@wizery.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, kernel@stlinux.com, Nathan_Lynch@mentor.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ludovic.barre@st.com, Maxime Coquelin <maxime.coquelin@st.com>
List-Id: devicetree@vger.kernel.org

On Thu, 03 Dec 2015, Arnd Bergmann wrote:

> On Thursday 03 December 2015 12:26:34 Lee Jones wrote:
> > > >
> > > > +static ssize_t rproc_state_write(struct file *filp, const char=
 __user *userbuf,
> > > > +                                size_t count, loff_t *ppos)
> > > > +{
> > > > +       struct rproc *rproc =3D filp->private_data;
> > > > +       char buf[10];
> > > > +       int ret;
> > > > +
> > > > +       if (count > sizeof(buf))
> > > > +               return count;
> > > > +       ret =3D copy_from_user(buf, userbuf, count);
> > > > +       if (ret)
> > > > +               return -EFAULT;
> > > > +
> > > > +       if (buf[count - 1] =3D=3D '\n')
> > > > +               buf[count - 1] =3D '\0';
> > >=20
> > > I believe you can get here with count =3D 0.
> >=20
> > I'm pretty sure you can't.
> >=20
> > If you are sure that you can, if you can provide me with a way of
> > testing, I'd be happy to put in provisions.
> >=20
>=20
> I think that a zero-length write() from user space ends up in the wri=
te
> file operation.

I tested this and didn't see it enter write().  My conclusion was that
if the file doesn't change, then nothing is triggered.

> Also, we get a gcc warning about the out-of-bounds access for code li=
ke
> this, and checking that count is larger than zero avoids the warning.

I did however see this warning and wondered what it was talking
about.  Thanks for clarifying.  Will fix.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
