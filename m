From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v13 2/5] tee: generic TEE subsystem
Date: Fri, 20 Jan 2017 17:47:40 +0100
Message-ID: <8436100.O3a8W3D0ph@wuerfel>
References: <1479480700-554-1-git-send-email-jens.wiklander@linaro.org>
 <5825882.vZRDMrBMkW@wuerfel> <20170119164541.GA22094@jax>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170119164541.GA22094@jax>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: valentin.manea@huawei.com, devicetree@vger.kernel.org, javier@javigon.com, emmanuel.michel@st.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Rob Herring <robh+dt@kernel.org>, broonie@kernel.org, Al Viro <viro@zeniv.linux.org.uk>, "Andrew F. Davis" <afd@ti.com>, Olof Johansson <olof@lixom.net>, Andrew Morton <akpm@linux-foundation.org>, jean-michel.delorme@st.com, Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thursday, January 19, 2017 5:45:43 PM CET Jens Wiklander wrote:
> =

> On Wed, Jan 18, 2017 at 09:19:25PM +0100, Arnd Bergmann wrote:
> > On Friday, November 18, 2016 3:51:37 PM CET Jens Wiklander wrote:
> > > Initial patch for generic TEE subsystem.
> > > This subsystem provides:
> > > * Registration/un-registration of TEE drivers.
> > > * Shared memory between normal world and secure world.
> > > * Ioctl interface for interaction with user space.
> > > * Sysfs implementation_id of TEE driver
> > > =

> > > A TEE (Trusted Execution Environment) driver is a driver that interfa=
ces
> > > with a trusted OS running in some secure environment, for example,
> > > TrustZone on ARM cpus, or a separate secure co-processor etc.
> > > =

> > > The TEE subsystem can serve a TEE driver for a Global Platform compli=
ant
> > > TEE, but it's not limited to only Global Platform TEEs.
> > > =

> > > This patch builds on other similar implementations trying to solve
> > > the same problem:
> > > * "optee_linuxdriver" by among others
> > >   Jean-michel DELORME<jean-michel.delorme@st.com> and
> > >   Emmanuel MICHEL <emmanuel.michel@st.com>
> > > * "Generic TrustZone Driver" by Javier Gonz=E1lez <javier@javigon.com>
> > =

> > Can you give an example for a system that would contain more than one
> > TEE? I see that you support dynamic registration, and it's clear that
> > there can be more than one type of TEE, but why would one have more
> > than one at a time, and why not more than 32?
> =

> I know that ST has systems where there's one TEE in TrustZone and
> another TEE on a separate secure co-processor. If you have several TEEs
> it's probably because they have different capabilities (performance
> versus level of security). Just going beyond two or three different
> levels of security with different TEEs sounds a bit extreme, so a
> maximum of 32 or 16 should be fairly safe. If it turns out I'm wrong in
> this assumption it's not that hard to correct it.

Ok

> > =

> > > +	if (copy_from_user(&arg, uarg, sizeof(arg)))
> > > +		return -EFAULT;
> > > +
> > > +	if (sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) !=3D buf.buf=
_len)
> > > +		return -EINVAL;
> > > +
> > > +	if (arg.num_params) {
> > > +		params =3D kcalloc(arg.num_params, sizeof(struct tee_param),
> > > +				 GFP_KERNEL);
> > > +		if (!params)
> > > +			return -ENOMEM;
> > =

> > It would be good to have an upper bound on the number of parameters
> > to limit the size of the memory allocation here.
> =

> This is already limited due to:
> =

> The test with: buf.buf_len > TEE_MAX_ARG_SIZE
> =

> And then another test that the number of parameters matches the buffer si=
ze
> with: sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) !=3D buf.buf_len

Ok, makes sense.

> > =

> > > +/**
> > > + * struct tee_ioctl_param - parameter
> > > + * @attr: attributes
> > > + * @memref: a memory reference
> > > + * @value: a value
> > > + *
> > > + * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref or value is =
used in
> > > + * the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value and
> > > + * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref. TEE_PARAM_ATTR_TYP=
E_NONE
> > > + * indicates that none of the members are used.
> > > + */
> > > +struct tee_ioctl_param {
> > > +	__u64 attr;
> > > +	union {
> > > +		struct tee_ioctl_param_memref memref;
> > > +		struct tee_ioctl_param_value value;
> > > +	} u;
> > > +};
> > > +
> > > +#define TEE_IOCTL_UUID_LEN		16
> > > +
> > =

> > Having a union in an ioctl argument seems odd. Have you considered
> > using two different ioctl command numbers depending on the type?
> =

> struct tee_ioctl_param is used as an array and some parameters can be
> memrefs while other are values.

Got it. I still think it's a bit awkward on the user ABI side.
I also see that (unlike the in-kernel interface) tee_ioctl_param_memref
and tee_ioctl_param_value are both defined in terms of three __u64
members.

How about simply using one format here and making this

struct tee_ioctl_param {
   __u64 attr;
   __u64 a;
   __u64 b;
   __u64 c;
};

Given that you need a wrapper to set the pointer in memref anyway?

Having an ioctl with a variable number of variable type arguments
is really a weakness of the ABI, but I don't see a good way around
it either, the above would just make it slightly more direct.

> > > +/**
> > > + * struct tee_iocl_supp_send_arg - Send a response to a received req=
uest
> > > + * @ret:	[out] return value
> > > + * @num_params	[in] number of parameters following this struct
> > > + */
> > > +struct tee_iocl_supp_send_arg {
> > > +	__u32 ret;
> > > +	__u32 num_params;
> > > +	/*
> > > +	 * this struct is 8 byte aligned since the 'struct tee_ioctl_param'
> > > +	 * which follows requires 8 byte alignment.
> > > +	 *
> > > +	 * Commented out element used to visualize the layout dynamic part
> > > +	 * of the struct. This field is not available at all if
> > > +	 * num_params =3D=3D 0.
> > > +	 *
> > > +	 * struct tee_ioctl_param params[num_params];
> > > +	 */
> > > +} __aligned(8);
> > =

> > I'd make that =

> > =

> > 	struct tee_ioctl_param params[0];
> > =

> > as wel here, as I also commented in patch 3 that has a similar structur=
e.
> =

> I'm concerned that this may cause warnings when compiling for user space
> depending on compiler and options. Am I too cautious here?

See https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html

I actually misremembered it and the syntax I listed is GCC specific,
but C99 allows "flexible arrays". I think there is no problem relying
on C99 here, we already rely on C99 features elsewhere in headers.

	Arnd
