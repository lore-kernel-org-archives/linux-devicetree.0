From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH v4 7/7] pinctrl: qcom-spmi-gpio: Migrate to
 pinconf-generic
Date: Mon, 12 Jan 2015 11:09:11 +0200
Message-ID: <1421053751.28652.9.camel@mm-sol.com>
References: <1420818231-13451-1-git-send-email-soren.brinkmann@xilinx.com>
	 <1420818231-13451-8-git-send-email-soren.brinkmann@xilinx.com>
	 <CACRpkdbDEcStJhabgKEm8H=z2umEr+bd-0oK4_HvCO+rz0pTXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbDEcStJhabgKEm8H=z2umEr+bd-0oK4_HvCO+rz0pTXQ@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Soren Brinkmann <soren.brinkmann@xilinx.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Alessandro Rubini <rubini@unipv.it>, Heiko Stuebner <heiko@sntech.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Beniamino Galvani <b.galvani@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


On Sun, 2015-01-11 at 22:40 +0100, Linus Walleij wrote:
> On Fri, Jan 9, 2015 at 4:43 PM, Soren Brinkmann
> brinkmann@xilinx.com> wrote:
>=20
> > Instead of the driver caring about implementation details like devi=
ce
> > tree, just provide information about driver specific pinconf parame=
ters
> > to pinconf-generic which takes care of parsing the DT.
> >=20
> > Signed-off-by: Soren Brinkmann brinkmann@xilinx.com>
>=20
> Patch applied: qualcomm folks, can you make sure that the Qualcomm
> stuff is still working as expected with S=C3=B6ren's core parser?
>=20

Yep, it still works. Tested on pm8941 and pma8084. Thanks.

Tested-by: Ivan T. Ivanov <iivanov@mm-sol.com>
