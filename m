From: Valdis.Kletnieks-PjAqaU27lzQ@public.gmane.org
Subject: Re: [PATCH 1/3] ARM: DTS: da850: add node for spi0
Date: Fri, 15 Apr 2016 16:16:29 -0400
Message-ID: <31522.1460751389@turing-police.cc.vt.edu>
References: <1460586628-25152-1-git-send-email-david@lechnology.com> <1460586628-25152-2-git-send-email-david@lechnology.com> <5710C176.3040304@ti.com>
 <57111433.6080402@lechnology.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1460751389_2686P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57111433.6080402-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Cc: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--==_Exmh_1460751389_2686P
Content-Type: text/plain; charset=us-ascii

On Fri, 15 Apr 2016 11:17:55 -0500, David Lechner said:

> I omitted this on purpose. For my use case, I am using the SPI as
> write-only,

So your SPI accesses are fire-and-forget, and nothing ever comes back?
Seems a very dangerous way to design the use case, with no feedback if
something suddenly goes pear-shaped...

Or do you have ways to verify the status via some method other than SPI?

--==_Exmh_1460751389_2686P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Exmh version 2.5 07/13/2001

iQIVAwUBVxFMHAdmEQWDXROgAQKN0A//TCwy2X6XInQdItHM1Ayx4OYlsWgvdsaQ
j4nsIHJmuTtdsC7EL25Al+YbhaZC6Y+JEuBiKvSx8E3FKA0i438FEMwJLLY+llKz
XFG6Pz9gl0qUiEaBsYXjFHVXK3x6G0+gr5SCP6wGKuXuRrZx8lLI0vXS6mK27sBa
1YV+9izE7Lcz8qdCviNAqyJxHHePnI8Q7CNUITcHpiQa5gDAyUfOxpO794mj+WgD
QumPKtYdPk3OxEkBzG2FE0qGWjgqFiS1YiJkq2+fI7eOVs94dTHNi7etYzbc7qxV
86Hhu/qcgX/CKI7HwbCh2cJGo5WwJn5ZSiVtOqp3dFNcWSqkCsthuqvbMZXgEeHR
nmkvgotHCHcqLVCx6I2UqJGWufQwHipIu8qwmXcyTIQAaGBR3jGZx/IAIAmPVoY2
5rjOWu0lDlTMDeOWp9oykJtr60damivqik6UOVhchCJW02Y1jeVfW1k/mw2OC6ye
Eqw6gsxGAKKeiyG7X2LCdCzCLS0HLLq3uuHqmLkfv4x7GA/xTZzbv1DFv7Thti+v
NpQRUaz650P4Xi04s9u/My683PO5zWComkYIGLxTqNYLNeu4/v6xCkeCBz6Uypat
DnL0q4lli/IqzB3caDyO3Ugkh2QLN+wkFHQxfMZv6k/xjhX+EpqhFNYRAV5HPWLr
zwZYWMjPQdM=
=n/NK
-----END PGP SIGNATURE-----

--==_Exmh_1460751389_2686P--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
