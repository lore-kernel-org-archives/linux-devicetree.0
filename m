From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: sdm845: Add UFS nodes for
 sdm845-mtp
Date: Wed, 21 Nov 2018 23:04:12 -0800
Message-ID: <20181122070412.GJ2225@minitux>
References: <20181026173544.136037-1-evgreen@chromium.org>
 <20181026173544.136037-5-evgreen@chromium.org>
 <154265514855.88331.12521366940818102477@swboyd.mtv.corp.google.com>
 <CAD=FV=WYhM2eJFdcum3aE2YhhhP9s=OzR=oRA2NXU4PFJc7Z5A@mail.gmail.com>
 <154265653027.88331.11231439952253219107@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <154265653027.88331.11231439952253219107@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Doug Anderson <dianders@chromium.org>, Andy Gross <andy.gross@linaro.org>, Evan Green <evgreen@chromium.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh@kernel.org>, cang@codeaurora.org, devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon 19 Nov 11:42 PST 2018, Stephen Boyd wrote:

> Quoting Doug Anderson (2018-11-19 11:25:08)
> > On Mon, Nov 19, 2018 at 11:19 AM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Evan Green (2018-10-26 10:35:43)
> > >
> > > > +};
> > > > +
> > > > +&ufsphy1 {
> > > > +       status = "okay";
> > > > +
> > > > +       vdda-phy-supply = <&vdda_ufs1_core>;
> > > > +       vdda-pll-supply = <&vdda_ufs1_1p2>;
> > >
> > > These two properties can be specified in the SoC dtsi file instead of
> > > each board variant file. This way we don't have to specify the things
> > > that are SoC independent in each board file. The board integrator just
> > > has to attach the labels to the right regulator nodes, in this case
> > > vdda_ufs1_core and vdda_ufs1_1p2, and then the sdm845.dtsi file will be
> > > matched up with the right regulator automatically. It's also nice so
> > > that board integrators don't have to know anything besides what
> > > regulator goes to what pin on the SoC.
> > 
> > This is an interesting proposal and it feels like we have to consider
> > the tradeoffs.
> > 
> > I agree that it would be nice not to have to specify this in every
> > single board .dts file, but at the same time what if you've got a
> > board that doesn't use UFS?  Such a board would bother adding the
> > labels "vdda_ufs1_core" and "vdda_ufs1_1p2".  This would lead to a
> > compile error in the device tree bindings.  That seems pretty
> > undesirable.
> > 
> 
> A workaround for this somewhat rare case would be to specify
> /delete-property/ on those nodes that aren't used. Unless that can't
> even work because the phandle is parsed before properties are deleted? I
> haven't tried. Or we could try to have dtc ignore broken phandles in
> status = "disabled" nodes or omit them entirely from the dtb so this
> isn't a problem.
> 
> Either way, I would push for making it easier for the users of the SoC
> to not need to know the SoC internal details too much and rely on the
> SoC dtsi file to get it right. From the user perspective it's just a
> bunch of pins connected to something. We could also have a 0 volt
> "ground" regulator for any grounded/unconnected pins if that helps. It
> could be marked as status = "disabled" so that no runtime code is used
> while dtc is still happy to have the disabled node with a label.
> 

I dislike the use of the labels "vdda_ufs1_core" as that doesn't tell me
which regulator this is actually wired to, without having to jump around
in the board dts file. It's annoying, but it's pretty much write-once so
it's not a big issue.

But I really don't like the idea of having sdm845.dtsi depend on labels
specified in the board dtsi. This just means that in order to add a new
board I need to figure out the information and the way to specify it is
to change a label in the board file.


The static configuration here is that vdda-phy-supply is connected to
the vdda_ufs1_core pin on the SoC, which is connected to some board
specific regulator.  If anything I think we should model that
intermediate entity, in which case we could move the link between the
phy and the pin to the platform dtsi.


But I'm fine with us just merging Evan's patch as is.

Regards,
Bjorn
