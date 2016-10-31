From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] ARM: BCM5301X: Add back handler ignoring external
 imprecise aborts
Date: Mon, 31 Oct 2016 14:01:23 -0700
Message-ID: <fb2c36cb-6f85-1a6d-160a-c50e22d6c46b@gmail.com>
References: <20161029111229.26875-1-zajec5@gmail.com>
 <a491509e-5cfc-fc7d-0011-dfcab3c884ea@broadcom.com>
 <6e252703-0010-83ae-fa14-57352add007a@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <6e252703-0010-83ae-fa14-57352add007a@hauke-m.de>
Sender: linux-pci-owner@vger.kernel.org
To: Hauke Mehrtens <hauke@hauke-m.de>, Scott Branden <scott.branden@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>, Lucas Stach <l.stach@pengutronix.de>, Jon Mason <jonmason@broadcom.com>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
List-Id: devicetree@vger.kernel.org

On 10/31/2016 01:59 PM, Hauke Mehrtens wrote:
> 
> 
> On 10/31/2016 07:08 PM, Scott Branden wrote:
>> Hi Rafal,
>>
>>
>> On 16-10-29 04:12 AM, Rafał Miłecki wrote:
>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> Since early BCM5301X days we got abort handler that was removed by
>>> commit 937b12306ea79 ("ARM: BCM5301X: remove workaround imprecise abort
>>> fault handler"). It assumed we need to deal only with pending aborts
>>> left by the bootloader. Unfortunately this isn't true for BCM5301X.
>>>
>>> When probing PCI config space (device enumeration) it is expected to
>>> have master aborts on the PCI bus. Most bridges don't forward (or they
>>> allow disabling it) these errors onto the AXI/AMBA bus but not the
>>> Northstar (BCM5301X) one.
>> Should we only add this workaround code if CONFIG_PCI is on then?
> 
> I think all the supported northstar devices have a PCIe controller. We
> could add such a CONFIG_PCI check, but I do not see a big advantage.

Actually, I do see a couple disadvantages if we gate this with
CONFIG_PCI: if this problem shows up irrespective of your kernel
configuration, you want the error handler to clear it, not rely on
CONFIG_PCI to be enabled for the error to go away and also, without an
additional ifdef, additional compiler coverage.
-- 
Florian
