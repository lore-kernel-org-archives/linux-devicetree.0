From: Ivo Sieben <meltedpianoman@gmail.com>
Subject: Re: [PATCH] SPI: at25: Parse dt settings
Date: Thu, 21 Jun 2012 11:49:13 +0200
Message-ID: <CAMSQXEHOtgk7wRRqOdpMaTvpxFd1Cpom=BG65GheY6Z4p2Jc3A@mail.gmail.com>
References: <1339678763-14509-1-git-send-email-aletes.xgr@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1339678763-14509-1-git-send-email-aletes.xgr@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang <w.sang@pengutronix.de>, Chris Wright <chrisw@sous-sol.org>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Roland Stigge <stigge@antcom.de>
List-Id: devicetree@vger.kernel.org

Hi,

2012/6/14 Alexandre Pereira da Silva <aletes.xgr@gmail.com>:
> @@ -305,25 +305,54 @@ static ssize_t at25_mem_write(struct memory_acc=
essor *mem, const char *buf,
> + =A0 =A0 =A0 if (!spi->dev.platform_data) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (np) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 u32 val;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 memset(&chip, 0, sizeof=
(chip));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 strncpy(chip.name, np->=
name, 10);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D of_property_rea=
d_u32(np, "at25,byte-len", &val);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (err) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg=
(&spi->dev, "invalid chip dt description\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fa=
il;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip.byte_len =3D val;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D of_property_rea=
d_u32(np, "at25,addr-mode", &val);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (err) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg=
(&spi->dev, "invalid chip dt description\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fa=
il;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip.flags =3D (u16)val=
;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D of_property_rea=
d_u32(np, "at25,page-size", &val);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (err) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg=
(&spi->dev, "invalid chip dt description\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fa=
il;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip.page_size =3D (u16=
)val;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg(&spi->dev, "no =
chip description\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D -ENODEV;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 } else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip =3D *(struct spi_eeprom *)spi->dev=
=2Eplatform_data;

One small remark:
In case of platform_data, the "if (!chip)" check has been removed and
is now only handled in the device tree initialization.
Maybe add this check to the platform initialization as well:

} else {
        if (!spi->dev.platform_data) {
                dev_dbg(&spi->dev, "no chip description\n");
                err =3D -ENODEV;
                goto fail;
        }
        chip =3D  *(struct spi_eeprom *)spi->dev.platform_data;
}

=46urthermore looks good to me...
(Note: I am not familiar with device trees, so I cannot judge that
part of this patch)

Regards,
Ivo Sieben
