From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 7/7] pinctrl: qcom-spmi-gpio: Migrate to pinconf-generic
Date: Sun, 11 Jan 2015 22:40:18 +0100
Message-ID: <CACRpkdbDEcStJhabgKEm8H=z2umEr+bd-0oK4_HvCO+rz0pTXQ@mail.gmail.com>
References: <1420818231-13451-1-git-send-email-soren.brinkmann@xilinx.com>
	<1420818231-13451-8-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1420818231-13451-8-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-sh-owner@vger.kernel.org
To: Soren Brinkmann <soren.brinkmann@xilinx.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Kumar Gala <galak@codeaurora.org>, "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Alessandro Rubini <rubini@unipv.it>, Heiko Stuebner <heiko@sntech.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Beniamino Galvani <b.galvani@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 9, 2015 at 4:43 PM, Soren Brinkmann
<soren.brinkmann@xilinx.com> wrote:

> Instead of the driver caring about implementation details like device
> tree, just provide information about driver specific pinconf paramete=
rs
> to pinconf-generic which takes care of parsing the DT.
>
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>

Patch applied: qualcomm folks, can you make sure that the Qualcomm
stuff is still working as expected with S=C3=B6ren's core parser?

Yours,
Linus Walleij
