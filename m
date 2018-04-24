From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Lack of suspend/resume/shutdown ordering between GPIO providers and
 consumers
Date: Tue, 24 Apr 2018 15:58:50 -0700
Message-ID: <dc0c15eb-3dab-f512-aed6-045528fcec2c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, dmitry.torokhov@gmail.com, jeffy.chen@rock-chips.com, enric.balletbo@collabora.com, josephl@nvidia.com, opendmb@gmail.com, rjw@rjwysocki.net
List-Id: devicetree@vger.kernel.org

Hi Linus, Rafael, all

Our GPIO controller driver: gpio-brcmstb.c has a shutdown callback which
gets invoked when the system is brought into poweroff aka S5. So far so
good, except that we also wish to use gpio_keys.c as a possible wake-up
source, so we may have a number of GPIO pins declared as gpio-keys that
allow the system to wake-up from deep slumber.

Recently we noticed that we could easily get into a state where
gpio-brcmstb.c::brcmstb_gpio_shutdown() gets called first, and then
gpio_keys.c::gpio_keys_suspend() gets called later, which is too late to
have the enable_irq_wake() call do anything sensible since we have
suspend its parent interrupt controller before. This is completely
expected unfortunately because these two drivers are both platform
device instances with no connection to one another except via Device
Tree and the use of the GPIOLIB APIs.

First solution is to make sure that gpio-keys nodes are declared in
Device Tree *before* the GPIO controller. This works because Device Tree
nodes are probed in the order in which they are declared in Device Tree
and that directly influences the order in which platform devices are
created. Problem with that is that this is easy to miss and it may not
work with overlays, kexec reconstructing DT etc. etc.

Another possible solution would be have the GPIO controller nodes have
the GPIO consumers nodes such as gpio-keys, gpio-leds etc., and that
would allow the Linux device driver model to create an appropriate
child/parent relationship. This would unfortunately require Device Tree
changes everywhere to make that consistent, and it would be a special
case, because not all GPIO consumers are eligible as child nodes of
their parent GPIO controller, there are plenty of other consumers that
are not suitable for being moved under a parent GPIO controller node.
This would also mean that we need to "probe" GPIO controller nodes to
populate their child nodes (e.g: of_platform_bus_populate).

I am thinking a more generic solution might involve some more complex
tracking of the provider <-> consumer, but there is room for breakage.

Do you have any idea how to best solve that?

Thanks!
-- 
Florian
