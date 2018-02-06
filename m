From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 0/3] drm/panel: simple: Add mode support to devicetree
Date: Tue,  6 Feb 2018 11:56:19 -0500
Message-ID: <20180206165626.37692-1-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hey all,
Here's a set which allows us to add an "override" mode to the simple
panel dt node. The override mode can be used for devices for which the
typical display timing is not sufficient, yet the overriding mode should
not be applied across the entire platform. 

An example of this (and the motivation) is the Chromebook Plus (kevin).
If the sharp panel on this laptop is run at the mode advertised in the
datasheet (and what is currently in mainline), it creates interference
with the touch digitizer. To fix this, we need to run the pixel clock at
a slightly higher rate (which we can do by increasing the back porches).
This "fix" should not be used on other rockchip devices using this panel
since they might not encounter the same interference.

If an override mode is present, it will be checked against the panel's
display_timing range. When validated, it will be exposed as the
preferred mode along with the 'typical' modes generated from the panel's
display_timing.

This set is based on Linus' master to pick up the edp support in
rk3399-gru-kevin.dts.

Thanks,

Sean

Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stéphane Marchesin <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org



Sean Paul (3):
  drm/panel: simple: Add ability to override typical timing
  drm/panel: simple: Use display_timing for lq123p1jx31
  arm64: dts: rockchip: Specify override mode for kevin panel

 .../bindings/display/panel/simple-panel.txt        | 20 +++++
 arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts  | 14 ++++
 drivers/gpu/drm/panel/panel-simple.c               | 96 ++++++++++++++++++----
 3 files changed, 115 insertions(+), 15 deletions(-)

-- 
2.16.0.rc1.238.g530d649a79-goog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
