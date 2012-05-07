From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] OF: PCI: const usage needed by MIPS
Date: Mon, 7 May 2012 08:11:08 -0700
Message-ID: <CAErSpo4AQh3cJzULkmP_Dqsf0cSPRP1WqvhuQR3gePXw2rN7rQ@mail.gmail.com>
References: <1335808019-24502-1-git-send-email-blogic@openwrt.org>
 <4F9ED1DC.3050007@gmail.com> <4F9FE4F6.5070909@openwrt.org>
 <CAErSpo4bZ=0=DtbDots_GOGeLNhX6Q4eJrdetaFQMv4iiv5+XA@mail.gmail.com>
 <4FA32E47.7020406@gmail.com> <4FA3B596.3050106@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <4FA3B596.3050106@openwrt.org>
Sender: linux-pci-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: David Daney <ddaney.cavm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Grant Likely <grant.likely@secretlab.ca>, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Fri, May 4, 2012 at 3:55 AM, John Crispin <blogic@openwrt.org> wrote=
:
> Hi David,
>
>> The problem is when you start declaring function pointers in various
>> ops vectors.
>>
>> Consider:
>>
>> void (*foo)(const struct pci_dev *)
>> void (*bar)(struct pci_dev *)
>>
>> foo and bar are not type compatible, and you will get compiler
>> warnings if you use one where the other is expected.

Oh, right.  I vaguely remember tripping over this a few years ago when
I refactored pci_swizzle_interrupt_pin().  Thanks for enhancing my
simple understanding.

>> So the question is: =A0Are we ever going to the address of any of th=
e
>> functions that are being modified? =A0If so, we have created a probl=
em.
>
> i could not find any place in the code where this happens, which does
> not mean that there are none.

I compiled alpha, ia64, mips, parisc, powerpc, sh, sparc, and x86 and
didn't see any issues related to this patch.  There might still be
something,  but I'm willing to help work through them or revert this
if it turns out to be a problem.  I'm still assuming that Grant will
handle this.

Bjorn
