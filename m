From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 0/2] More precise error reporting for of_get_named_gpio
Date: Fri, 29 Jun 2012 13:57:57 +0900
Message-ID: <1340945879-11712-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@stericsson.com>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

of_get_named_gpio is a very convenient way to get a GPIO from a device
tree. However it makes no difference between an invalid property or
the absence of it and returns -EINVAL in both cases.

Sometimes a GPIO property can be optional, and so far we need to use
a separate call to e.g. of_get_property. These two patches make it
possible to differenciate both cases by having
of_parse_phandle_with_args return -ENOENT instead of -EINVAL if the
requested property does not exist, and of_get_named_gpio_flags
propage the return value of of_parse_phandle_with_args instead of
invariably returning -EINVAL/

Alexandre Courbot (2):
  of: return -ENOENT when no property
  gpio: propagate of_parse_phandle_with_args errors

 drivers/gpio/gpiolib-of.c | 2 +-
 drivers/of/base.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.11.1
