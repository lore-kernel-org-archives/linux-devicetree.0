From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] tty/serial: Relax the device_type restriction from of_serial
Date: Fri, 25 Feb 2011 12:22:37 -0700
Message-ID: <AANLkTinx2YxOs3Y-XDHaWe44Bw8HqiMyanouV5Bo3KuX@mail.gmail.com>
References: <20110223021221.17638.42707.stgit@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110223021221.17638.42707.stgit@localhost6.localdomain6>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, Benjamin
List-Id: devicetree@vger.kernel.org

Hi Arnd and Ben,

I forgot to cc you guys on this patch.  Greg has it in his tree, but I
wanted to make sure you noticed it.  If you have any objections, let
me know and I'll ask Greg to drop it.

Thanks,
g.


On Tue, Feb 22, 2011 at 7:12 PM, Grant Likely <grant.likely@secretlab.c=
a> wrote:
> There is no need to test for a device_type property in ns8250
> compatible serial ports. =A0device_type is an OpenFirmware property t=
hat
> is not required when using the flattened tree representation.
>
> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
> ---
> =A0drivers/tty/serial/of_serial.c | =A0 18 +++++++++---------
> =A01 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/tty/serial/of_serial.c b/drivers/tty/serial/of_s=
erial.c
> index 5c7abe4..6a18ca6 100644
> --- a/drivers/tty/serial/of_serial.c
> +++ b/drivers/tty/serial/of_serial.c
> @@ -160,17 +160,17 @@ static int of_platform_serial_remove(struct pla=
tform_device *ofdev)
> =A0* A few common types, add more as needed.
> =A0*/
> =A0static struct of_device_id __devinitdata of_platform_serial_table[=
] =3D {
> - =A0 =A0 =A0 { .type =3D "serial", .compatible =3D "ns8250", =A0 .da=
ta =3D (void *)PORT_8250, },
> - =A0 =A0 =A0 { .type =3D "serial", .compatible =3D "ns16450", =A0.da=
ta =3D (void *)PORT_16450, },
> - =A0 =A0 =A0 { .type =3D "serial", .compatible =3D "ns16550a", .data=
 =3D (void *)PORT_16550A, },
> - =A0 =A0 =A0 { .type =3D "serial", .compatible =3D "ns16550", =A0.da=
ta =3D (void *)PORT_16550, },
> - =A0 =A0 =A0 { .type =3D "serial", .compatible =3D "ns16750", =A0.da=
ta =3D (void *)PORT_16750, },
> - =A0 =A0 =A0 { .type =3D "serial", .compatible =3D "ns16850", =A0.da=
ta =3D (void *)PORT_16850, },
> + =A0 =A0 =A0 { .compatible =3D "ns8250", =A0 .data =3D (void *)PORT_=
8250, },
> + =A0 =A0 =A0 { .compatible =3D "ns16450", =A0.data =3D (void *)PORT_=
16450, },
> + =A0 =A0 =A0 { .compatible =3D "ns16550a", .data =3D (void *)PORT_16=
550A, },
> + =A0 =A0 =A0 { .compatible =3D "ns16550", =A0.data =3D (void *)PORT_=
16550, },
> + =A0 =A0 =A0 { .compatible =3D "ns16750", =A0.data =3D (void *)PORT_=
16750, },
> + =A0 =A0 =A0 { .compatible =3D "ns16850", =A0.data =3D (void *)PORT_=
16850, },
> =A0#ifdef CONFIG_SERIAL_OF_PLATFORM_NWPSERIAL
> - =A0 =A0 =A0 { .type =3D "serial", .compatible =3D "ibm,qpace-nwp-se=
rial",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 .data =3D (void *)PORT_NWPSERIAL, },
> + =A0 =A0 =A0 { .compatible =3D "ibm,qpace-nwp-serial",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .data =3D (void *)PORT_NWPSERIAL, },
> =A0#endif
> - =A0 =A0 =A0 { .type =3D "serial", =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 .data =3D (void *)PORT_UNKNOWN, },
> + =A0 =A0 =A0 { .type =3D "serial", =A0 =A0 =A0 =A0 .data =3D (void *=
)PORT_UNKNOWN, },
> =A0 =A0 =A0 =A0{ /* end of list */ },
> =A0};
>
>
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
