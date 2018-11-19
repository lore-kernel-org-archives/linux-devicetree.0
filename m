From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: sdm845: Add UFS nodes for sdm845-mtp
Date: Mon, 19 Nov 2018 11:42:10 -0800
Message-ID: <154265653027.88331.11231439952253219107@swboyd.mtv.corp.google.com>
References: <20181026173544.136037-1-evgreen@chromium.org>
 <20181026173544.136037-5-evgreen@chromium.org>
 <154265514855.88331.12521366940818102477@swboyd.mtv.corp.google.com>
 <CAD=FV=WYhM2eJFdcum3aE2YhhhP9s=OzR=oRA2NXU4PFJc7Z5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=WYhM2eJFdcum3aE2YhhhP9s=OzR=oRA2NXU4PFJc7Z5A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, Evan Green <evgreen@chromium.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh@kernel.org>, cang@codeaurora.org, devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: devicetree@vger.kernel.org

Quoting Doug Anderson (2018-11-19 11:25:08)
> On Mon, Nov 19, 2018 at 11:19 AM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Evan Green (2018-10-26 10:35:43)
> >
> > > +};
> > > +
> > > +&ufsphy1 {
> > > +       status =3D "okay";
> > > +
> > > +       vdda-phy-supply =3D <&vdda_ufs1_core>;
> > > +       vdda-pll-supply =3D <&vdda_ufs1_1p2>;
> >
> > These two properties can be specified in the SoC dtsi file instead of
> > each board variant file. This way we don't have to specify the things
> > that are SoC independent in each board file. The board integrator just
> > has to attach the labels to the right regulator nodes, in this case
> > vdda_ufs1_core and vdda_ufs1_1p2, and then the sdm845.dtsi file will be
> > matched up with the right regulator automatically. It's also nice so
> > that board integrators don't have to know anything besides what
> > regulator goes to what pin on the SoC.
> =

> This is an interesting proposal and it feels like we have to consider
> the tradeoffs.
> =

> I agree that it would be nice not to have to specify this in every
> single board .dts file, but at the same time what if you've got a
> board that doesn't use UFS?  Such a board would bother adding the
> labels "vdda_ufs1_core" and "vdda_ufs1_1p2".  This would lead to a
> compile error in the device tree bindings.  That seems pretty
> undesirable.
> =


A workaround for this somewhat rare case would be to specify
/delete-property/ on those nodes that aren't used. Unless that can't
even work because the phandle is parsed before properties are deleted? I
haven't tried. Or we could try to have dtc ignore broken phandles in
status =3D "disabled" nodes or omit them entirely from the dtb so this
isn't a problem.

Either way, I would push for making it easier for the users of the SoC
to not need to know the SoC internal details too much and rely on the
SoC dtsi file to get it right. From the user perspective it's just a
bunch of pins connected to something. We could also have a 0 volt
"ground" regulator for any grounded/unconnected pins if that helps. It
could be marked as status =3D "disabled" so that no runtime code is used
while dtc is still happy to have the disabled node with a label.
