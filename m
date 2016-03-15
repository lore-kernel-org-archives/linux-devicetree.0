From: Murali Karicheri <m-karicheri2@ti.com>
Subject: Re: [PATCH 0/5] Modularize PCI_DW related drivers.
Date: Tue, 15 Mar 2016 16:50:50 -0400
Message-ID: <56E875AA.7070106@ti.com>
References: <1454889644-27830-1-git-send-email-paul.gortmaker@windriver.com>
 <2837386.VTD89bjPJz@wuerfel> <56D40F7F.5060204@ti.com>
 <2163039.5ZupTHB3qf@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <2163039.5ZupTHB3qf@wuerfel>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Grant Likely <grant.likely@linaro.org>, Ley Foon Tan <lftan@altera.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Stanimir Varbanov <svarbanov@mm-sol.com>, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/01/2016 04:35 PM, Arnd Bergmann wrote:
> On Monday 29 February 2016 14:59:35 Kishon Vijay Abraham I wrote:
>>> }
>>>
>>> You just need to pass the same resource in here htat you pass into
>>> pci_remap_iospace().
>>
>> I still seem to get the abort in ioremap_page_range().
>>
>> Here's the patch I used [3] and here's the kernel log [4].
>>
>> [3] -> http://pastebin.ubuntu.com/15241614/
>> [4] -> http://pastebin.ubuntu.com/15241637/
>>
>>
> 
> Sorry, I'm out of ideas here. The patch looks right to me, but the problem
> looks unchanged.
> 
> 	Arnd
> 

Was there any progress since this last response from Arnd? or is it a TBD?

-- 
Murali Karicheri
Linux Kernel, Keystone
