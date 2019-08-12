From: Maxime Jourdan <mjourdan@baylibre.com>
Subject: Re: [PATCH v3 3/3] MAINTAINERS: Update with Amlogic DRM bindings
 converted as YAML
Date: Mon, 12 Aug 2019 18:31:05 +0200
Message-ID: <CAMO6naxDkpjLTaByYBhkgP6i1YE1F1ATBAp8gPuVjDy9DAUM7g@mail.gmail.com>
References: <20190808085522.21950-1-narmstrong@baylibre.com> <20190808085522.21950-4-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190808085522.21950-4-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 8, 2019 at 10:55 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The amlogic,meson-dw-hdmi.txt and amlogic,meson-vpu.txt has been
> converted to YAML schemas, update MAINTAINERS to match them again.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6426db5198f0..c55c18531cd1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5318,8 +5318,8 @@ L:        linux-amlogic@lists.infradead.org
>  W:     http://linux-meson.com/
>  S:     Supported
>  F:     drivers/gpu/drm/meson/
> -F:     Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
> -F:     Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
> +F:     Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
> +F:     Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>  F:     Documentation/gpu/meson.rst
>  T:     git git://anongit.freedesktop.org/drm/drm-misc
>
> --
> 2.22.0
>

Reviewed-by: Maxime Jourdan <mjourdan@baylibre.com>
