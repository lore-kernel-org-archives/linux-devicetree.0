From: Raviteja Garimella <raviteja.garimella@broadcom.com>
Subject: Re: [PATCH v4 2/3] Broadcom USB DRD Phy driver for Northstar2
Date: Wed, 5 Apr 2017 18:30:45 +0530
Message-ID: <CAEHZuqMpHMDMVL6XMxrSPC3zeXZ=-Wx=xTSON_CruXnVC5PsdA@mail.gmail.com>
References: <1490704052-11314-1-git-send-email-raviteja.garimella@broadcom.com>
 <1490704052-11314-3-git-send-email-raviteja.garimella@broadcom.com>
 <8aa2cc42-6fdc-5574-4449-f05f6d5cbd38@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <8aa2cc42-6fdc-5574-4449-f05f6d5cbd38@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Ray Jui <rjui@broadcom.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Kishon,

On Wed, Apr 5, 2017 at 4:30 PM, Kishon Vijay Abraham I <kishon@ti.com> wrote:
> Hi,
>
> On Tuesday 28 March 2017 05:57 PM, Raviteja Garimella wrote:
>> This is driver for USB DRD Phy used in Broadcom's Northstar2
>> SoC. The phy can be configured to be in Device mode or Host
>> mode based on the type of cable connected to the port. The
>> driver registers to  extcon framework to get appropriate
>> connect events for Host/Device cables connect/disconnect
>> states based on VBUS and ID interrupts.
>
> $patch should be phy: phy-bcm-ns2-usbdrd: USB DRD Phy driver for Broadcoms
> Northstar2.
>

Will do.

> Sorry for not letting you know this earlier. But I feel the design of the
> driver should be changed. Extcon shouldn't be used here. The extcon
> notifications should be sent to the consumer driver and the consumer driver
> should be responsible for invoking the phy ops.
>

The consumer drivers here would be a UDC driver (USB device
controller), EHCI and OHCI host controller drivers.
I was already suggested in UDC driver review to deal with extcon in Phy driver.

This phy connects to 2 host controllers, and one device controller.
That's the design in Broadcom Northstar2
platform. The values of the VBUS and ID pins of this port are
determined based on the type of the cable (device cable
or host cable). And. phy has to be configured accordingly.

> The phy ops being invoked during extcon events doesn't look right.

Could you please elaborate on the concern, so that we can think of
mitigating those issues in this driver?
Since we are dealing with phy init/shutdown in this driver itself, are
you okay with moving the extcon handling code
out of phy ops ?

Thanks,
Ravi
>
> Thanks
> Kishon
