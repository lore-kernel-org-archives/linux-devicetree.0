From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/8] tpm: block messages while suspended
Date: Thu, 20 Jun 2019 18:03:17 -0700
Message-ID: <5d0c2cd6.1c69fb81.e66af.32bf@mx.google.com>
References: <20190613180931.65445-1-swboyd@chromium.org> <20190613180931.65445-2-swboyd@chromium.org> <20190613232613.GH22901@ziepe.ca> <5d03e394.1c69fb81.f028c.bffb@mx.google.com> <20190617225134.GA30762@ziepe.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617225134.GA30762@ziepe.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Andrey Pronin <apronin@chromium.org>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-integrity@vger.kernel.org, devicetree@vger.kernel.org, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Jason Gunthorpe (2019-06-17 15:51:34)
> On Fri, Jun 14, 2019 at 11:12:36AM -0700, Stephen Boyd wrote:
> > Quoting Jason Gunthorpe (2019-06-13 16:26:13)
> > > On Thu, Jun 13, 2019 at 11:09:24AM -0700, Stephen Boyd wrote:
> > > > From: Andrey Pronin <apronin@chromium.org>
> > > >=20
> > > > Other drivers or userspace may initiate sending a message to the tpm
> > > > while the device itself and the controller of the bus it is on are
> > > > suspended. That may break the bus driver logic.
> > > > Block sending messages while the device is suspended.
> > > >=20
> > > > Signed-off-by: Andrey Pronin <apronin@chromium.org>
> > > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > > >=20
> > > > I don't think this was ever posted before.
> > >=20
> > > Use a real lock.
> > >=20
> >=20
> > To make sure the bit is tested under a lock so that suspend/resume can't
> > update the bit in parallel?
>=20
> No, just use a real lock, don't make locks out of test bit/set bit
>=20

Ok. I looked back on the history of this change in our kernel (seems it
wasn't attempted upstream for some time) and it looks like the problem
may have been that the khwrng kthread (i.e. hwrng_fill()) isn't frozen
across suspend/resume. This kthread runs concurrently with devices being
resumed, the cr50 hardware is still suspended, and then a tpm command is
sent and it hangs the I2C bus because the device hasn't been properly
resumed yet.

I suspect a better approach than trying to hold of all TPM commands
across suspend/resume would be to fix the caller here to not even try to
read the hwrng during this time. It's a general problem for other hwrngs
that have some suspend/resume hooks too. This kthread is going to be
running while suspend/resume is going on if the random entropy gets too
low, and that probably shouldn't be the case.

What do you think of the attached patch? I haven't tested it, but it
would make sure that the kthread is frozen so that the hardware can be
resumed before the kthread is thawed and tries to go touch the hardware.

----8<-----
diff --git a/drivers/char/hw_random/core.c b/drivers/char/hw_random/core.c
index 95be7228f327..3b88af3149a7 100644
--- a/drivers/char/hw_random/core.c
+++ b/drivers/char/hw_random/core.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/freezer.h>
 #include <linux/fs.h>
 #include <linux/hw_random.h>
 #include <linux/kernel.h>
@@ -421,7 +422,9 @@ static int hwrng_fillfn(void *unused)
 {
 	long rc;
=20
-	while (!kthread_should_stop()) {
+	set_freezable();
+
+	while (!kthread_freezable_should_stop(NULL)) {
 		struct hwrng *rng;
=20
 		rng =3D get_current_rng();
