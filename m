From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: powerpc: dts: Remove leading 0x and 0s from bindings notation
Date: Mon, 22 Jan 2018 14:34:16 +1100 (AEDT)
Message-ID: <3zPxqr2PDWz9t1t@ozlabs.org>
References: <20171214165413.28163-1-malat@debian.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171214165413.28163-1-malat@debian.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Mathieu Malaterre <malat@debian.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thu, 2017-12-14 at 16:54:00 UTC, Mathieu Malaterre wrote:
> Improve the DTS files by removing all the leading "0x" and zeros to fix the
> following dtc warnings:
> 
> Warning (unit_address_format): Node /XXX unit name should not have leading "0x"
> 
> and
> 
> Warning (unit_address_format): Node /XXX unit name should not have leading 0s
> 
> Converted using the following command:
> 
> find . -type f \( -iname *.dts -o -iname *.dtsi \) -exec sed -E -i -e "s/@0x([0-9a-fA-F\.]+)\s?\{/@\L\1 \{/g" -e "s/@0+([0-9a-fA-F\.]+)\s?\{/@\L\1 \{/g" {} +
> 
> For simplicity, two sed expressions were used to solve each warnings separately.
> 
> To make the regex expression more robust a few other issues were resolved,
> namely setting unit-address to lower case, and adding a whitespace before the
> the opening curly brace:
> 
> https://elinux.org/Device_Tree_Linux#Linux_conventions
> 
> This is a follow up to commit 4c9847b7375a ("dt-bindings: Remove leading 0x from bindings notation")
> 
> Reported-by: David Daney <ddaney@caviumnetworks.com>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/600ecc1936be075f611f299755e2de

cheers
