From: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: Re: [PATCH v8 00/45] powerpc/powernv: PCI hotplug support
Date: Wed, 20 Apr 2016 12:40:58 +1000
Message-ID: <20160420024058.GC3754@gwshan>
References: <1455680668-23298-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <570E0E13.6080409@ozlabs.ru>
 <20160413234246.GA5330@gwshan>
 <8771729.bnzLL9sLJY@new-mexico>
 <20160414013052.GA23214@gwshan>
 <CAL_JsqKc2i6rDGYXvEzQRJ4fxi=xqXTG4ngtNkFR+XkEaWDU1Q@mail.gmail.com>
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKc2i6rDGYXvEzQRJ4fxi=xqXTG4ngtNkFR+XkEaWDU1Q@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>, Alistair Popple <alistair@popple.id.au>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Alexey Kardashevskiy <aik@ozlabs.ru>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, dja@axtens.net
List-Id: devicetree@vger.kernel.org

On Fri, Apr 15, 2016 at 11:10:21AM -0500, Rob Herring wrote:
>On Wed, Apr 13, 2016 at 8:30 PM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
>> On Thu, Apr 14, 2016 at 09:57:32AM +1000, Alistair Popple wrote:
>>>Hi Gavin,
>>>
>>><snip>
>>>
>>>> >Why exactly cannot EEH reset changes go to a smaller separate patchset
>>>> >(before hotplug)?
>>>> >
>>>>
>>>> As I explained before, the patchset's order is: PCI generic part,
>>>> PowerNV PCI related, EEH related, device-tree part and hotplug driver.
>>>>
>>>> The EEH reset change is included in PATCH[37/45]. There is no point
>>>> to reorder the patches.
>>>
>>>I don't understand all of the dependencies but if possible splitting the
>>>series up into a set of smaller self-contained patch series makes things
>>>easier to review and may make it easier for you to get this functionality
>>>reviewed and accepted into upstream.
>>>
>>
>> Thanks, Alistair. I will move those cleanup/refactor related patches
>> to form a separate series which is expected to be merged first. That
>> will helps the reviewers to focus on the patches with complicated
>> changes as you suggested. Alexey, please let me know if that way is
>> you like to see or not.
>
>As I said last cycle, I'll happily take the DT refactoring patches
>separately, but you have to tell me if you want me to apply them and
>it has to be well before the merge window.
>

Thanks, Rob. I hope to post next revision (v9) soon and the device-tree
related cleanup patches should be ready for next merge window in it.

>Rob
>
