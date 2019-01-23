From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 4/7] dt-bindings: sdm845-pinctrl: add wakeup interrupt parent for GPIO
Date: Wed, 23 Jan 2019 12:52:09 -0800
Message-ID: <154827672955.136743.8509585166504871320@swboyd.mtv.corp.google.com>
References: <20181219221105.3004-1-ilina@codeaurora.org> <20181219221105.3004-5-ilina@codeaurora.org> <20181229000714.GA3654@bogus> <20190107185113.GH14960@codeaurora.org> <CAL_Jsq+McuN5F9_a2bmECegR65vziNATpUqt4hysKL7FT=b9RA@mail.gmail.com> <20190109173111.GB22547@codeaurora.org> <CAL_JsqL1z-iOewqBeE43n1cVSGiQyOPHBGbRmEm9zcVLJkoLEA@mail.gmail.com> <154724884881.169631.9705938789464714812@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154724884881.169631.9705938789464714812@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>, Rob Herring <robh@kernel.org>
Cc: Evan Green <evgreen@chromium.org>, Marc Zyngier <marc.zyngier@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Stephen Boyd (2019-01-11 15:20:48)
> Quoting Rob Herring (2019-01-09 11:36:56)
> >=20
> > > >However, my main concern is documenting something genericish in a
> > > >device specific binding. It looks like Tegra is trying to add the sa=
me
> > > >thing, so this needs to be documented in a common place. One question
> > > >is whether wakeup is the only use or if this should be more generally
> > > >a secondary interrupt parent?
> > > >
> > > Yes, wakeup is the only use of this interrupt parent.
> >=20
> > Maybe for you, but I was wondering about this more generally. Should
> > we encode what the function (e.g. wakeup) is in the property name or
> > have something like aux-interrupt-controller? Maybe some platforms
> > have some need for a secondary interrupt-controller which is not
> > wakeup. Routing interrupts to other cores perhaps?
> >=20
>=20
> I'd say it's not the interrupt-parent, but a secondary-interrupt-parent,
> because it's another path that some GPIO interrupts will go through vs.
> the "normal" summary irq line that uses the interrupt-parent. Maybe
> that's similar to the interrupt partitioning that ARM is doing for PPIs
> that only go to some CPUs?
>=20
> We don't really specify that some GPIO is corresponding to the secondary
> or primary interrupt controller for the GPIO controller in DT. If we
> did, then we could do something like the interrupt-map binding and have
> the index of that property be the gpio number and the interrupt parent
> that it maps to (either summary from the GIC or MPM pin number).
>=20
>  interrupt-map =3D <0 0 &gic GIC_SPI 208 0>,
>                  <1 0 &pdc 3 0>;
>  interrupt-map-mask =3D <0xfffffff 0>;
>=20
> And then we would pass the 2-cell GPIO interrupt specifier (gpio# and
> flags) through the table and remap it to arbitrary domain parents. We
> could use this same design for the SSBI and SPMI gpio interrupt
> controller where we're currently looking at hardcoding the base
> interrupt number in the driver (0xc0) and then adding the GPIO number to
> that to get the parent interrupt specifier.
>=20
> It's sort of an abuse of interrupt-map, but I don't know if it really
> matters because there isn't a child of the gpio controller that is going
> to go through this table.
>=20

Rob, can you please respond?
