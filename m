From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 0/3] driver for the hardware monitoring chip in the
 Zyxel NSA320
Date: Tue, 8 Mar 2016 03:55:06 -0800
Message-ID: <20160308115506.GA25899@roeck-us.net>
References: <1457192097-32538-1-git-send-email-linux@baker-net.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1457192097-32538-1-git-send-email-linux@baker-net.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Adam Baker <linux@baker-net.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jean Delvare <jdelvare@suse.com>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, lm-sensors@lm-sensors.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, carl.wolfgang@googlemail.com, Kumar Gala <galak@codeaurora.org>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 05, 2016 at 03:34:54PM +0000, Adam Baker wrote:
>  Documentation/devicetree/bindings/hwmon/nsa320-mcu.txt |  21 +++++
>  Documentation/hwmon/nsa320                             |  53 +++++++++++
>  arch/arm/boot/dts/kirkwood-nsa320.dts                  |  13 ++-
>  drivers/hwmon/Kconfig                                  |  15 +++
>  drivers/hwmon/Makefile                                 |   1 +
>  drivers/hwmon/nsa320-hwmon.c                           | 216 ++++++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 317 insertions(+), 2 deletions(-)
> 
Patch 1/3 and 2/3 applied to hwmon-next.

I assume that patch 3/3 will go through the arm tree.

Guenter
