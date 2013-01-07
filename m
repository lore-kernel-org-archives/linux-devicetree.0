From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 3.9] Driver for 7-segment displays connected over GPIOs
Date: Mon,  7 Jan 2013 17:42:05 +0100
Message-ID: <1357576928-29133-1-git-send-email-thomas.petazzoni@free-electrons.com>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree-discuss@lists.ozlabs.org, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Dear drivers/{char,misc}/ maintainers,

This patch series implements a simple driver for 7-segment displays
connected over GPIOs through a BCD encoder. The userspace interface of
the driver is very simple: just a "value" file in the sysfs directory
of the device, which can be written to (changes the value shown on the
7-segment display) and read (gives the current value).

This driver has been tested on Marvell Armada 370 and Marvell Armada
XP evaluation boards, but could potentially be used by anybody having
a 7-segment display controlled over GPIOs with a BCD encoder.

 * Patch 1 adds the driver itself, together with the Device Tree
   binding documentation.

 * Patch 2 and 3 add the necessary Device Tree information to use this
   driver on the Armada 370 and Armada XP evaluation boards.

Best regards,

Thomas
