From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v3 0/4] Improve VCHIQ cache line size handling
Date: Mon, 17 Sep 2018 13:39:12 +0200
Message-ID: <f1e38c0c-0702-5df2-7f7c-40bbb93115b2@i2se.com>
References: <1537172544-104852-1-git-send-email-phil@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1537172544-104852-1-git-send-email-phil@raspberrypi.org>
Content-Language: de-DE
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Phil Elwell <phil@raspberrypi.org>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, devel@driverdev.osuosl.org
List-Id: devicetree@vger.kernel.org

Hi Phil,

Am 17.09.2018 um 10:22 schrieb Phil Elwell:
> Both sides of the VCHIQ communications mechanism need to agree on the cache
> line size. Using an incorrect value can lead to data corruption, but having the
> two sides using different values is usually worse.
>
> In the absence of an obvious convenient run-time method to determine the
> correct value in the ARCH=arm world, the downstream Raspberry Pi trees used a
> Device Tree property, written by the firmware, to configure the kernel driver.
> This method was vetoed during the upstreaming process, so a fixed value of 32
> was used instead, and some corruptions ensued. This is take 2 at arriving at
> the correct value.
>
> Add a new compatible string - "brcm,bcm2836-vchiq" - to indicate an SoC with
> a 64-byte cache line. Document the new string in the binding, and use it on
> the appropriate platforms.
>
> The final patch is a (seemingly cosmetic) correction of the Device Tree "reg"
> declaration for the device node, but it doubles as an indication to the
> Raspberry Pi firmware that the kernel driver is running a recent kernel driver
> that chooses the correct value. As such it would help if the DT patches are
> not merged before the driver patch.
>
> v3: Builds without errors, tested on multiple Raspberry Pi models.
> v2: Replaced ARM-specific logic used to determine cache line size with
>     a new compatible string for BCM2836 and BCM2837.
>
> Phil Elwell (4):
>   staging/vc04_services: Use correct cache line size
>   dt-bindings: soc: Document "brcm,bcm2836-vchiq"
>   ARM: dts: bcm283x: Correct vchiq compatible string
>   ARM: dts: bcm283x: Correct mailbox register sizes

since my pull requests are out, would it be okay to apply patch #1 for
4.20 and the DT stuff for 4.21 (with the assumption Rob is okay with
these patches)?
