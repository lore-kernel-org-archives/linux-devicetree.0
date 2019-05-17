From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: Add vendor prefix for HopeRun
Date: Fri, 17 May 2019 08:38:14 -0500
Message-ID: <CAL_JsqJCJyRBX+08UriNeYZ01ow0yLv=VjK3sNbjVi1GB5=MQA@mail.gmail.com>
References: <1558085189-22061-1-git-send-email-fabrizio.castro@bp.renesas.com> <1558085189-22061-2-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558085189-22061-2-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Thierry Reding <treding@nvidia.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Kevin Hilman <khilman@baylibre.com>, Jagan Teki <jagan@amarulasolutions.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
List-Id: devicetree@vger.kernel.org

On Fri, May 17, 2019 at 4:27 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
>
> Add "Jiangsu HopeRun Software Co., Ltd." to the list of devicetree
> vendor prefixes as "hoperun".
>
> Website: http://www.hoperun.com/en
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
>
> ---
> v2->v3:
> * Moved to vendor-prefixes.yaml
> * Dropped Reviewed-by Simon as this is a completely new patch and as
>   such it needs a brand new review
> v1->v2:
> * No change
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
