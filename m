From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: Add Qualcomm USB SuperSpeed PHY bindings
Date: Fri, 06 Sep 2019 13:40:24 -0700
Message-ID: <5d72c439.1c69fb81.484c6.fe28@mx.google.com>
References: <5d694878.1c69fb81.5f13b.ec4f@mx.google.com> <5d696ad2.1c69fb81.977ea.39e5@mx.google.com> <f3584f38-dabc-7e7a-d1cb-84c80ed26215@linaro.org> <20190903173924.GB9754@jackp-linux.qualcomm.com> <5d6edee5.1c69fb81.a3896.1d05@mx.google.com> <20190903233410.GQ26807@tuxbook-pro> <c9481b7d-4805-25c6-f40f-9cbfc40afc93@linaro.org> <20190905175802.GA19599@jackp-linux.qualcomm.com> <5d71edf5.1c69fb81.1f307.fdd6@mx.google.com> <20190906182530.GD11938@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190906182530.GD11938@tuxbook-pro>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Jack Pham <jackp@codeaurora.org>, Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>, robh@kernel.org, andy.gross@linaro.org, shawn.guo@linaro.org, gregkh@linuxfoundation.org, mark.rutland@arm.com, kishon@ti.com, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, khasim.mohammed@linaro.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2019-09-06 11:25:30)
> On Thu 05 Sep 22:26 PDT 2019, Stephen Boyd wrote:
>=20
> >=20
> > Yes this looks like the approach that should be taken. One question
> > though, is this a micro-b connector or a type-c connector on the board?
> > I thought it was a type-c, so then this USB gpio based connection driver
> > isn't an exact fit?
> >=20
>=20
> For this particular case it's a type c connector, but the port
> controller is operated completely passively (and there's no PD or DP
> involved), so the GPIO based approach seems like a good fit.
>=20

OK. Perhaps the binding needs an update then to have another compatible
string indicating type-c connector that's not able to support PD or DP?
