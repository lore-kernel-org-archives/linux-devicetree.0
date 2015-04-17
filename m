From: Inha Song <ideal.song@samsung.com>
Subject: [PATCH 0/2] Add support for select accessory detect
 mode to HPDETL or HPDETR
Date: Fri, 17 Apr 2015 17:32:57 +0900
Message-ID: <1429259579-16563-1-git-send-email-ideal.song@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: lee.jones@linaro.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, patches@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, cw00.choi@samsung.com, broonie@kernel.org, ckeepax@opensource.wolfsonmicro.com, rf@opensource.wolfsonmicro.com, Inha Song <ideal.song@samsung.com>
List-Id: devicetree@vger.kernel.org

This set of patches adds support for select accessory detect mode to HPDETL or HPDETR.

Inha Song (2):
  extcon: arizona: Add support for select accessory detect mode when
    headphone detection"
  mfd: arizona: Update DT binding to support hpdet channel

 Documentation/devicetree/bindings/mfd/arizona.txt |  4 +++
 drivers/extcon/extcon-arizona.c                   | 34 ++++++++++++++++++++---
 include/linux/mfd/arizona/pdata.h                 |  3 ++
 3 files changed, 37 insertions(+), 4 deletions(-)

-- 
2.0.0.390.gcb682f8
