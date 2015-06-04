From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: of/dynamic: Fix test for PPC_PSERIES
Date: Thu,  4 Jun 2015 20:57:32 +1000 (AEST)
Message-ID: <20150604105732.77DFE140273@ozlabs.org>
References: <1433410481-22611-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433410481-22611-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, nfont@linux.vnet.ibm.com
List-Id: devicetree@vger.kernel.org

On Thu, 2015-04-06 at 09:34:41 UTC, Geert Uytterhoeven wrote:
> "IS_ENABLED(PPC_PSERIES)" always evaluates to false, as IS_ENABLED() is
> supposed to be used with the full Kconfig symbol name, including the
> "CONFIG_" prefix.
> 
> Add the missing "CONFIG_" prefix to fix this.
> 
> Fixes: a25095d451ece23b ("of: Move dynamic node fixups out of powerpc and into common code")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

> Did this bug cause any breakage?
> If yes, the fix should go to stable (for v3.17 and later).

Yikes. Not that I've heard of. But it's reasonably new so possibly it's not hit
distros that folks tend to run on those machines.

I'm also not clear how it would break, it could be subtle and we've not noticed.

Nathan might have more of an idea (on CC).

On my machine here everything that has an ibm,phandle also has a linux,phandle,
so we wouldn't hit that code path. But I'm not sure how representative that box
is.

cheers
