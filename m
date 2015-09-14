From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/6] hwrng: core: Simplify RNG switching from sysfs
Date: Mon, 14 Sep 2015 08:27:01 +0100
Message-ID: <20150914072701.GB27591@x1>
References: <1442002110-28733-1-git-send-email-lee.jones@linaro.org>
 <1442002110-28733-3-git-send-email-lee.jones@linaro.org>
 <87a8sq4ctu.fsf@dell.be.48ers.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-crypto-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87a8sq4ctu.fsf@dell.be.48ers.dk>
Sender: linux-crypto-owner@vger.kernel.org
To: Peter Korsgaard <peter@korsgaard.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org, mpm@selenic.com, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

On Sun, 13 Sep 2015, Peter Korsgaard wrote:

> >>>>> "Lee" =3D=3D Lee Jones <lee.jones@linaro.org> writes:
>=20
>  > If we attempt to use sysfs to change the current RNG in the usual
>  > way i.e. issuing something like:
>=20
>  > `echo 8a8a000.rng > /sys/devices/virtual/misc/hw_random/rng_curren=
t`
>=20
>  > ... it will fail because the code doesn't currently take the '\n'
>  > into consideration.  Well, now it does.
>=20
>  > Signed-off-by: Lee Jones <lee.jones@linaro.org>
>  > ---
>  >  drivers/char/hw_random/core.c | 7 ++++++-
>  >  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
>  > diff --git a/drivers/char/hw_random/core.c b/drivers/char/hw_rando=
m/core.c
>  > index da8faf7..14dc984 100644
>  > --- a/drivers/char/hw_random/core.c
>  > +++ b/drivers/char/hw_random/core.c
>  > @@ -316,6 +316,7 @@ static ssize_t hwrng_attr_current_store(struct=
 device *dev,
>  >  					const char *buf, size_t len)
>  >  {
>  >  	int err;
>  > +	int snip =3D 0;
>  >  	struct hwrng *rng;
> =20
>  >  	err =3D mutex_lock_interruptible(&rng_mutex);
>  > @@ -323,7 +324,11 @@ static ssize_t hwrng_attr_current_store(struc=
t device *dev,
>  >  		return -ERESTARTSYS;
>  >  	err =3D -ENODEV;
>  >  	list_for_each_entry(rng, &rng_list, list) {
>  > -		if (strcmp(rng->name, buf) =3D=3D 0) {
>  > +
>  > +		if (buf[len-1] =3D=3D '\n')
>  > +			snip =3D 1; /* Snip one character */
>  > +
>=20
> How about using sysfs_streq() instead, which is what is done elsewher=
e?

Perfect.  This is exactly what I'm trying to do, thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
