From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: Add idk-1110wr binding
Date: Thu, 29 Aug 2019 08:44:28 -0500
Message-ID: <CAL_JsqLikohkWAq7exzCuGfg2yVE1Wx6h7GZFP8-jaL31PLpmA@mail.gmail.com>
References: <1567078713-29361-1-git-send-email-fabrizio.castro@bp.renesas.com> <1567078713-29361-2-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567078713-29361-2-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Sam Ravnborg <sam@ravnborg.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>x
List-Id: devicetree@vger.kernel.org

On Thu, Aug 29, 2019 at 6:38 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
>
> Add binding for the idk-1110wr LVDS panel from Advantech.
>
> Some panel-specific documentation can be found here:
> https://buy.advantech.eu/Displays/Embedded-LCD-Kits-LCD-Kit-Modules/model-IDK-1110WR-55WSA1E.htm
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
> v1->v2:
> * no change
>
>  .../display/panel/advantech,idk-1110wr.yaml        | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
