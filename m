From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH 2/8] pci-rcar-gen2: add initial device tree documentation
Date: Mon, 27 Jan 2014 12:07:06 +0000
Message-ID: <52E64BEA.90109@codethink.co.uk>
References: <1390754945-28142-1-git-send-email-ben.dooks@codethink.co.uk> <1390754945-28142-3-git-send-email-ben.dooks@codethink.co.uk> <CAMuHMdVo80pmYG+MC8d4-_Lxod0j2reAEEFM4sC7Z2vCbEioMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVo80pmYG+MC8d4-_Lxod0j2reAEEFM4sC7Z2vCbEioMw@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@lists.codethink.co.uk, Linux-sh list <linux-sh@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, horms+renesas@verge.net.au
List-Id: devicetree@vger.kernel.org

On 26/01/14 19:09, Geert Uytterhoeven wrote:
> On Sun, Jan 26, 2014 at 5:48 PM, Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>> + - reg : A list of physical regions to access the device. The first is
>> +         the operational registers for the OHCI/EHCI controller and the
>> +        second region is for the bridge configuration and control registers.
>
> You may want to add "reg-names" to use named regions, as there
> is more than one region.

I will sort that out, it may require further patching...

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
