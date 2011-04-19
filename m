From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v3] uio/pdrv_genirq: Add OF support
Date: Tue, 19 Apr 2011 10:42:04 +0200
Message-ID: <4DAD4ADC.9020201@monstr.eu>
References: <1303116654-5042-1-git-send-email-monstr@monstr.eu>
	<BANLkTimFnfgiQ5aMq_KwqHP8p92pjOJJwg@mail.gmail.com>
	<20110419061121.GB5252@ponder.secretlab.ca>
	<201104190932.31777.arnd@arndb.de>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201104190932.31777.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Arnd Bergmann wrote:
> On Tuesday 19 April 2011, Grant Likely wrote:
>> On Tue, Apr 19, 2011 at 11:58:25AM +1000, John Williams wrote:
>>> I know the arguments against the 'generic-uio' tag, but come on, let's
>>> look at the lesser of two evils here!  I call BS on this DTS purity.
> 
> Both a specific device ID and something like "generic-uio" are
> equally broken:
> 
> If you have generic-uio, it is impossible to write an in-kernel driver
> for the same hardware without changing the device tree, meaning that
> it is impossible to correctly describe the hardware in the device tree.
> 
> If you put a meaningful identifier into the match table, it is also
> impossible to have an in-kernel driver for the hardware, because now
> you have no way to choose whether to handle the device with UIO
> or an in-kernel driver.
> 
> There may be cases where you have two instances of the same device
> in a machine and  want one of them to be driven by UIO and the other
> by another driver. A common example of this would be a virtual machine
> where one device is passed through to the guest and the other is
> used by the host. I've done this for USB input devices and PCI network
> interfaces.

This discuss is only about example in the commit message that's why I think that 
we can add what maintainers like. If Hans or Greg want to add exact vendor and 
device, I will add it and we can move on. We can also add just "vendor,device".
Hans and Greg: What do you prefer?

Keeping empty match table in the patch creates space for everybody to choose 
custom preferred compatible string.

The last thing which we need to decide is what Paul mentioned about adding new 
file to doc in Documentation/devicetree/bindings/uio/
I think uio_pdrv_genirq.txt file name should be the best choice.

What about this description? (Please check my english).
"
UIO genirq

Compatible property wasn't advisedly setup because UIO can be used for various 
devices. Please choose your preferred compatible string and add it to matching 
table in the driver.

Required properties:
   - compatible : "vendor,device"

Optional properties:
   - reg : should contain registers location and length.
   - interrupts : should contain interrupt.
   - interrupt-parent : interrupt source phandle.

At least one of reg or interrupt property should be used.

TODO: Add userspace hook to tell the kernel compatible string at runtime.
"


>  
>> Call it what you like, but the reasons are well founded.  The alternative
>> that has been proposed which I am in agreement with is to investigate
>> giving userspace the hook to tell the kernel at runtime which devices
>> should be picked up by the uio driver.
> 
> Yes, I believe this is the best option.

I agree that this will be nice follow up patch to support this.

> 
>> In the mean time, explicitly modifying the match table is an okay
>> compromise.
> 
> Agreed.

ok. great.

Michal


-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
