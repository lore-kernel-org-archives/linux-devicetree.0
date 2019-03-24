From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: media: Add Allwinner A10 CSI binding
Date: Sun, 24 Mar 2019 16:13:23 -0500
Message-ID: <CAL_JsqKiCZrf0BVwN-q6a2SgZVco3iKhm8qeoeJr_wrSwCFUzQ@mail.gmail.com>
References: <cover.2aba8cbd95630d87f927465cc2beb881936c83d9.1553010938.git-series.maxime.ripard@bootlin.com>
 <8b1291b572695e4baa67c144dd6deee0563b7586.1553010938.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8b1291b572695e4baa67c144dd6deee0563b7586.1553010938.git-series.maxime.ripard@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 19, 2019 at 10:56 AM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
>
> The Allwinner A10 CMOS Sensor Interface is a camera capture interface also
> used in later (A10s, A13, A20, R8 and GR8) SoCs.
>
> On some SoCs, like the A10, there's multiple instances of that controller,
> with one instance supporting more channels and having an ISP.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
