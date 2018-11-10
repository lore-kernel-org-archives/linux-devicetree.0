From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v5 1/5] dt-bindings: phy-qcom-qmp: Fix register underspecification
Date: Fri, 09 Nov 2018 16:53:18 -0800
Message-ID: <154181119838.88331.10401425771645606506@swboyd.mtv.corp.google.com>
References: <20181026173544.136037-1-evgreen@chromium.org>
 <20181026173544.136037-2-evgreen@chromium.org>
 <154129921872.88331.15831802252403117971@swboyd.mtv.corp.google.com>
 <CAD=FV=UKfDsthT4W3H4jR0Qvw-izLShCjWngN2uBrY-FUEtDDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=UKfDsthT4W3H4jR0Qvw-izLShCjWngN2uBrY-FUEtDDQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, Evan Green <evgreen@chromium.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, cang@codeaurora.org, LKML <linux-kernel@vger.kernel.org>, Manu Gautam <mgautam@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Doug Anderson (2018-11-05 08:52:39)
> On Sat, Nov 3, 2018 at 7:40 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > > +                       clocks =3D <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
> > > +                       clock-names =3D "pipe0";
> > > +                       clock-output-names =3D "usb3_uni_phy_pipe_clk=
_src";
> >
> > If this has clock-output-names then I would expect to see a #clock-cells
> > property, but that isn't here in this node. Are we relying on the same
> > property in the parent node?
> =

> If I had to guess, I believe it's yet more confusing than that.  I
> believe you actually point to the parent phandle if you want to use
> the clock.  I notice that the parent has #clock-cells as 1 so
> presumably this is how you point to one child or the other?  ...but I
> don't think it's documented how this works.

There are 'clock-ranges', that almost nobody uses. It might be usable
for this purpose.

> The lane nodes don't have
> any sort of ID as far as I can tell.  ...and in any case having
> #clock-cells of 1 makes no sense for USB 3 PHYs which are supposed to
> only have one child?
> =

> Let's look at the code, maybe?  Hrm, phy_pipe_clk_register() takes no
> ID or anything.  Huh?  OK, so as far as I can tell
> of_clk_add_provider() is never called on this clock...
> =

> So I think the answer is that #clock-cells should be <0> and should
> move to the child node to match with clock-output-names.  Then I guess
> (if anyone references this clock from the device tree rather than
> relying on the global clock-output-names) we should add the
> of_clk_add_provider() into the code?
> =

> Maybe we can add that as a patch to the end of this series?  There are
> so many crazy / random things wrong with these bindings that it makes
> sense to make smaller / incremental changes?
> =


Sure that sounds fine. It would be another case where a driver would
want to call the proposed devm_of_clk_add_parent_provider() API.
