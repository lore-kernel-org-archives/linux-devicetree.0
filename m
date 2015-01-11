From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 5/7] ARM: zynq: Enable pinctrl
Date: Sun, 11 Jan 2015 22:36:34 +0100
Message-ID: <CACRpkdam4x-cWjrDuWS-0oDD3eGq1_pD3bK6xWEffiOipfBcOg@mail.gmail.com>
References: <1420818231-13451-1-git-send-email-soren.brinkmann@xilinx.com>
	<1420818231-13451-6-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1420818231-13451-6-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-sh-owner@vger.kernel.org
To: Soren Brinkmann <soren.brinkmann@xilinx.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Alessandro Rubini <rubini@unipv.it>, Heiko Stuebner <heiko@sntech.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Beniamino Galvani <b.galvani@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 9, 2015 at 4:43 PM, Soren Brinkmann
<soren.brinkmann@xilinx.com> wrote:

> Select pinctrl and the Zynq pinctrl driver.
>
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> Tested-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
> Changes since RFC v2:
>  - separate mach-zynq changes in their own patch

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Since we're only selecting some symbols and these will appear
in the merge window this can be applied orthogonally in the Zynq
tree target for ARM SoC.

Yours,
Linus Walleij
