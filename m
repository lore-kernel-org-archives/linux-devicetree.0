From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: imx8mn: Fix tab indentation for yaml file
Date: Wed, 07 Aug 2019 16:59:22 -0700
Message-ID: <20190807235923.9D714217D9@mail.kernel.org>
References: <20190725020551.27034-1-Anson.Huang@nxp.com> <20190725210619.5EB94218D4@mail.kernel.org> <CAL_JsqKZHG-y_cKitU0=EksgyVU-YLOi1gAcFXx4ve21CMki1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKZHG-y_cKitU0=EksgyVU-YLOi1gAcFXx4ve21CMki1g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Anson Huang <Anson.Huang@nxp.com>, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <Linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Quoting Rob Herring (2019-07-25 14:37:24)
> On Thu, Jul 25, 2019 at 3:06 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Anson.Huang@nxp.com (2019-07-24 19:05:51)
> > > From: Anson Huang <Anson.Huang@nxp.com>
> > >
> > > YAML file can NOT contain tab as indentation, fix it.
> > >
> >
> > Would be nice if checkpatch could check for this.
>=20
> Would be nice if folks just ran 'make dt_binding_check'. :) It
> wouldn't be hard to add a tab check to checkpatch, but that's just one
> potential problem.
>=20

Cool, thanks for the pointer. Seems I forgot :)

Here's a patch to improve the documentation and make help to answer
questions I had about how to work this into my workflow.

diff --git a/Documentation/devicetree/writing-schema.md b/Documentation/dev=
icetree/writing-schema.md
index dc032db36262..17ad67887fde 100644
--- a/Documentation/devicetree/writing-schema.md
+++ b/Documentation/devicetree/writing-schema.md
@@ -120,6 +120,7 @@ This will first run the `dt_binding_check` which genera=
tes the processed schema.
 It is also possible to run checks with a single schema file by setting the
 'DT_SCHEMA_FILES' variable to a specific schema file.
=20
+`make dt_binding_check DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings=
/trivial-devices.yaml`
 `make dtbs_check DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/trivi=
al-devices.yaml`
=20
=20
diff --git a/Makefile b/Makefile
index 9be5834073f8..96bb28aa1c46 100644
--- a/Makefile
+++ b/Makefile
@@ -1503,8 +1503,10 @@ help:
 	@echo  ''
 	@$(if $(dtstree), \
 		echo 'Devicetree:'; \
-		echo '* dtbs            - Build device tree blobs for enabled boards'; \
-		echo '  dtbs_install    - Install dtbs to $(INSTALL_DTBS_PATH)'; \
+		echo '* dtbs             - Build device tree blobs for enabled boards'; \
+		echo '  dtbs_install     - Install dtbs to $(INSTALL_DTBS_PATH)'; \
+		echo '  dt_binding_check - Validate device tree binding documents'; \
+		echo '  dtbs_check       - Validate device tree source files'; \
 		echo '')
=20
 	@echo 'Userspace tools targets:'
