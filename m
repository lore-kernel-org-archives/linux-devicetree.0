From: Rob Herring <robherring2@gmail.com>
Subject: [GIT PULL] DeviceTree fixes for 4.16
Date: Tue, 27 Feb 2018 20:45:12 -0600
Message-ID: <CAL_JsqLUrhpY9wngZkU2pFxM+eqXebQjLw4QDe=kE8KsTaSmSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull a couple of DT binding updates.

Rob

The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-4.16

for you to fetch changes up to d40ade43e3cd55c6d83859dffc0f9d428a954c63:

  dt-bindings: power: Fix "debounce-interval" property misspelling
(2018-02-18 21:05:43 -0600)

----------------------------------------------------------------
DeviceTree fixes for 4.16:

- Update i.MX thermal binding example to use current binding, not the
  deprecated one

- Move arm-charlcd to auxdisplay/

- Fix misspelling of "debounce-interval"

----------------------------------------------------------------
Andy Shevchenko (1):
      auxdisplay: Move arm-charlcd binding to correct folder

Dong Aisheng (1):
      dt-bindings: thermal: imx: update the binding to new method

Geert Uytterhoeven (1):
      dt-bindings: power: Fix "debounce-interval" property misspelling

 .../bindings/{misc => auxdisplay}/arm-charlcd.txt  |  0
 .../devicetree/bindings/power/wakeup-source.txt    |  2 +-
 .../devicetree/bindings/thermal/imx-thermal.txt    | 25 ++++++++++++++++++++++
 3 files changed, 26 insertions(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{misc =>
auxdisplay}/arm-charlcd.txt (100%)
