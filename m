From: Mark Brown <broonie@kernel.org>
Subject: Re: ACPI vs DT at runtime
Date: Thu, 21 Nov 2013 19:40:22 +0000
Message-ID: <20131121194022.GA14725@sirena.org.uk>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail.com>
 <201311181605.37300.arnd@arndb.de>
 <20131121161037.C528CC406A3@trevor.secretlab.ca>
 <201311211926.03228.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0741165105179554560=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201311211926.03228.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Grant Likely <grant.likely@secretlab.ca>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============0741165105179554560==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 21, 2013 at 07:26:02PM +0100, Arnd Bergmann wrote:

> + A number of subsystems that Intel needs to handle on embedded systems
>   should really not be described in detail on servers on any architecture
>   but instead be handled in AML or SMBIOS (e.g. pinctrl or phy).

Are we 100% sure about this assumption?  We're saying "server" here but
how much of that is really "distro" - if it is distro then you start to
get things like laptops coming into play which do have a lot more of the
fun stuff that we see on embedded devices in active use.

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSjmGjAAoJELSic+t+oim9ugwQAJW/jOsXE9P8FAaC2E9FfgZI
B1W7AtQa4W5HcaHi8jfdo1JIa1FXgIBnEsNGjMHbOoSB485FfoQns88YERvN7/2b
xhhqWpNql7RO3tJqnogkiz27Nvcd8In0Mn/WFWlw1Vhv4bw18woFj3BKpwG7seCR
GxFPEbgwuSAl1BmLiL2aNMDEFw0BtvFkW+Yqhzy1bN/LtC9i1OSgMluc7C9Lctnv
4V3oT0vQ+5ItUk//Fztx9M94irjAgUnrAd/Y1gWgxP48PZd8bfqz67Wy30DwAAPx
ucxX465YXmdbwJPO1d78pyew5fNZ7kbFE3S0xKquhFw3e05oNFcuWWfb+yzlvxvy
1rMFe6JrCkdv/WQHr54vOdDgrv5CjDmDe/JA9xWSh0bt2tBPv85ayVcGz0JRsOjK
8AvoXUrEaXfleDAcQw5MvUkXWNui3EYML5ptKTFK56L2li7znsWjIOeBtlilyc7k
rf2kMpA8Qvu+UACU8qcEi5vlTiSK2yxJXFrHJSShSsAmLQThXzYvYjHaRhWSRkDH
7MoKhaO6pnS2xaUWMuZPkclROQ3fCXb/sR1pUDmHRYWb5jVQ9y82iKUu3ag12xxZ
sMDU4RGBEEA9BYmV+YfcjM3TLo1/fO/gLhufUAfmm04MfJib345hG3ygjwdjLhN1
U/5AvdPy3U12eiHtXdY9
=Ifzl
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--


--===============0741165105179554560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0741165105179554560==--
