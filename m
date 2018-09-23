From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v3 1/4] staging/vc04_services: Use correct cache line size
Date: Sun, 23 Sep 2018 17:24:50 +0200 (CEST)
Message-ID: <1660239654.224490.1537716290663@email.1und1.de>
References: <1537172544-104852-1-git-send-email-phil@raspberrypi.org>
 <1537172544-104852-2-git-send-email-phil@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1537172544-104852-2-git-send-email-phil@raspberrypi.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Phil Elwell <phil@raspberrypi.org>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> Phil Elwell <phil@raspberrypi.org> hat am 17. September 2018 um 10:22 geschrieben:
> 
> 
> Use the compatible string in the DTB to select the correct cache line
> size for the SoC - 32 for BCM2835, and 64 for BCM2836 and BCM2837.
> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.org>

Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
