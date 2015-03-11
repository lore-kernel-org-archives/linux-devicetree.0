From: Murali Karicheri <m-karicheri2@ti.com>
Subject: Re: [PATCH] pci: of : fix BUG: unable to handle kernel
Date: Wed, 11 Mar 2015 11:28:15 -0400
Message-ID: <55005F0F.5080302@ti.com>
References: <1426001139-18419-1-git-send-email-m-karicheri2@ti.com> <CAL_JsqJPvW5q4XwwenFTHrDG4cU5uTd7n-vLKj0mdV9FbVC4Ag@mail.gmail.com> <20150311124911.GA8656@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20150311124911.GA8656@n2100.arm.linux.org.uk>
Sender: linux-pci-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Rob Herring <robherring2@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, Suravee Suthikulanit <Suravee.Suthikulpanit@amd.com>, Will Deacon <will.deacon@arm.com>, Joerg Roedel <joro@8bytes.org>
List-Id: devicetree@vger.kernel.org

On 03/11/2015 08:49 AM, Russell King - ARM Linux wrote:
> On Wed, Mar 11, 2015 at 07:35:45AM -0500, Rob Herring wrote:
>> On Tue, Mar 10, 2015 at 10:25 AM, Murali Karicheri<m-karicheri2@ti.com>  wrote:
>>> On some platforms such as that based on x86, ia64 etc, root bus is
>>> created with parent node passed in as NULL to pci_create_root_bus().
>>> On these platforms, the patch series "PCI: get DMA configuration from
>>> parent device" when applied causes kernel crash. So add a check for this
>>> in of_pci_dma_configure()
>>
>> Wouldn't these arches have OF disabled and call an empty function?
>> Regardless, we still need this.
>>
>>> Signed-off-by: Murali Karicheri<m-karicheri2@ti.com>
>>
>> I'm assuming Bjorn will apply this.
>>
>> Acked-by: Rob Herring<robh@kernel.org>
>
> It might be an idea to read the subject line...
>
> "fix BUG: unable to handle kernel"
Russell,

I will fix the subject as "fix BUG: unable to handle kernel NULL 
pointer" and re-send.

Thanks

Murali
>
> which is meaningless.  It needs a much better subject line before it can
> be committed.
>


-- 
Murali Karicheri
Linux Kernel, Texas Instruments
