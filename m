From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 2/8] pci-rcar-gen2: add initial device tree documentation
Date: Mon, 27 Jan 2014 21:13:08 +0300
Message-ID: <52E6A1B4.6060906@cogentembedded.com>
References: <1390754945-28142-1-git-send-email-ben.dooks@codethink.co.uk>	<1390754945-28142-3-git-send-email-ben.dooks@codethink.co.uk> <CAMuHMdVo80pmYG+MC8d4-_Lxod0j2reAEEFM4sC7Z2vCbEioMw@mail.gmail.com> <52E65F95.9080306@cogentembedded.com> <52E6602A.8040003@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <52E6602A.8040003@codethink.co.uk>
Sender: linux-sh-owner@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@lists.codethink.co.uk, Linux-sh list <linux-sh@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, horms+renesas@verge.net.au
List-Id: devicetree@vger.kernel.org

Hello.

On 01/27/2014 04:33 PM, Ben Dooks wrote:

>>>> + - reg : A list of physical regions to access the device. The first is
>>>> +         the operational registers for the OHCI/EHCI controller and the
>>>> +        second region is for the bridge configuration and control
>>>> registers.

>>> You may want to add "reg-names" to use named regions, as there
>>> is more than one region.

>>     I've already told Ben he can't claim EHCI/OHCI register ranges at
>> the bridge node, so there should be only one "reg" specifier.

> Well, that's going to take quite a bit of changing the driver as
> it already assumes two nodes from the platform device definition.

    Ah, I failed to realize it's not your mistake, sorry.

WBR, Sergei

