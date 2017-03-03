From: Alban <albeu@free.fr>
Subject: Re: [PATCH 2/3] mtd: Add support for reading MTD devices via the
 nvmem API
Date: Fri, 3 Mar 2017 14:57:26 +0100
Message-ID: <20170303145726.16cd67fd@tock>
References: <1488484223-844-1-git-send-email-albeu@free.fr>
 <1488484223-844-3-git-send-email-albeu@free.fr>
 <20170302221803.223ff23b@bbrezillon> <20170303133629.3aac2945@tock>
 <20170303143658.5d89a329@bbrezillon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1636090648947186700=="
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20170303143658.5d89a329@bbrezillon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Aban Bedel <albeu@free.fr>, linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

--===============1636090648947186700==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/dSdeUy.S91Z4D0okeqOWYSh"; protocol="application/pgp-signature"

--Sig_/dSdeUy.S91Z4D0okeqOWYSh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 3 Mar 2017 14:36:58 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Fri, 3 Mar 2017 13:36:29 +0100
> Alban <albeu@free.fr> wrote:
>=20
> > On Thu, 2 Mar 2017 22:18:03 +0100
> > Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> >  =20
> > > On Thu,  2 Mar 2017 20:50:22 +0100
> > > Alban <albeu@free.fr> wrote:
> > >=20
> > > [snip]
> > >   =20
> [snip]
>  =20
> > > Maybe we should let notifiers return an error if they want to cancel
> > > the removal, or maybe this is a good reason to put the nvmem pointer
> > > directly in mtd_info and call mtd_nvmem_add/remove() directly from
> > > add/del_mtd_device() and allow them to return an error.
> > >=20
> > > Not that, if you go for this solution, you'll also get rid of the
> > > global mtd_nvmem_list list and the associated lock.   =20
> >=20
> > IMHO the MTD users framework has to be re-worked to be useful. First
> > both the add and remove callbacks should have return values. Users where
> > the add failed shouldn't be removed later and users where the remove
> > fails should block the removal of the MTD. =20
>=20
> As said in my previous reply, it's not just about returning an error. I
> had a closer look at the code, and it seems that using
> __get_mtd_device() properly should prevent the problem we are talking
> about (call __get_mtd_device() after your nvmem_register() and call
> __put_mtd_device() only if nvmem_unregister() succeed).

That's not going to work. If the notifier add increase the MTD reference
count it can never be removed again. What could work would be to
propagate the nvmem device ref counting down to the MTD device, but that
sound complex and would require some non-trivial locking to still allow
for an "always succeed" removal.

> >=20
> > Furthermore only passing the MTD device to the add/remove callback
> > force the users to keep their own list, which is annoying to say the
> > least. A simple fix would be to have the add callback return a pointer
> > that would be passed back to the remove callback. Trivial to implement
> > and the MTD user wouldn't have to keep any list. I will look into this
> > in the next days. =20
>=20
> That's a different problem, and I'm not sure I like the idea of
> changing the ->add() prototype into
>=20
> 	void *(*add)(struct mtd_info *);
>=20
> If we want to do that, I'd rather see an API extension allowing one to
> attach/detach/query/update user data to an MTD device.

Under which condition would these be triggered? That sound more than is
needed. I would just use the above add along with:

 int (*remove)(struct mtd_info *, void *);

And add a list of successfully added notifiers, along with their
data pointer, to the MTD device. That's simple and would also remove
the need for notifier to have a private list of their instances as I
had to do here.

Alban

--Sig_/dSdeUy.S91Z4D0okeqOWYSh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYuXZGAAoJEHSUmkuduC28X9gQAOVn3nuqT8V8Lr34WVlzun8S
4+Skh0A/TCIwVGw24/TZO669QCTE6ZPlnDT2gf38AVrFdv51jaKZe7YMlzrZBhvy
BfWFuXKxJlPIjNnMdehMIw6Y41l958ccNuJBnlXtpRUGjmestGOyhyHorbCW3AC9
vnRVQLe1CiZlG1OOHDlSSWKCr+nGcyO6G0N8Gd5JNaTQgyrLzfuYr4HnvkllMmGg
94VTp55ZQcv/sCTH4ulxPgOIaO0ZmLPPdN2sKFY4uRkDCKBU+ez0DZNrI55V4gmT
vwgZlTZAWw9Q2arF1AP22bIYjONtgY08vbK9v3DQ/+/jD+5iGW3DyesX3LfOxdoP
C0gB2Cv8gGAGVOjOHk7VGAdG4H7L/HwaIaIUiULGBeF3HbX+WBK+xvScEiHqR4cz
ENY+38W9xhKbtC8BHiuCj2rbcVcshwfDyzDsGJ3ZsqVYUPUUarAZUlnxMtFRi9Qu
j9o9baeyI/DeH3ltywot3CKutodrorrBG0jQv+QiBqKzGzok/+9v/pJtXYycR48e
C7UvuGFFL3zqTx/8GevBzKPLIZkHiJscsCxgHZNgdPt2TqC4VzkiGXBMQxF9C4WY
HRnl93CEaY1rR6MHbKTVOoE2/yrsPqAAcwPkFdmVi/Tx+7vIom2yL8lhOWRdSzL9
fJhL/IAiaITvH2jFKh/u
=+ROQ
-----END PGP SIGNATURE-----

--Sig_/dSdeUy.S91Z4D0okeqOWYSh--


--===============1636090648947186700==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1636090648947186700==--
