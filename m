From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v4 09/15] arm64: dts: msm8996: thermal: Add interrupt support
Date: Fri, 20 Sep 2019 16:19:52 -0700
Message-ID: <5d855e99.1c69fb81.1d457.733b@mx.google.com>
References: <cover.1569015835.git.amit.kucheria@linaro.org> <f627e66c455f52b5662bef6526d7c72869808401.1569015835.git.amit.kucheria@linaro.org> <5d854c82.1c69fb81.66e1f.96ab@mx.google.com> <CAHLCerPqEK2sSGGtDj85DH+qCzgtWi4ainuQv8BgQ3-Dgi93BQ@mail.gmail.com> <5d854e1d.1c69fb81.4f771.9391@mx.google.com> <CAHLCerNqsf1j4vsOPjdav8+UtXtGP55k6_==jjg1QeZ1qCX1RA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHLCerNqsf1j4vsOPjdav8+UtXtGP55k6_==jjg1QeZ1qCX1RA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Brian Masney <masneyb@onstation.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Amit Kucheria (2019-09-20 15:14:58)
> On Fri, Sep 20, 2019 at 3:09 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Ok so the plan is to change DT and then change it back? That sounds
> > quite bad so please fix the thermal core to not care about this before
> > applying these changes so that we don't churn DT.
>=20
> Hi Stephen,
>=20
> Our emails crossed paths. I think we could just make the property
> optional so that we can remove the property completely for drivers
> that support interrupts. Comments?

OK. This means that the delay properties become irrelevant once an
interrupt is there? I guess that's OK. My concern is that we need to
choose one or the other when it would be simpler to have both and
fallback to the delays so that DT migration strategies are purely
additive. It's not like the delays aren't calculated to be those numbers
anymore. They're just not going to be used.

>=20
> That is a bigger change to the bindings and I don't want to hold the
> tsens interrupt support hostage to agreement on this.

Alright. I admit I haven't looked into the details but is it hard for
some reason to make it use interrupts before delays?
