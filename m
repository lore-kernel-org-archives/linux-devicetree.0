From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH 0/4] pinctrl-msm: Fixes for various issues
Date: Sat, 14 Dec 2013 23:01:50 -0800
Message-ID: <1387090914-4755-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Various fixes based on feedback from Stephen Boyd and kbuild test robot

Bjorn Andersson (4):
  pinctrl-msm: Fix spelling misstakes and missing consts
  pinctrl-msm: Tidy up error handling
  pinctrl-msm: Remove separate allocation of bitmaps
  pinctrl-msm: Rename compatible to be more specific

 ...sm8x74-pinctrl.txt => qcom,msm8974-pinctrl.txt} |    4 +-
 drivers/pinctrl/pinctrl-msm.c                      |  122 ++++++--------------
 drivers/pinctrl/pinctrl-msm8x74.c                  |    6 +-
 3 files changed, 43 insertions(+), 89 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{qcom,msm8x74-pinctrl.txt => qcom,msm8974-pinctrl.txt} (97%)

-- 
1.7.9.5
