From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 3/3] mtd: spi-nor: Altera Quadspi Flash Controller v2
 Platform driver
Date: Tue, 27 Jun 2017 18:21:43 +0200
Message-ID: <5f0e2ddd-d329-cb3d-01bc-c101247281a7@gmail.com>
References: <1498493619-4633-1-git-send-email-matthew.gerlach@linux.intel.com>
 <1498493619-4633-4-git-send-email-matthew.gerlach@linux.intel.com>
 <2ac33989-5665-33e0-c6f0-6791c8e46b0d@gmail.com>
 <alpine.DEB.2.20.1706270800240.8058@mgerlach-VirtualBox>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1706270800240.8058@mgerlach-VirtualBox>
Sender: linux-kernel-owner@vger.kernel.org
To: matthew.gerlach@linux.intel.com
Cc: vndao@altera.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, davem@davemloft.net, mchehab@kernel.org
List-Id: devicetree@vger.kernel.org

On 06/27/2017 05:15 PM, matthew.gerlach@linux.intel.com wrote:
> 
> 
> On Tue, 27 Jun 2017, Marek Vasut wrote:
> 
>> On 06/26/2017 06:13 PM, matthew.gerlach@linux.intel.com wrote:
>>> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>>
>> Just wrap it into the Altera QSPI driver , no need for separate platform
>> driver IMO.
> 
> Hi Marek,
> 
> I answered this question when you asked why the header file was
> necessary, but I think further discussion could be helpful, since this
> problem is becoming more prevelent.  The Altera Quadspi component is a
> soft IP in a
> FPGA, and the processor using the component may or may not have device
> tree support compiled into the Linux kernel.  Since device tree support
> may or may not be available, the device tree specific code must be
> separated
> from the core driver code.

I see, that's fine, although there is no PCIe or other support in this
submission. Is that planned ?

> One can certainly make the case, that device tree support could/should
> be available everywhere, but the current reality is most x86 Linux
> kernel configurations do not include device tree support.
> 
> For the record, I believe device trees, and more specifically device
> tree overlays, are the best way for Linux to use FPGAs, but I have to
> deal with the current realities.
> 
> Thanks again for all the great feedback.
> 
> Matthew Gerlach

[...]

-- 
Best regards,
Marek Vasut
