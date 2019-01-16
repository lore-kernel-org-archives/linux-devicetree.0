From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: sdm845: Expand soc bus address range
Date: Wed, 16 Jan 2019 15:02:39 -0800
Message-ID: <154767975942.169631.1254649555789319450@swboyd.mtv.corp.google.com>
References: <20190116071939.23136-1-bjorn.andersson@linaro.org> <154767410807.169631.11634052870112778681@swboyd.mtv.corp.google.com> <20190116221003.GW9278@minitux> <154767899836.169631.10485468432153568181@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154767899836.169631.10485468432153568181@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

Quoting Stephen Boyd (2019-01-16 14:49:58)
> > >=20
> > > Do we need #size-cells =3D <2>? Maybe it could be #size-cells =3D <1>=
 and we
> > > can avoid having to specify a second size entry that's always going to
> > > be 0 because we don't have devices with huge IO regions in the SoC. Or
> > > does it need to be 2 for the large size of the size element of
> > > dma-ranges and ranges here? Looking at the code I think we can rely on
> > > the size-cells of the parent node so I think it will work with size o=
f 1
> > > here.
> > >=20
> >=20
> > The "length" part of dma-ranges is described using #size-cells number of
> > cells, so with 1 there's no way we can describe this being 36 bits.
>=20
> Yes, but doesn't the #size-cells of the parent node (i.e. root node in
> this case) dictate the number of cells of the "length" part of the
> dma-ranges property here? I hope that we don't need to push down the
> larger size of 2 just for this reason, but I admit I haven't run the
> code to understand this all properly.
>=20

Ok, nevermind. I read the code more and looked at the spec and I'm just
talking nonsense on this point.
