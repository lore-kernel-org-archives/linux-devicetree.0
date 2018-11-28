From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-mtp: Mark protected gcc clocks
Date: Tue, 27 Nov 2018 22:33:33 -0800
Message-ID: <154338681330.88331.11964099120255315856@swboyd.mtv.corp.google.com>
References: <20181106055013.11271-1-bjorn.andersson@linaro.org>
 <154279089454.88331.1059903104788594574@swboyd.mtv.corp.google.com>
 <20181122073043.GN2225@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181122073043.GN2225@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2018-11-21 23:30:43)
> On Wed 21 Nov 01:01 PST 2018, Stephen Boyd wrote:
> =

> > Quoting Bjorn Andersson (2018-11-05 21:50:13)
> > > As of v4.20-rc1 probing the GCC driver on a SDM845 device with the
> > > standard security implementation causes an access violation and an
> > > immediate system restart. Use the protected-clocks property to mark t=
he
> > > offending clocks protected for the MTP, in order to allow it to boot.
> > > =

> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > > =

> > > This depends on the acceptance of
> > > https://lore.kernel.org/lkml/20181105194011.43770-1-swboyd@chromium.o=
rg/
> > =

> > Do you need me to merge this into clk-fixes so that Andy can send this
> > up for v4.20 final? I thought you may have other boot blocking issues so
> > this wouldn't be a critical fix.
> > =

> =

> We resolved the gpio-related issues, so iirc this is the only other item
> preventing the MTP from booting. So yes please.
> =

> Unless you enable USB support, because configuring the first USB
> controller in host currently crashes the device - I've not yet found the
> cause for this though.
> =


Ok let me do the necessary shuffling to get this all lined up for
merging later this week, including this dts patch.
