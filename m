From: Jan Tuerk <jan.tuerk@emtrion.com>
Subject: [PATCH 0/5] Add basic support for emtrion emCON-MX6 modules
Date: Thu, 23 Nov 2017 13:55:50 +0100
Message-ID: <20171123125600.41562-1-jan.tuerk@emtrion.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7517368367497376453=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Jan Tuerk <jan.tuerk@emtrion.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Kevin Hilman <khilman@baylibre.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, SZ Lin <sz.lin@moxa.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============7517368367497376453==
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

The following patch-series adds support for emtrion's emCON-MX6 modules
with all their dependencies. The focus is based on the emtion standard
developer-kit configuration. It includes a new vendor-prefix,
an new simple-panel type, a small modification of the imx6dl.dtsi,
as well as modifications of the common imx_v6_v8_defconfig.
And finally the board devicetrees themselves.


emtrion GmbH
Kreativpark - Alter Schlachthof 45
76131 Karlsruhe
GERMANY
http://www.emtrion.de
_______________________________________

Amtsgericht Mannheim
HRB 110 300
Gesch=E4ftsf=FChrer: Dieter Baur, Ramona Maurer
_______________________________________


--===============7517368367497376453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7517368367497376453==--
