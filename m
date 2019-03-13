From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/2] drm/meson: only allow using meson-canvas
Date: Wed, 13 Mar 2019 13:50:11 +0100
Message-ID: <375bb9db-50bb-000a-077b-6f090ae73039@baylibre.com>
References: <20190311105144.7276-1-mjourdan@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311105144.7276-1-mjourdan@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Jourdan <mjourdan@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

On 11/03/2019 11:51, Maxime Jourdan wrote:
> This patch series aims at removing access to the DMC register range from
> the meson DRM driver, and is the final step at fully migrating it to using
> the meson canvas provider module.
> 
> Please see the commit notes of patch 1/2
> "dt-bindings: display: amlogic, meson-vpu: exclusively use amlogic,canvas"
> for more information.
> 
> This series also incorporates a probing fix proposed by Neil Armstrong [1]
> although rewritten because of heavy code changes in the corresponding
> location.
> 
> [1] https://lkml.org/lkml/2019/2/4/152
> 
> Maxime Jourdan (2):
>   dt-bindings: display: amlogic, meson-vpu: exclusively use
>     amlogic,canvas
>   drm/meson: exclusively use the canvas provider module
> 
>  .../bindings/display/amlogic,meson-vpu.txt    |  5 +-
>  drivers/gpu/drm/meson/Makefile                |  2 +-
>  drivers/gpu/drm/meson/meson_canvas.c          | 73 ----------------
>  drivers/gpu/drm/meson/meson_canvas.h          | 51 -----------
>  drivers/gpu/drm/meson/meson_crtc.c            | 84 ++++++-------------
>  drivers/gpu/drm/meson/meson_drv.c             | 68 ++++++---------
>  drivers/gpu/drm/meson/meson_drv.h             |  1 -
>  drivers/gpu/drm/meson/meson_overlay.c         |  8 --
>  drivers/gpu/drm/meson/meson_plane.c           |  6 +-
>  drivers/gpu/drm/meson/meson_viu.c             |  1 -
>  10 files changed, 53 insertions(+), 246 deletions(-)
>  delete mode 100644 drivers/gpu/drm/meson/meson_canvas.c
>  delete mode 100644 drivers/gpu/drm/meson/meson_canvas.h
> 

Will apply on drm-misc-next for 5.2 when ready !

Neil
