From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/8] tpm: block messages while suspended
Date: Tue, 16 Jul 2019 11:28:51 -0700
Message-ID: <5d2e1764.1c69fb81.448bb.65c0@mx.google.com>
References: <20190613180931.65445-1-swboyd@chromium.org> <20190613180931.65445-2-swboyd@chromium.org> <20190613232613.GH22901@ziepe.ca> <5d03e394.1c69fb81.f028c.bffb@mx.google.com> <20190617225134.GA30762@ziepe.ca> <5d0c2cd6.1c69fb81.e66af.32bf@mx.google.com> <20190624142654.zprcpz42hivuyrjq@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190624142654.zprcpz42hivuyrjq@gondor.apana.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Andrey Pronin <apronin@chromium.org>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-integrity@vger.kernel.org, devicetree@vger.kernel.org, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>, Matt Mackall <mpm@selenic.com>, linux-crypto@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Herbert Xu (2019-06-24 07:26:54)
> On Thu, Jun 20, 2019 at 06:03:17PM -0700, Stephen Boyd wrote:
> >
> > What do you think of the attached patch? I haven't tested it, but it
> > would make sure that the kthread is frozen so that the hardware can be
> > resumed before the kthread is thawed and tries to go touch the hardware.
>=20
> Looks good to me.
>=20

Thanks for checking. I haven't been able to reproduce the problem yet to
confirm this is actually fixing anything, even after tweaking the sysctl
values for khwrng to try and force the thread to run continuously.

>From reading the bug report that caused this 'is_suspended' code to be
added to the driver I'm fairly convinced this is the right solution. To
give some more background, it looks like we use s2idle suspend (i.e.
all CPUs are idle across suspend) and then we have the kthread running
to ask the hardware for some more random numbers. The i2c transaction
fails when asking the hwrng for data, and we see these messages printed
on the resume path:

	i2c_designware i2c_designware.2: i2c_dw_handle_tx_abort: lost arbitration
	tpm tpm0: i2c transfer failed (attempt 3/3): -11
	tpm0: tpm_transmit: tpm_send: error -11
	hwrng: no data available

Userspace tasks are thawed after this failure so it looks like something
in the kernel kicks khwrng to grab more data before the i2c bus can be
resumed.
