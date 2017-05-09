From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 6/7] dt-bindings: media: Add Renesas R-Car DRIF binding
Date: Tue, 9 May 2017 09:10:22 -0500
Message-ID: <CAL_JsqLm6zabizxiahnN-Yx0=JdMcXM1JXJiKjLaOhh69KwM2g@mail.gmail.com>
References: <20170509133738.16414-1-ramesh.shanmugasundaram@bp.renesas.com> <20170509133738.16414-7-ramesh.shanmugasundaram@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170509133738.16414-7-ramesh.shanmugasundaram@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, Antti Palosaari <crope@iki.fi>, Chris Paterson <chris.paterson2@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 9, 2017 at 8:37 AM, Ramesh Shanmugasundaram
<ramesh.shanmugasundaram@bp.renesas.com> wrote:
> Add binding documentation for Renesas R-Car Digital Radio Interface
> (DRIF) controller.
>
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
> ---
> v5:
>  - Addressed Rob's comments on v4:
>         - Formatted compatible string entries.
>         - Removed "status".
>         - Removed board and SoC specific bindings classification example.
>         - Removed pinctrl nodes.
> ---
>  .../devicetree/bindings/media/renesas,drif.txt     | 177 +++++++++++++++++++++
>  1 file changed, 177 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,drif.txt

Acked-by: Rob Herring <robh@kernel.org>
