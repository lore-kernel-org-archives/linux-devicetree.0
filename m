From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 0/6] drm/panel: simple: Add mode support to devicetree
Date: Thu,  8 Feb 2018 12:48:47 -0500
Message-ID: <20180208174855.55620-1-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello!

Here's v3 of the set. I've reintroduced the single display timing node
in the dt binding from v1, and left the improved docs and patch split
from v2. I've also added a patch to clarify that a single display timing
node should always be named panel-timing, which was feedback from v1.

Cover letter from v1 (was the same in v2) is here:
https://lists.freedesktop.org/archives/dri-devel/2018-February/164886.html

Thanks for the reviews so far,

Sean


Sean Paul (6):
  dt-bindings: Clarify timing subnode use as panel-timing
  dt-bindings: Add headings to simple-panel bindings
  dt-bindings: Add panel-timing subnode to simple-panel
  drm/panel: simple: Add ability to override typical timing
  drm/panel: simple: Use display_timing for lq123p1jx31
  arm64: dts: rockchip: Specify override mode for kevin panel

 .../bindings/display/panel/display-timing.txt      |  5 ++
 .../bindings/display/panel/simple-panel.txt        | 34 ++++++++
 arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts  | 14 ++++
 drivers/gpu/drm/panel/panel-simple.c               | 94 ++++++++++++++++++----
 4 files changed, 132 insertions(+), 15 deletions(-)

-- 
2.16.0.rc1.238.g530d649a79-goog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
