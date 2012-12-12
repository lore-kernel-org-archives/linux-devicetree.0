From: Michal Simek <monstr@monstr.eu>
Subject: Re: pci and pcie device-tree binding - range No cells
Date: Wed, 12 Dec 2012 17:55:58 +0100
Message-ID: <50C8B71E.90704@monstr.eu>
References: <50C5D387.90908@monstr.eu> <50C5F11D.9060006@gmail.com> <50C5FA3E.9030303@monstr.eu> <50C5FE0F.3050108@gmail.com> <20121210214127.D51773E0796@localhost> <50C85E7D.5080006@monstr.eu> <CACxGe6udeSbEfibC53v0wu8vFRE6K3Fd_P6EX-3JS9F2M=wUeA@mail.gmail.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CACxGe6udeSbEfibC53v0wu8vFRE6K3Fd_P6EX-3JS9F2M=wUeA@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, linux-pci@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thierry Reding <thierry.reding@avionic-design.de>
List-Id: devicetree@vger.kernel.org

On 12/12/2012 11:49 AM, Grant Likely wrote:
> On Wed, Dec 12, 2012 at 10:37 AM, Michal Simek <monstr@monstr.eu> wrote:
>> On 12/10/2012 10:41 PM, Grant Likely wrote:
>>> drivers/pci/pci-of.c would be good. I'd also accept drivers/of/pci.c
>>> which might actually be a good idea in the short term so that it gets
>>> appropriate supervision while being generalized before being moved into
>>> the pci directory.
>>
>> Ben: Are you willing to move that ppc code to this location?
>> It is probably not good idea that I should do it when I even don't have
>> hardware available for testing (Asking someone else).
>
> You're a clever guy, you are more than capable of crafting the patch,
> even if you can't test on hardware. :-)
>
> I refactored most of the OF support code without having access to most
> of the affected hardware. Once I got the changes out there for review
> I also asked for spot testing before getting it into linux-next for
> even more testing.

Fair enough. :-)

Good time to start to look for how to work with board farm.

Thanks,
Michal


-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
