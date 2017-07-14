From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 02/18] drm/sun4i: Add if statement instead of depends on
Date: Fri, 14 Jul 2017 11:09:07 +0800
Message-ID: <CAGb2v64KXCm1SzCz1hSkk1WOA03rju5_v_Q9XdF=cSs26Wz+Tw@mail.gmail.com>
References: <cover.a5e7407c191c66e264164d017f64582039c56acb.1499955058.git-series.maxime.ripard@free-electrons.com>
 <d51d45d57d2bacaa5bafcd861aa0142fcaf0ad77.1499955058.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d51d45d57d2bacaa5bafcd861aa0142fcaf0ad77.1499955058.git-series.maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chen-Yu Tsai <wens@csie.org>, dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 13, 2017 at 10:12 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> The depends on relationship is obvious, and using an if statement will
> propagate it to every option without the need for each and every one of
> them to define it.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
