From: Martin Fuzzey <mfuzzey@parkeon.com>
Subject: [PATCH  0/2] gpio: Allow userspace export from DT
Date: Mon, 13 Apr 2015 13:05:15 +0200
Message-ID: <20150413110515.9681.58848.stgit@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Currently the gpio sysfs interface allows userspace to access simple hardware
where no kernel driver exists or would be useful.

However it requires userspace to know the gpio number that has been assigned
by the kernel.

That number, in the case of gpio drviers using dynamic allocation, is not fixed,
and may change when:
* The kernel version changes and ARCH_NR_GPIOS is changed (happened in 3.17)
* The kernel version changes and probe order changes for gpio chips.
* The kernel configuration is changed if CONFIG_ARCH_NR_GPIO is used
* The board is redesigned (eg switching an externally visible signal from a
SoC provided GPIO to an I2C expander chip or vice versa).
* Other GPIO chips are added to the system.

The above means that, in order to export the GPIO to userspace via
/sys/class/gpio/export the userspace code must know the exact hardware and
kernel version information.

Furthermore, in many cases, it makes no sense to allow userspace to change the
signal direction; even if the GPIO itself allows it the circuitry connected
to the pin often does not (eg a signal dedicated to an output function driving
a  transistor).

This patch series solves both problems by performing the external
signal => GPIO mapping in the device tree.
