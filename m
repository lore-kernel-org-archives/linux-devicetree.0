From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v3 0/4] Improve VCHIQ cache line size handling
Date: Tue, 6 Nov 2018 19:20:45 +0100 (CET)
Message-ID: <644039949.222891.1541528445168@email.ionos.de>
References: <1537172544-104852-1-git-send-email-phil@raspberrypi.org>
 <f1e38c0c-0702-5df2-7f7c-40bbb93115b2@i2se.com>
 <1ffe9824-d254-6dfb-7bd6-e146d6c9eada@raspberrypi.org>
 <13b74c54-d115-8ff1-3c1d-a8888b43578c@gmail.com>
 <46c44e8f-8208-191c-c93b-f2f75ab8c67a@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <46c44e8f-8208-191c-c93b-f2f75ab8c67a@raspberrypi.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Phil Elwell <phil@raspberrypi.org>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, devel@driverdev.osuosl.org
List-Id: devicetree@vger.kernel.org

> Phil Elwell <phil@raspberrypi.org> hat am 17. September 2018 um 20:01 geschrieben:
> 
> 
> On 17/09/2018 18:51, Florian Fainelli wrote:
> > On 09/17/2018 04:47 AM, Phil Elwell wrote:
> >> Hi Stefan,
> >>
> >> On 17/09/2018 12:39, Stefan Wahren wrote:
> >>> Hi Phil,
> >>>
> >>> Am 17.09.2018 um 10:22 schrieb Phil Elwell:
> >>>> Both sides of the VCHIQ communications mechanism need to agree on the cache
> >>>> line size. Using an incorrect value can lead to data corruption, but having the
> >>>> two sides using different values is usually worse.
> >>>>
> >>>> In the absence of an obvious convenient run-time method to determine the
> >>>> correct value in the ARCH=arm world, the downstream Raspberry Pi trees used a
> >>>> Device Tree property, written by the firmware, to configure the kernel driver.
> >>>> This method was vetoed during the upstreaming process, so a fixed value of 32
> >>>> was used instead, and some corruptions ensued. This is take 2 at arriving at
> >>>> the correct value.
> >>>>
> >>>> Add a new compatible string - "brcm,bcm2836-vchiq" - to indicate an SoC with
> >>>> a 64-byte cache line. Document the new string in the binding, and use it on
> >>>> the appropriate platforms.
> >>>>
> >>>> The final patch is a (seemingly cosmetic) correction of the Device Tree "reg"
> >>>> declaration for the device node, but it doubles as an indication to the
> >>>> Raspberry Pi firmware that the kernel driver is running a recent kernel driver
> >>>> that chooses the correct value. As such it would help if the DT patches are
> >>>> not merged before the driver patch.
> >>>>
> >>>> v3: Builds without errors, tested on multiple Raspberry Pi models.
> >>>> v2: Replaced ARM-specific logic used to determine cache line size with
> >>>>      a new compatible string for BCM2836 and BCM2837.
> >>>>
> >>>> Phil Elwell (4):
> >>>>    staging/vc04_services: Use correct cache line size
> >>>>    dt-bindings: soc: Document "brcm,bcm2836-vchiq"
> >>>>    ARM: dts: bcm283x: Correct vchiq compatible string
> >>>>    ARM: dts: bcm283x: Correct mailbox register sizes
> >>>
> >>> since my pull requests are out, would it be okay to apply patch #1 for
> >>> 4.20 and the DT stuff for 4.21 (with the assumption Rob is okay with
> >>> these patches)?
> >>
> >> Patch 4 is the only one I'd like to be delayed, but delaying 2-4 is fine with me.
> > 
> > Humm, did you mean you would like not to be delayed? In any case Stefan,
> > you can send an additional pull request, and I will merge it and send a
> > second pull request towards ARM SoC maintainers, that's not a problem.
> 
> No, I meant what I wrote - I would prefer patch 1 to be merged before patch 4 (or at least
> in the same release) to avoid the need for another firmware change, hence delaying patch
> 4 is good. It makes sense for the other commits to be merged in that order, but the
> normal compatible-string fallback mechanism means there is no hard dependency there.
> 
> Phil

Patches #2 - #4 applied to bcm2835-dt-next

Thanks
