From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v10 2/4] tee: generic TEE subsystem
Date: Tue, 07 Jun 2016 07:35:56 -0700
Message-ID: <1465310156.25087.19.camel@perches.com>
References: <1464784888-19854-1-git-send-email-jens.wiklander@linaro.org>
	 <1464784888-19854-3-git-send-email-jens.wiklander@linaro.org>
	 <5755EECA.6040606@ti.com> <20160607105015.GA18132@ermac>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160607105015.GA18132@ermac>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Wiklander <jens.wiklander@linaro.org>, Nishanth Menon <nm@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Al Viro <viro@ZenIV.linux.org.uk>, Andreas Dannenberg <dannenberg@ti.com>, valentin.manea@huawei.com, jean-michel.delorme@st.com, emmanuel.michel@st.com, javier@javigon.com, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Tue, 2016-06-07 at 12:50 +0200, Jens Wiklander wrote:
> On Mon, Jun 06, 2016 at 04:44:42PM -0500, Nishanth Menon wrote:
> >=20
> > On 06/01/2016 07:41 AM, Jens Wiklander wrote:
> > few minor comments below.
> >=20
> > I see the patch generated (with --strict):
> > >=20
> > > CHECK: Alignment should match open parenthesis
> > > #512: FILE: drivers/tee/tee.c:375:
> > > +static int tee_ioctl_close_session(struct tee_context *ctx,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0struct tee_ioctl_close=
_session_arg __user *uarg)
> > > CHECK: Alignment should match open parenthesis
> > > #1607: FILE: drivers/tee/tee_shm_pool.c:103:
> > > +struct tee_shm_pool *tee_shm_pool_alloc_res_mem(struct device *d=
ev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
struct tee_shm_pool_mem_info *priv_info,
> > > CHECK: Alignment should match open parenthesis
> The alternative is to format it as:
> struct tee_shm_pool *tee_shm_pool_alloc_res_mem(struct device *dev,
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0struct tee_shm_pool_mem_info
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0*priv_info,
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0struct tee_shm_pool_mem_info
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0*dmabuf_info)
> But that is a bit awkward. I'd like to keep it as it is if you don't =
mind.

another style uses a separate line for the return type

struct tee_shm_pool *
tee_shm_pool_alloc_res_mem(struct device *dev,
			=A0 =A0struct tee_shm_pool_mem_info *priv_info,
			=A0 =A0struct tee_shm_pool_mem_info *dmabuf_info)
