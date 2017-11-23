From: Jan Tuerk <jan.tuerk@emtrion.com>
Subject: [PATCH 1/5] drm/panel: Add support for the EDT ETM0700G0BDH6
Date: Thu, 23 Nov 2017 13:55:51 +0100
Message-ID: <20171123125600.41562-2-jan.tuerk@emtrion.com>
References: <20171123125600.41562-1-jan.tuerk@emtrion.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4274475661275783920=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171123125600.41562-1-jan.tuerk@emtrion.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Jan Tuerk <jan.tuerk@emtrion.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Kevin Hilman <khilman@baylibre.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, SZ Lin <sz.lin@moxa.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============4274475661275783920==
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

The Emerging Display Technology ETM0700G0BDH6 is exactly
the same display as the ETM0700G0DH6, exept the pixelclock
polarity. Therefore re-use the ETM0700G0DH6 modes. It is
used by default on emtrion Avari based development kits.

Signed-off-by: Jan Tuerk <jan.tuerk@emtrion.com>
---
 .../bindings/display/panel/edt,etm0700g0bdh6.txt          |  9 +++++++++
 drivers/gpu/drm/panel/panel-simple.c                      | 15 +++++++++++=
++++
 2 files changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/edt,etm=
0700g0bdh6.txt

diff --git a/Documentation/devicetree/bindings/display/panel/edt,etm0700g0b=
dh6.txt b/Documentation/devicetree/bindings/display/panel/edt,etm0700g0bdh6=
.txt
new file mode 100644
index 000000000000..099e30bfa17f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/edt,etm0700g0bdh6.txt
@@ -0,0 +1,9 @@
+Emerging Display Technology Corp. ETM0700G0BDH6 7.0" WVGA TFT LCD panel
+
+Required properties:
+       compatible: "edt,etm0700g0bdh6"
+
+This panel is exactly the same as ETM0700G0DH6 except the pixelclock polar=
ity.
+
+This binding is compatible with the simple-panel binding, which is specifi=
ed
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/p=
anel-simple.c
index b7c4709f7b34..42442034b53e 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -886,6 +886,18 @@ static const struct panel_desc edt_etm0700g0dh6 =3D {
        .bus_flags =3D DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_NEGEDGE,
 };

+static const struct panel_desc edt_etm0700g0bdh6 =3D {
+       .modes =3D &edt_etm0700g0dh6_mode,
+       .num_modes =3D 1,
+       .bpc =3D 6,
+       .size =3D {
+               .width =3D 152,
+               .height =3D 91,
+       },
+       .bus_format =3D MEDIA_BUS_FMT_RGB666_1X18,
+       .bus_flags =3D DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
+};
+
 static const struct drm_display_mode foxlink_fl500wvr00_a0t_mode =3D {
        .clock =3D 32260,
        .hdisplay =3D 800,
@@ -2029,6 +2041,9 @@ static const struct of_device_id platform_of_match[] =
=3D {
                .compatible =3D "edt,etm0700g0dh6",
                .data =3D &edt_etm0700g0dh6,
        }, {
+               .compatible =3D "edt,etm0700g0bdh6",
+               .data =3D &edt_etm0700g0bdh6,
+       }, {
                .compatible =3D "foxlink,fl500wvr00-a0t",
                .data =3D &foxlink_fl500wvr00_a0t,
        }, {
--
2.11.0


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


--===============4274475661275783920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4274475661275783920==--
