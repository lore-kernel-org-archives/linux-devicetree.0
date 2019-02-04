From: Jordan Crouse <jcrouse@codeaurora.org>
Subject: [PATCH v1 0/6] drm/msm: Improved a6xx GMU reset
Date: Mon,  4 Feb 2019 09:15:38 -0700
Message-ID: <1549296944-17285-1-git-send-email-jcrouse@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>, Sharat Masetty <smasetty@codeaurora.org>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>, Colin Ian King <colin.king@canonical.com>, devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>, Andy Gross <andy.gross@linaro.org>, Daniel Mack <daniel@zonque.org>, linux-kernel@vger.kernel.org, Mamta Shukla <mamtashukla555@gmail.com>, Jonathan Marek <jonathan@marek.ca>, Mark Rutland <mark.rutland@arm.com>, Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel@ffwll.ch>
List-Id: devicetree@vger.kernel.org

This is a stack of changes for 5.1 (if I'm not already too late). The bulk of
the changes implement a better GMU reset sequence using the new gpucc power
domain added in 5.0. If a GMU fault occurs during runtime we try to do a
standard GPU recovery and if the fault happens during GMU start then try to
fail somewhat gracefully than BUG_ON.

There will be a DT change to go along with this, but we can send that along
after the core code is merged. The downside for not having the domain
properly listed is that the runtime reset sequence probably won't work which
is no worse than it is today.

Jordan Crouse (6):
  drm/msm/a6xx: Remove unwanted regulator code
  dt-bindings: drm/msm/a6xx: Add GX power-domain for GMU bindings
  drm/msm/gpu: Attach to the GPU GX power domain
  drm/msm/a6xx: Make GMU reset useful
  msm/drm/a6xx: Turn off the GMU if resume fails
  drm/msm/a6xx: Remove an unused struct member

 .../devicetree/bindings/display/msm/gmu.txt        |  10 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 200 +++++++++++++--------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   9 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  20 +--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   3 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |   1 +
 6 files changed, 144 insertions(+), 99 deletions(-)

-- 
2.7.4
