From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: rockchip: fix Theobroma-System board bindings
Date: Tue, 17 Sep 2019 09:16:49 -0500
Message-ID: <CAL_Jsq+OkHMEzx3goQoUt9xvfuGLbu4v7VD5y6wqrNYp96-z7g@mail.gmail.com>
References: <20190917083453.25744-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917083453.25744-1-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Christoph Muellner <christoph.muellner@theobroma-systems.com>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 17, 2019 at 3:35 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> The naming convention for the existing Theobroma boards is
> soc-q7module-baseboard, so rk3399-puma-haikou and the in-kernel
> devicetrees also follow that scheme.
>
> For some reason in the binding a wrong or outdated naming slipped
> in which does not match the used devicetrees and makes the dt-schema
> complain now.
>
> Fix this by using the names used in the wild by actual boards.

Perhaps a Fixes tag.

> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
