From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 4/4] remoteproc: debugfs: Add ability to boot remote
 processor using debugfs
Date: Tue, 1 Sep 2015 08:48:07 +0100
Message-ID: <20150901074807.GI4796@x1>
References: <1440757911-9120-1-git-send-email-lee.jones@linaro.org>
 <1440757911-9120-5-git-send-email-lee.jones@linaro.org>
 <55E07CE2.2050704@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55E07CE2.2050704@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Lynch <Nathan_Lynch@mentor.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, ohad@wizery.com, devicetree@vger.kernel.org, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

On Fri, 28 Aug 2015, Nathan Lynch wrote:

> On 08/28/2015 05:31 AM, Lee Jones wrote:
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
>=20
> This prints uninitialized kernel stack contents instead of what was
> copied from user space.

Yes, you're right.  I will conduct a better test of the failure path
here.=20

> Is the dev_err statement really necessary anyway?

Yes.  As I described in my other mail, this interface is for Kernel
Engineers, who read the kernel log.

> > +	}
> > +
> > +	return count;
> > +}
>=20
> If rproc_boot fails, that should be reflected in the syscall result.
>=20
> This interface is essentially exposing the remoteproc->power refcount=
 to
> user space; is that okay?  Seems like it makes it easy to underflow
> remoteproc->power through successive shutdown calls.

If the subsystem is suseptable to underruns someone should think about
adding protection against imbalances in the 'core'.

> The other debugfs interface in remoteproc that has a write method
> (recovery) accepts more expressive string commands as opposed to 0/1.
> It would be more consistent for this interface to take commands such =
as
> "boot" and "shutdown" IMO.

Agreed.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
