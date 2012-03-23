From: Yinghai Lu <yinghai@kernel.org>
Subject: Re: [git pull] PCI changes (including maintainer change)
Date: Fri, 23 Mar 2012 14:29:33 -0700
Message-ID: <CAE9FiQVs5+BVmn46xeXR_GwOYBkYy73-aSKYHQUv3EoTTiUtYQ@mail.gmail.com>
References: <20120322144817.796e3a8a@jbarnes-desktop>
	<CAE9FiQV96Uz9fU=v4=eBbAogOeehuBM3eHgSr0QW_C68ceADcQ@mail.gmail.com>
	<CA+55aFx+dXoJ=MGmpyzepDjBDv8LpXqdxUBCbdrakMKBsKpmTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CA+55aFx+dXoJ=MGmpyzepDjBDv8LpXqdxUBCbdrakMKBsKpmTw@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, Ralf Baechle <ralf@linux-mips.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Bjorn Helgaas <bhelgaas@google.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linuxppc-dev@lists.ozlabs.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 23, 2012 at 2:10 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Fri, Mar 23, 2012 at 12:58 PM, Yinghai Lu <yinghai@kernel.org> wrote:
>>
>> There are some merge conflicts. Hope attached patch could help Linus a
>> little bit.
>
> Hmm. My merge does not agree with yours at all in the MIPS
> pcibios_fixup_bus() area.
>
> Your patch re-introduces the device resource fixup that Bjorn removed,
> for example.
>
> I think my merge is correct, but hey, people should double-check.

yes, you are right.

Yinghai
