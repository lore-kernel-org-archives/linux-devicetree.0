From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 2/2] dt-bindings: arm: renesas: Add HopeRun RZ/G2[M]
 boards
Date: Mon, 20 May 2019 13:48:37 +0200
Message-ID: <20190520114837.47bslbglanvidthx@verge.net.au>
References: <1558085189-22061-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1558085189-22061-3-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1558085189-22061-3-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Thierry Reding <treding@nvidia.com>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Kevin Hilman <khilman@baylibre.com>, Jagan Teki <jagan@amarulasolutions.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
List-Id: devicetree@vger.kernel.org

On Fri, May 17, 2019 at 10:26:29AM +0100, Fabrizio Castro wrote:
> This patch adds board HiHope RZ/G2M (the main board, powered by
> the R8A774A1) and board HiHope RZ/G2 EX (the expansion board
> that sits on top of the HiHope RZ/G2M). Both boards are made
> by Jiangsu HopeRun Software Co., Ltd. (a.k.a. HopeRun).
> 
> Useful links:
> http://hihope.org/product/detail/rzg2
> https://item.taobao.com/item.htm?spm=a2oq0.12575281.0.0.6bcf1debQpzkRS&ft=t&id=592177498472
> http://www.hoperun.com/Cn/news/id/379
> 
> We already know that the HiHope RZ/G2 EX will also sit on the
> HiHope RZ/G2N, even though the HiHope RZ/G2N doesn't exist just
> yet.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks Fabrizio,

applied for inclusion in v5.3.
