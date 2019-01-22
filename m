From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 0/6] ARM: dts: bcm283x: Several DTS improvements
Date: Tue, 22 Jan 2019 08:57:28 +0100
Message-ID: <30ff2336-3839-e005-d298-d0df5f09411b@i2se.com>
References: <1547297008-2740-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1547297008-2740-1-git-send-email-stefan.wahren@i2se.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Eric Anholt <eric@anholt.net>
Cc: Gottfried Haider <gottfried.haider@gmail.com>, devicetree@vger.kernel.org, Phil Elwell <phil@raspberrypi.org>, bcm-kernel-feedback-list@broadcom.com, Peter Robinson <pbrobinson@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am 12.01.19 um 13:43 schrieb Stefan Wahren:
> This series consists of fixes for DTC warnings and improvements of
> the GPIO labels. So this is nothing critical, but helpful
> in case CONFIG_GPIO_SYSFS is disabled.
>
> Stefan Wahren (6):
>   ARM: dts: bcm283x: Fix DTC warning for memory node
>   ARM: dts: bcm2835-rpi: Drop unnecessary #address-cells/#size-cells
>   ARM: dts: bcm2835: Fix labels for GPIO 0,1
>   ARM: dts: bcm2837-rpi-3-b: Use consistent label for HDMI hotplug
>   ARM: dts: bcm2837-rpi-3-b-plus: Clarify label for STATUS_LED
>   ARM: dts: bcm283x: Add missing GPIO line names
>
Applied to bcm2835-dt-next

Thanks for test and review
