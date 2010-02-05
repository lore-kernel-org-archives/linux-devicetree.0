From: Anton Vorontsov <avorontsov@ru.mvista.com>
Subject: [PATCH RFC 0/3] Implement refcounting for OF GPIO chips
Date: Fri, 5 Feb 2010 23:49:49 +0300
Message-ID: <20100205204949.GA2575@oksana.dev.rtsoft.ru>
Reply-To: avorontsov@ru.mvista.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>, David Brownell <dbrownell@users.sourceforge.net>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, David Miller <davem@davemloft.net>, Michal Simek <monstr@monstr.eu>, linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, microblaze-uclinux@itee.uq.edu.au
List-Id: devicetree@vger.kernel.org

Hi all,

OF GPIO infrastructure is using dynamic GPIO bases, so it is possible
that of_get_gpio()'s returned GPIO number will be no longer valid, or
worse, it may point to an unexpected GPIO controller.

This scenario is possible:

driver A:               driver B:              driver C:
---------               ---------              ---------
                        gpiochip_add()
gpio = of_get_gpio()
                        gpiochip_remove()
                                               gpiochip_add()
gpio_request(gpio);
gpio_set_value(gpio);

That is, driver A assumes that it is working with GPIO from driver B,
but in practice it may disappear and driver C will take its GPIO base
number, so it will provide the same GPIO numbers.

The above situation is hard to trigger, but the issue is there
nonetheless, and so needs fixing.

Thanks,

p.s. The patches are based on top of
     '[PATCH v2 0/4] OF GPIO integration for I2C/SPI GPIO chips'
     http://lkml.org/lkml/2010/2/5/243

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
