From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH V3 5/6] Avoid duplicate probe for of platform devices
Date: Mon, 09 Jul 2012 08:58:11 -0500
Message-ID: <4FFAE373.6070905@gmail.com>
References: <1339148585-16947-1-git-send-email-B38951@freescale.com> <4FD60FB1.7050106@gmail.com> <412C8208B4A0464FA894C5F0C278CD5D01A16829@039-SN1MPN1-002.039d.mgd.msft.net> <20120706042611.GA1841@kroah.com> <412C8208B4A0464FA894C5F0C278CD5D01A168F2@039-SN1MPN1-002.039d.mgd.msft.net> <20120706161718.GA26894@kroah.com> <412C8208B4A0464FA894C5F0C278CD5D01A1E694@039-SN1MPN1-002.039d.mgd.msft.net> <94F013E7935FF44C83EBE7784D62AD3F09354AE6@039-SN2MPN1-021.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <94F013E7935FF44C83EBE7784D62AD3F09354AE6@039-SN2MPN1-021.039d.mgd.msft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Li Yang-R58472 <r58472@freescale.com>
Cc: Jia Hongtao-B38951 <B38951@freescale.com>, Greg KH <greg@kroah.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 07/08/2012 10:46 PM, Li Yang-R58472 wrote:
>>> I don't understand, why is this just showing up now?  What
>>> changed to cause this?  Couldn't that be the real problem here?
>>> 
>> 
>> The issue is showing up because we now probe devices twice. 
>> Previously, we just probe devices once. But now we changed the way
>> of pci init which makes pci controllers should be probed earlier
>> than other devices. So we have to probe pci nodes separately. Probe
>> more than once is the root cause of this issue.
>> 
>> The pci patchset I mentioned please refer to: 
>> http://patchwork.ozlabs.org/patch/163742/
> 
> Let me try to clarify a little bit.  The of platform bus normally
> traverse the device tree to add all the devices.  The change which
> caused problem is that we need to probe PCIe RC devices at a earlier
> stage of initialization.  So we added these PCIe RC devices earlier
> than the normal device tree traversal process.  These PCIe RC devices
> will be scanned again during the normal traversal and cause
> duplicated devices being added.  Our proposal is to deal with
> duplicated devices automatically and make it possible to scan the
> device tree multiple times for devices to be added.

What is making PCI need to be probed earlier? Perhaps deferred probe
would work?

Perhaps giving of_platform_populate an exclude list of compatible
strings to skip would work.

Rob
