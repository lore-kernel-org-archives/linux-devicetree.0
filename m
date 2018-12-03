From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 2/5] dt-bindings: media: sun6i: Add vcc-csi supply property
Date: Mon, 3 Dec 2018 18:11:35 +0800
Message-ID: <CAGb2v66pG0kes1_xBNUj4z85fjunjP_Fe5_pPiRja=nDSOS01A@mail.gmail.com>
References: <20181203100747.16442-1-jagan@amarulasolutions.com> <20181203100747.16442-3-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203100747.16442-3-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 3, 2018 at 6:08 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Most of the Allwinner A64 CSI controllers are supply with
> VCC-PE pin. which need to supply for some of the boards to
> trigger the power.
>
> So, document the supply property as vcc-csi so-that the required
> board can eable it via device tree.
>
> Used vcc-csi instead of vcc-pe to have better naming convention
> wrt other controller pin supplies.

This is not related to the CSI controller. It belongs in the pin
controller, but that has its own set of problems like possible
circular dependencies.

ChenYu
