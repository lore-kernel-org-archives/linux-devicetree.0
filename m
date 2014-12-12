From: Nikolaus Schulz <nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 2/2] iio: add driver for the TI DAC8554
Date: Fri, 12 Dec 2014 17:15:36 +0100
Message-ID: <20141212161536.GC1142@avionic-0071.adnet.avionic-design.de>
References: <1416858614-32265-1-git-send-email-nikolaus.schulz@avionic-design.de>
 <1416858614-32265-2-git-send-email-nikolaus.schulz@avionic-design.de>
 <5482EA33.7020305@gmx.de>
 <548AD814.2060206@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <548AD814.2060206-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Welling <mwelling-EkmVulN54Sk@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 12, 2014 at 11:57:08AM +0000, Jonathan Cameron wrote:
> On 06/12/14 11:36, Hartmut Knaack wrote:
> > Nikolaus Schulz schrieb am 24.11.2014 um 20:50:
> >> The TI DAC8554 is a quad-channel Digital-to-Analog Converter with =
an SPI
> >> interface.
> >>
> >> Changes in v2:
> >> * Use DMA-safe buffer for SPI transfer
> >> * Normalize powerdown_mode name "hi-z" to "three_state" as per
> >>   ABI/testing/sysfs-bus-iio
> >> * Register device late in probe function
> >> * Avoid powerdown broadcast update, which touches all DAC on the b=
us
> > There are a few issues left, please see my comments inline.
> 1 little one from me...
> >>
> >> Signed-off-by: Nikolaus Schulz <nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> >> ---
> >>  drivers/iio/dac/Kconfig      |  10 ++
> >>  drivers/iio/dac/Makefile     |   1 +
> >>  drivers/iio/dac/ti-dac8554.c | 374 ++++++++++++++++++++++++++++++=
+++++++++++++
> >>  3 files changed, 385 insertions(+)
> >>  create mode 100644 drivers/iio/dac/ti-dac8554.c
[...]
> >> diff --git a/drivers/iio/dac/ti-dac8554.c b/drivers/iio/dac/ti-dac=
8554.c
> >> new file mode 100644
> >> index 0000000..fca751f
> >> --- /dev/null
> >> +++ b/drivers/iio/dac/ti-dac8554.c
[...]
> >> +static int dac8554_powerdown(struct dac8554_state *st,
> >> +			     u8 powerdown_mode)
> >> +{
> >> +	int chan, cmd, ret;
> >> +
> >> +	for (chan =3D DAC8554_DAC_CHANNELS-1; chan >=3D 0; --chan) {
> > Please mind spaces around operators.
> >> +		cmd =3D chan ? DAC8554_CMD_STORE_DAC_N
> >> +			   : DAC8554_CMD_STORE_DAC_N_UPDATE_ALL;
> >> +		ret =3D dac8554_spi_write(st, cmd, chan,
> >> +				DAC8554_PWRDN_TO_SR(powerdown_mode));
> >> +		if (ret)
> >> +			return ret;
> >> +	}
> >> +
> >> +	memset(st->powerdown_mode, powerdown_mode, sizeof(st->powerdown_=
mode));
> >> +	memset(st->powerdown, true, sizeof(st->powerdown));
> Whilst this probably works, I think for the boolean case it is less
> than entirely obvious, so probably better to have a simple loop.

Yeah, I agree it's better to keep it as simple and obvious as possible.
=46ixed in v3.

> >> +
> >> +	return 0;
> >> +}

--=20
Avionic Design GmbH
Nikolaus Schulz
Wragekamp 10
D-22397 Hamburg
Germany

Tel.:  +49 40 88187-163
=46ax:   +49 40 88187-150
Email: nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org

Avionic Design GmbH
Amtsgericht Hamburg HRB 82598
Gesch=E4ftsf=FChrung: Cornelis Broers
Ust.-Ident-Nr.: DE813378254
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
