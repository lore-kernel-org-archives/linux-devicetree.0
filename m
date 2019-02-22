From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 0/6] Add clock support for Actions Semi S500 SoC
Date: Fri, 22 Feb 2019 00:02:41 -0800
Message-ID: <155082256184.77512.7380378442221286861@swboyd.mtv.corp.google.com>
References: <20190115033340.25016-1-manivannan.sadhasivam@linaro.org> <20190201035343.GB4283@Mani-XPS-13-9360> <20190216041541.GB3054@Mani-XPS-13-9360>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190216041541.GB3054@Mani-XPS-13-9360>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mturquette@baylibre.com, afaerber@suse.de, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Manivannan Sadhasivam (2019-02-15 20:15:41)
> Hi Stephen,
>=20
> On Fri, Feb 01, 2019 at 09:23:43AM +0530, Manivannan Sadhasivam wrote:
> > Hi Stephen,
> >=20
> > On Tue, Jan 15, 2019 at 09:03:34AM +0530, Manivannan Sadhasivam wrote:
> > > Hello,
> > >=20
> > > This patchset adds common clock support for Actions Semi S500 SoC of
> > > the Owl family SoCs. This series is based on the initial work done
> > > by Edgar Bernardi Righi. https://patchwork.kernel.org/cover/10587527/
> > >=20
> > > Since there isn't any update from him for long time, I took the liber=
ty
> > > to modify his patches, address review comments and send to list for r=
eview.
> > >=20
> > > This series has been tested on Allo Sparky SBC.
> > >=20
> >=20
> > Can you please merge the clk patches so that I can take the DT bits thr=
ough
> > Actions sub-tree?
> >=20
>=20
> Any update on this patchset?
>=20

Merged the three clk and binding patches into clk-next.
