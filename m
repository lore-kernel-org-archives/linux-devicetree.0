From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/4] remoteproc: debugfs: Add ability to boot remote
 processor using debugfs
Date: Tue, 1 Sep 2015 08:41:09 +0100
Message-ID: <20150901074109.GH4796@x1>
References: <1440757911-9120-1-git-send-email-lee.jones@linaro.org>
 <1440757911-9120-5-git-send-email-lee.jones@linaro.org>
 <55E097A8.4080305@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55E097A8.4080305-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 28 Aug 2015, Florian Fainelli wrote:
> On 28/08/15 03:31, Lee Jones wrote:
> > This functionality is especially useful during the testing phase.  =
When
> > used in conjunction with Mailbox's Test Framework we can trivially =
conduct
> > end-to-end testing i.e. boot co-processor, send and receive message=
s to
> > the co-processor, then shut it down again (repeat as required).
>=20
> This does not strike me as a particularly well defined nor suitable
> interface for controlling a remote processor's state. I know you are
> just extending the existing debugfs interface here, but someone ought=
 to
> remove that piece of code and make it a proper character device or
> netlink or whatever that allows someone to get proper signaling of
> what's going on with the remote processor state by polling or listeni=
ng
> to a socket.

Please don't confuse this debugging interface as a solid means by
which to control co-processors.  It's in DebugFS for a reason.  The
idea of this feature is for driver writers to control *easily*
control co-processors for testing purposes only.

DebugFS will be disabled in production images.

> What's the intended use case behind debugfs for this after all? Is yo=
ur
> application expected to keep reading the state file in a loop until i=
t
> is happy and reads "running", how is that not racy by nature?

There is no 'application'.  One of the key wins for DebugFS is that
driver writers don't have to write applications during the testing
phase.  Using a character device instead would be a mistake IMO.

> > Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
> > Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  drivers/remoteproc/remoteproc_debugfs.c | 29 +++++++++++++++++++++=
++++++++
> >  1 file changed, 29 insertions(+)
> >=20
> > diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remo=
teproc/remoteproc_debugfs.c
> > index 9d30809..464470d 100644
> > --- a/drivers/remoteproc/remoteproc_debugfs.c
> > +++ b/drivers/remoteproc/remoteproc_debugfs.c
> > @@ -88,8 +88,37 @@ static ssize_t rproc_state_read(struct file *fil=
p, char __user *userbuf,
> >  	return simple_read_from_buffer(userbuf, count, ppos, buf, i);
> >  }
> > =20
> > +static ssize_t rproc_state_write(struct file *filp, const char __u=
ser *userbuf,
> > +				 size_t count, loff_t *ppos)
> > +{
> > +	struct rproc *rproc =3D filp->private_data;
> > +	char buf[2];
> > +	int ret;
> > +
> > +	ret =3D copy_from_user(buf, userbuf, 1);
> > +	if (ret)
> > +		return -EFAULT;
> > +
> > +	switch (buf[0]) {
> > +	case '0':
> > +		rproc_shutdown(rproc);
> > +		break;
> > +	case '1':
> > +		ret =3D rproc_boot(rproc);
> > +		if (ret)
> > +			dev_warn(&rproc->dev, "Boot failed: %d\n", ret);
> > +		break;
> > +	default:
> > +		dev_err(&rproc->dev, "Unrecognised option: %x\n", buf[1]);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return count;
> > +}
> > +
> >  static const struct file_operations rproc_state_ops =3D {
> >  	.read =3D rproc_state_read,
> > +	.write =3D rproc_state_write,
> >  	.open =3D simple_open,
> >  	.llseek	=3D generic_file_llseek,
> >  };
> >=20
>=20
>=20

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
