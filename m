From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 0/6] Add clock support for Actions Semi S500 SoC
Date: Mon, 14 Jan 2019 13:55:10 -0800
Message-ID: <154750291027.169631.13825540584530234373@swboyd.mtv.corp.google.com>
References: <20181231185517.18517-1-manivannan.sadhasivam@linaro.org> <154724706468.169631.2903523518830581075@swboyd.mtv.corp.google.com> <20190114091850.GB13162@Mani-XPS-13-9360>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190114091850.GB13162@Mani-XPS-13-9360>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: afaerber@suse.de, mturquette@baylibre.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Manivannan Sadhasivam (2019-01-14 01:18:50)
> Hi Stephen,
>=20
> On Fri, Jan 11, 2019 at 02:51:04PM -0800, Stephen Boyd wrote:
> > Quoting Manivannan Sadhasivam (2018-12-31 10:55:11)
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
> > > Thanks,
> > > Mani
> > >=20
> > > Edgar Bernardi Righi (1):
> > >   dt-bindings: clock: Add DT bindings for Actions Semi S500 CMU
> > >=20
> > > Manivannan Sadhasivam (5):
> > >   clk: actions: Add configurable PLL delay
> > >   ARM: dts: Add CMU support for Actions Semi Owl S500 SoC
> > >   ARM: dts: Remove fake UART clock for S500 based SBCs
> > >   clk: actions: Add clock driver for S500 SoC
> > >   MAINTAINERS: Add linux-actions mailing list for Actions Semi
> >=20
> > What's the merge strategy for these patches? Some are for clk, others
> > are for arm-soc, etc. I see a sandwich of patches too so it sounds like
> > I can't even take just the clk ones for fear of breaking something that
> > the dts bits in the middle clear out of the way.
> >=20
>=20
> As we did with previous patchsets, clk patches will go through your tree
> and I'll take the ARM/MAINTAINERS patches through Actions sub-tree. Let's
> target these for 5.1. Even if your patches reach first, there won't be
> any regression with existing DTS.
>=20

Ok. I have just minor nits. Please resend and I will merge the clk
patches to clk tree.
