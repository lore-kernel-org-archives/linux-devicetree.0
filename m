From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 08/18] drm/sun4i: tcon: Add TRI finish interrupt for vblank
Date: Fri, 14 Jul 2017 11:57:54 +0800
Message-ID: <CAGb2v67yHqy1cGd6Op0KT7N+4Ew6j-jA+STYc5ZSm+8Z3ZDGhA@mail.gmail.com>
References: <cover.a5e7407c191c66e264164d017f64582039c56acb.1499955058.git-series.maxime.ripard@free-electrons.com>
 <8114707d8063d0c9e67694528925baf4f4ee2f7c.1499955058.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8114707d8063d0c9e67694528925baf4f4ee2f7c.1499955058.git-series.maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chen-Yu Tsai <wens@csie.org>, dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 13, 2017 at 10:13 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> The "CPU" (or Intel 8080) interface uses a different interrupt called
> TRI_FINISH (most likely TRI being for trigger) to notify the end of frames,
> and hence the VBLANK period.
>
> And that interrupt to the possible VBLANK interrupts source.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
