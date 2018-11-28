From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: sdm845: Add UFS nodes for sdm845-mtp
Date: Tue, 27 Nov 2018 18:31:19 -0800
Message-ID: <154337227974.88331.8681635395033693460@swboyd.mtv.corp.google.com>
References: <20181026173544.136037-1-evgreen@chromium.org>
 <20181026173544.136037-5-evgreen@chromium.org>
 <154265514855.88331.12521366940818102477@swboyd.mtv.corp.google.com>
 <CAD=FV=WYhM2eJFdcum3aE2YhhhP9s=OzR=oRA2NXU4PFJc7Z5A@mail.gmail.com>
 <154265653027.88331.11231439952253219107@swboyd.mtv.corp.google.com>
 <20181122070412.GJ2225@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181122070412.GJ2225@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>, Andy Gross <andy.gross@linaro.org>, Evan Green <evgreen@chromium.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh@kernel.org>, cang@codeaurora.org, devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2018-11-21 23:04:12)
> On Mon 19 Nov 11:42 PST 2018, Stephen Boyd wrote:
> > =

> > A workaround for this somewhat rare case would be to specify
> > /delete-property/ on those nodes that aren't used. Unless that can't
> > even work because the phandle is parsed before properties are deleted? I
> > haven't tried. Or we could try to have dtc ignore broken phandles in
> > status =3D "disabled" nodes or omit them entirely from the dtb so this
> > isn't a problem.
> > =

> > Either way, I would push for making it easier for the users of the SoC
> > to not need to know the SoC internal details too much and rely on the
> > SoC dtsi file to get it right. From the user perspective it's just a
> > bunch of pins connected to something. We could also have a 0 volt
> > "ground" regulator for any grounded/unconnected pins if that helps. It
> > could be marked as status =3D "disabled" so that no runtime code is used
> > while dtc is still happy to have the disabled node with a label.
> > =

> =

> I dislike the use of the labels "vdda_ufs1_core" as that doesn't tell me
> which regulator this is actually wired to, without having to jump around
> in the board dts file. It's annoying, but it's pretty much write-once so
> it's not a big issue.
> =

> But I really don't like the idea of having sdm845.dtsi depend on labels
> specified in the board dtsi. This just means that in order to add a new
> board I need to figure out the information and the way to specify it is
> to change a label in the board file.
> =

> =

> The static configuration here is that vdda-phy-supply is connected to
> the vdda_ufs1_core pin on the SoC, which is connected to some board
> specific regulator.  If anything I think we should model that
> intermediate entity, in which case we could move the link between the
> phy and the pin to the platform dtsi.
> =


Hmm alright. This is a similar problem that the DT connectors have with
phandle remapping through the connector to the actual phandle that is
desired. I can think of two solutions. One would be to make a
phandle-map binding to remap phandles within the soc node to actually be
another phandle. The downside is that we need to make nodes for
everything just to remap them. For example:


	soc {
		phandle-map {
			vdda_ufs1_core: vdda-ufs1-core {
			}
		};
	};

In the SoC dtsi file and then

	&vdda_ufs1_core {
		phandle-alias =3D <&pm8998_ldo19>
	};

Would be in the board specific dtsi file.

The regulator code to fix that up is rather simple, but not generic. It
just walks the chain of alias nodes until it doesn't find anything else.

diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regula=
tor.c
index 210fc20f7de7..9c1346374351 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -432,6 +432,15 @@ static int of_node_match(struct device *dev, const voi=
d *data)
 struct regulator_dev *of_find_regulator_by_node(struct device_node *np)
 {
 	struct device *dev;
+	struct device_node *aliased_np;
+
+	do {
+		aliased_np =3D of_parse_phandle(np, "phandle-alias", 0);
+
+		if (aliased_np)
+			np =3D aliased_np;
+
+	} while (aliased_np);
 =

 	dev =3D class_find_device(&regulator_class, NULL, np, of_node_match);
 =

Another idea would be to have a phandle nexus node that converts
phandles into some #cells property. This way, we can make the regulator
supply binding parse the cells of the nexus node and figure out that the
next specifier after it corresponds to something that needs to be set in
the nexus node by the board.

	soc {
		soc_regulator: regulator-nexus {
			#regulator-cells =3D <1>;
			#define VDDA_UFS1_CORE 0
		};

		ufs {
			vdda-supply =3D <&soc_regulator VDDA_UFS1_CORE>;

		};
	};

In the SoC dtsi file and then

	&soc_regulator {
		regulator-map =3D <VDDA_UFS1_CORE &pm8998_ldo19>
	}

And then some parsing code in regulator core to remap the cells on the
left side to the phandle on the right of the cells. I suppose that makes
things sort of awkward and makes the binding look different depending on
if the node has the #regulator-cells property or not for the supply
binding.

Another idea would be to have dts phandle fixups applied somehow when
the DT is loaded by the kernel or possibly bootloader or extra
efficiently with a compiler change. So then we can alias labels to
different labels in the board file.

So in the board dtsi file we would have something like

	soc {
		phandle-map {
			vdda-ufs1-core =3D <&pm8998_ldo19>;
		};
	};   =


and the SoC dtsi file would have:

	soc {
		phandle-map {
			vdda_ufs1_core: vdda-ufs1-core =3D <0>;
		};
	};

except I can't get this to compile right now because syntax errors.
