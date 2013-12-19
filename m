From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v7 8/9] phy: add Broadcom Kona USB2 PHY driver
Date: Thu, 19 Dec 2013 08:33:56 -0600
Message-ID: <20131219143356.GE3985@saruman.home>
References: <1387309356-17195-1-git-send-email-mporter@linaro.org>
 <1387309356-17195-9-git-send-email-mporter@linaro.org>
 <20131218162554.GF4970@saruman.home> <52B288EF.1040006@ti.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0399340685960212466=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <52B288EF.1040006@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Kamil Debski <k.debski@samsung.com>, Linux USB List <linux-usb@vger.kernel.org>, Dinh Nguyen <dinh.linux@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tomasz Figa <t.figa@samsung.com>, Christian Daudt <bcm@fixthebug.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Kyungmin Park <kyungmin.park@samsung.com>, balbi@ti.com, Matt Porter <mporter@linaro.org>, Linaro Patches <patches@linaro.org>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Paul Zimmerman <paulz@synopsys.com>, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============0399340685960212466==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cYtjc4pxslFTELvY"
Content-Disposition: inline

--cYtjc4pxslFTELvY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Dec 19, 2013 at 11:19:35AM +0530, Kishon Vijay Abraham I wrote:
> On Wednesday 18 December 2013 09:55 PM, Felipe Balbi wrote:
> > On Tue, Dec 17, 2013 at 02:42:35PM -0500, Matt Porter wrote:
> >> Add a driver for the internal Broadcom Kona USB 2.0 PHY found
> >> on the BCM281xx family of SoCs.
> >>
> >> Signed-off-by: Matt Porter <mporter@linaro.org>
> >=20
> > Kishon, are you ok with this driver ?
>=20
> yeah. Since this patch touches phy/Kconfig (and Makefile) and there is
> one more PHY driver to be merged that also modifies Kconfig there
> might be conflicts. So thought I should be taking this patch?

this PHY driver depends on the new ->get_bus_width()/->set_bus_width()
methods which Matt just added. There's no easy way to make sure we avoid
conflicts and/or build errors.

--=20
balbi

--cYtjc4pxslFTELvY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSswPUAAoJEIaOsuA1yqREkt8QALXA7HOTH8JSV5YSOmlOFjuS
ItOPKBYbXUnZp0ekdzgXg6DZbtsPv91HL8++6rCQ0LmtEoNDseZzHsLAwZnjvX4K
KnEtc3uMVwsKOf4Kl0lq3Zy/Dv9GqFsBmC/fmpwakRekf7kPwp0f/SOVu9wEwr5q
sIkpeTVaP5GjvG04o6F66bQ8csmoGnR7lXyiBJdgSClMvNYQpTduk0v71x7nAU8k
P4R3GU0gHZuHRphQGQF2qaRfdcDtGhEBczNBwJlxAq5etBoQOdOKdEDnT/vKZZAt
3viGlaYak3E0udy1mF1io9dAqaPyWHSpEJVloc/oHiK26TV+oPRCLhumPXTT0+GQ
8T8c/hIvWorWmsRGvx7OeokTb0bYcThXL6kWU9hiGS5UXmhYKxls2ZP+VJ206hzh
mOf9mL6Fp85H/D94x3FjZluFX5ncONQY8b2KarDRB7TS/fTNG7PTrIdMQAiWP1qv
DjyZ8uFywIMkuKqSZdFNo4e4x9E0Bfg+r2iE9d9WVzAI/dqkTGgVpgZPuihOf1cJ
ERzNJAvnib9w8i6qXR7ji7sLYf7Qtabfzg+Jos6vIsDtPzgHSqrzZCbtSU4vMJSt
6KgNZxAfRIBNQS3bm6OjYMcVm/wwp/e+nwbsIphXeM9E+1o+3rhnjx9drOa3/JN0
rV4qbQdRoC09qIlR1+YL
=bap1
-----END PGP SIGNATURE-----

--cYtjc4pxslFTELvY--


--===============0399340685960212466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0399340685960212466==--
