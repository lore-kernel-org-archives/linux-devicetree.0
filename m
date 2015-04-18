From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 2/2] tee: add OP-TEE driver
Date: Sat, 18 Apr 2015 21:01:44 +0200
Message-ID: <4984990.7rV4p0zMYU@wuerfel>
References: <1429257057-7935-1-git-send-email-jens.wiklander@linaro.org> <FCFF5E10-0DDC-4ED1-A8B8-D649ADD5E506@javigon.com> <20150418184903.GB30508@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150418184903.GB30508@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Javier =?ISO-8859-1?Q?Gonz=E1lez?= <javier@javigon.com>, Jens Wiklander <jens.wiklander@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, tpmdd-devel@lists.sourceforge.net, Valentin Manea <valentin.manea@huawei.com>, jean-michel.delorme@st.com, emmanuel.michel@st.com
List-Id: devicetree@vger.kernel.org

On Saturday 18 April 2015 20:49:03 Greg Kroah-Hartman wrote:
> On Sat, Apr 18, 2015 at 11:36:53AM +0200, Javier Gonz=E1lez wrote:
> > Hi,
>=20
> A: No.
> Q: Should I include quotations after my reply?
>=20
> http://daringfireball.net/2007/07/on_top
>=20
> > We have discussed and implemented an in-kernel interface for the dr=
iver.
> > However, we need to agree on that interface with the kernel submodu=
les that
> > can be interested in using it (e.g., IMA, keyring). We though it wa=
s easier
> > to have a framework in place before taking this space. This makes s=
ense
> > since a TEE driver will be, as for today, mostly used by user space=
=2E
> > applications.
>=20
> No, please provide a "real" solution, just providing a framework that=
 no
> one uses means that I get to delete it from the kernel tree the next
> release, and I doubt you want that=20
>=20
> Please do all of the work here, as odds are, what you need in the end
> will be different from what you have proposed here.

I guess an alternative would be to remove all the unused infrastructure
code and only provide a user space interface for the features that
op_tee requires, but no optional user interfaces or in-kernel interface=
s.

	Arnd
