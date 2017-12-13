From: Cyrille Pitchen <cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 5/5] PCI: cadence: add EndPoint Controller driver for
 Cadence PCIe controller
Date: Wed, 13 Dec 2017 17:03:23 +0100
Message-ID: <2885a27d-bd97-c436-b8aa-86faabf68ca3@free-electrons.com>
References: <cover.1511439189.git.cyrille.pitchen@free-electrons.com>
 <297fa17e12cf0f2fb223c05eeb18570707ff5bf1.1511439189.git.cyrille.pitchen@free-electrons.com>
 <20171201122048.GB25010@red-moon>
 <ed6d811e-608e-e6aa-7b07-2f2d2d68adbd@ti.com>
 <CAOFm3uGQzAOrAmQLx7uJ0SJGQxMSB+oAniq9wd93tvupKWv=uA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOFm3uGQzAOrAmQLx7uJ0SJGQxMSB+oAniq9wd93tvupKWv=uA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, stelford-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, dgary-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, kgopi-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, eandrews-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sureshp-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Philippe,

Le 07/12/2017 à 11:05, Philippe Ombredanne a écrit :
> Cyrille,
> 
> 
> On Tue, Dec 5, 2017 at 10:19 AM, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
>> Hi,
>>
>> On Friday 01 December 2017 05:50 PM, Lorenzo Pieralisi wrote:
>>> On Thu, Nov 23, 2017 at 04:01:50PM +0100, Cyrille Pitchen wrote:
>>>> This patch adds support to the Cadence PCIe controller in endpoint mode.
>>>
>>> Please add a brief description to the log to describe the most salient
>>> features.
>>>
>>>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>>> ---
>>>>  drivers/pci/cadence/Kconfig           |   9 +
>>>>  drivers/pci/cadence/Makefile          |   1 +
>>>>  drivers/pci/cadence/pcie-cadence-ep.c | 553 ++++++++++++++++++++++++++++++++++
>>>>  3 files changed, 563 insertions(+)
>>>>  create mode 100644 drivers/pci/cadence/pcie-cadence-ep.c
>>>>
>>>> diff --git a/drivers/pci/cadence/Kconfig b/drivers/pci/cadence/Kconfig
>>>> index 120306cae2aa..b2e6af71f39e 100644
>>>> --- a/drivers/pci/cadence/Kconfig
>>>> +++ b/drivers/pci/cadence/Kconfig
>>>> @@ -21,4 +21,13 @@ config PCIE_CADENCE_HOST
>>>>        mode. This PCIe controller may be embedded into many different vendors
>>>>        SoCs.
>>>>
>>>> +config PCIE_CADENCE_EP
>>>> +    bool "Cadence PCIe endpoint controller"
>>>> +    depends on PCI_ENDPOINT
>>>> +    select PCIE_CADENCE
>>>> +    help
>>>> +      Say Y here if you want to support the Cadence PCIe  controller in
>>>> +      endpoint mode. This PCIe controller may be embedded into many
>>>> +      different vendors SoCs.
>>>> +
>>>>  endif # PCI_CADENCE
>>>> diff --git a/drivers/pci/cadence/Makefile b/drivers/pci/cadence/Makefile
>>>> index d57d192d2595..61e9c8d6839d 100644
>>>> --- a/drivers/pci/cadence/Makefile
>>>> +++ b/drivers/pci/cadence/Makefile
>>>> @@ -1,2 +1,3 @@
>>>>  obj-$(CONFIG_PCIE_CADENCE) += pcie-cadence.o
>>>>  obj-$(CONFIG_PCIE_CADENCE_HOST) += pcie-cadence-host.o
>>>> +obj-$(CONFIG_PCIE_CADENCE_EP) += pcie-cadence-ep.o
>>>> diff --git a/drivers/pci/cadence/pcie-cadence-ep.c b/drivers/pci/cadence/pcie-cadence-ep.c
>>>> new file mode 100644
>>>> index 000000000000..a1d761101a9c
>>>> --- /dev/null
>>>> +++ b/drivers/pci/cadence/pcie-cadence-ep.c
>>>> @@ -0,0 +1,553 @@
>>>> +/*
>>>> + * Cadence PCIe host controller driver.
>>>
>>> You should update this comment.
>>>
>>>> + *
>>>> + * Copyright (c) 2017 Cadence
>>>> + *
>>>> + * Author: Cyrille Pitchen <cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or modify
>>>> + * it under the terms of the GNU General Public License version 2 as
>>>> + * published by the Free Software Foundation.
>>>> + *
>>>> + * This program is distributed in the hope that it will be useful,
>>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>> + * GNU General Public License for more details.
>>>> + *
>>>> + * You should have received a copy of the GNU General Public License along with
>>>> + * this program.  If not, see <http://www.gnu.org/licenses/>.
>>>> + */
> 
> Would you consider using the new SPDX ids instead of this long legalese blurb?
> You can  check tglx's doc patches for details and Linus comments on
> why he wants it a certain way with C++ // comments.
> 
> Here this could come out much streamlined with this top level comment block:
> 
> // SPDX-License-Identifier: GPL-2.0
> // Copyright (c) 2017 Cadence
> // Cadence PCIe host controller driver.
> // Author: Cyrille Pitchen <cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> 
> This is only a suggestion, but everyone kinda likes it when the
> licensing boilerplate is minimal and out of the visual way in order to
> focus is on what matters most: the code!
> Thank you for your kind consideration.
> 

I don't mind changing for your proposal if this is the preferred way.
I'm updating the series.

Best regards,

Cyrille

-- 
Cyrille Pitchen, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
