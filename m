From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 3/3] pci, pci-thunder-ecam: Add driver for
 ThunderX-pass1 on-chip devices
Date: Mon, 8 Feb 2016 15:12:23 -0600
Message-ID: <CAL_JsqJNndZ59465YhpkP=dQYaijaar+LcQG4KQEJwF5e1ryLQ@mail.gmail.com>
References: <1454715675-17512-1-git-send-email-ddaney.cavm@gmail.com>
 <1454715675-17512-4-git-send-email-ddaney.cavm@gmail.com> <20160208195642.GA15103@rob-hp-laptop>
 <56B8FED6.1050804@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <56B8FED6.1050804@caviumnetworks.com>
Sender: linux-pci-owner@vger.kernel.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: David Daney <ddaney.cavm@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 8, 2016 at 2:47 PM, David Daney <ddaney@caviumnetworks.com> wrote:
> On 02/08/2016 11:56 AM, Rob Herring wrote:
>>
>> On Fri, Feb 05, 2016 at 03:41:15PM -0800, David Daney wrote:
>>>
>>> From: David Daney <david.daney@cavium.com>

[...]

>>> +Properties of the host controller node that differ from
>>> +host-generic-pci.txt:
>>> +
>>> +- compatible     : Must be "cavium,pci-host-thunder-ecam"
>>> +
>>> +Example:
>>> +
>>> +       pci@84b0,00000000 {
>>
>>
>> Drop the comma,
>
>
> OK...
>
>> and the node name should be "pcie".
>>
>
> Why pcie?
>
> There are no PCIe devices or buses reachable from this type of root complex.
> There are however many PCI devices.

I thought ECAM is a PCIe thing. If not, then nevermind.

Rob
