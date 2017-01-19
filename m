From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2] ARM: dts: imx: Pass 'chosen' and 'memory' nodes
Date: Thu, 19 Jan 2017 17:14:41 +0100
Message-ID: <20170119161441.jcctgig7np4v7sam@pengutronix.de>
References: <1484834566-19845-1-git-send-email-fabio.estevam@nxp.com>
 <20170119141335.kpbrbpbwaovnijjv@pengutronix.de>
 <CAOMZO5AdgM9eFnerLRdYxwE7gsOE5OvkWs6rCR4zta1XmXHj1A@mail.gmail.com>
 <20170119144641.jxj2bqg5uqjol23x@pengutronix.de>
 <20170119145642.GC27312@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170119145642.GC27312@n2100.armlinux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Fabio Estevam <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 19, 2017 at 02:56:42PM +0000, Russell King - ARM Linux wrote:
> On Thu, Jan 19, 2017 at 03:46:41PM +0100, Uwe Kleine-K=F6nig wrote:
> > On Thu, Jan 19, 2017 at 12:35:40PM -0200, Fabio Estevam wrote:
> > > Hi Uwe,
> > > =

> > > On Thu, Jan 19, 2017 at 12:13 PM, Uwe Kleine-K=F6nig
> > > <u.kleine-koenig@pengutronix.de> wrote:
> > > =

> > > > Would it be nice to add a comment about why this was added? Somethi=
ng to
> > > > prevent a cleanup like "remove empty nodes and invalid memory
> > > > configurations".
> > > =

> > > Do you mean something like this?
> > > =

> > > /* "chosen" and "memory" nodes are mandatory */
> > > chosen {};
> > > memory { device_type =3D "memory"; reg =3D <0 0>; };
> > =

> > Not very helpful comment. Something like:
> > =

> > 	/*
> > 	 * The decompressor relies on a pre-existing chosen node to be
> > 	 * available to insert the command line and merge other ATAGS
> > 	 * info.
> > 	 */
> > =

> > Is it difficult to fix the decompressor?
> =

> ... and that comment would be wrong.  Yes, the decompressor relies on it,
> as do some uboot versions.

Good that we talked about this, otherwise I would have removed that once
the decompressor is fixed. So the comment must be

	/*
	 * The decompressor and also some versions of U-Boot rely on a
	 * pre-existing /chosen node to be available to insert the
	 * command line and merge other ATAGS info.
	 * Also for U-Boot there must be a pre-existing /memory node.
	 */
 =

> > I didn't understood the breakage regarding the memory node good enough
> > to suggest a comment for that.
> =

> A missing memory node appears to prevent some uboot versions supplying
> any kind of memory layout to the kernel, which then causes the kernel to
> crash very early during boot.
> =

> Again, this is not using appended DTB - this is using a separately loaded
> DTB in uboot.  uboot fails to update the dtb if these nodes are missing.
> =

> Frankly, I think the original change (removing the skeleton.dtsi include)
> was misguided and needs to be reverted - the change is imho built upon an
> incorrect assumption that nothing in skeleton.dtsi is required.  That's
> clearly false.

I tend to agree as I assume it's not only U-Boot on i.MX but on all ARM
platforms.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
