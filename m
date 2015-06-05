From: Nathan Fontenot <nfont@linux.vnet.ibm.com>
Subject: Re: of/dynamic: Fix test for PPC_PSERIES
Date: Thu, 04 Jun 2015 19:43:15 -0500
Message-ID: <5570F0A3.7010404@linux.vnet.ibm.com>
References: <20150604105732.77DFE140273@ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150604105732.77DFE140273@ozlabs.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/04/2015 05:57 AM, Michael Ellerman wrote:
> On Thu, 2015-04-06 at 09:34:41 UTC, Geert Uytterhoeven wrote:
>> "IS_ENABLED(PPC_PSERIES)" always evaluates to false, as IS_ENABLED() is
>> supposed to be used with the full Kconfig symbol name, including the
>> "CONFIG_" prefix.
>>
>> Add the missing "CONFIG_" prefix to fix this.
>>
>> Fixes: a25095d451ece23b ("of: Move dynamic node fixups out of powerpc and into common code")
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
> 
>> Did this bug cause any breakage?
>> If yes, the fix should go to stable (for v3.17 and later).
> 
> Yikes. Not that I've heard of. But it's reasonably new so possibly it's not hit
> distros that folks tend to run on those machines.

I think we do have some distros that have picked this up.

> 
> I'm also not clear how it would break, it could be subtle and we've not noticed.
> 

The only place I can find that this might cause an issue is during device tree
updating that pseries does after a live migration or suspend/resume. When
removing or updating a device tree node we look up the node by ibm,phandle and
without this patch we wouldn't find these nodes.

I have not seen any issues because of this but I think pushing this to stable
would be good.

-Nathan
