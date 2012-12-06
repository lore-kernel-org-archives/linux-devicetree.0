From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Regulator suspend state dt question
Date: Thu, 6 Dec 2012 11:55:11 +0530
Message-ID: <CAM4voa=X_rBkSXRHd=oEOnXhgyfSAeD8LmYnsTeQtd-SYKWwPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, grant.likely@secretlab.ca, lrg@ti.com, broonie@opensource.wolfsonmicro.com
Cc: Doug Anderson <dianders@chromium.org>, Olof Johansson <olofj@google.com>, Thomas Abraham <thomas.abraham@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi,

Max77686 PMIC has dt support and I wanted to specify the suspend state of the
regulator via dt. set_suspend_disable and set_suspend_mode call-backs are
already implemented in drivers/regulator/max77686.c.

As of now there is no support in the regulator core to specify the suspend state
(mode, enabled/disabled) using dt. I can add new properties specifying
the intial_state,
mode, enable/disable but I am not too sure if it is appropriate to add
such bindings to
the device tree as they are not actually describing the hardware.

Is calling regulator_suspend_prepare from a machine specific file an option ?

Kindly provide me with suggestions as to how I may proceed with this.

Regards,
Abhilash
