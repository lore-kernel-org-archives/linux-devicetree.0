From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 03/11] drm/bridge: analogix-anx78xx: silence -EPROBE_DEFER
 warnings
Date: Thu, 15 Aug 2019 10:35:10 +0200
Message-ID: <CACRpkdbCwUbn68trGZTN8pe8rF8x6SeAW1gd7bwFTs3z-6vK=A@mail.gmail.com>
References: <20190815004854.19860-1-masneyb@onstation.org>
 <20190815004854.19860-4-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190815004854.19860-4-masneyb@onstation.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Brian Masney <masneyb@onstation.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>, Neil Armstrong <narmstrong@baylibre.com>, Dave Airlie <airlied@linux.ie>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Andy Gross <agross@kernel.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>, Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel@ffwll.ch>, MSM <linux-arm-msm@vger.kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>, Linux ARM <linux-arm-kernel@lists.infradea>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 15, 2019 at 2:49 AM Brian Masney <masneyb@onstation.org> wrote:

> Silence two warning messages that occur due to -EPROBE_DEFER errors to
> help cleanup the system boot log.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
