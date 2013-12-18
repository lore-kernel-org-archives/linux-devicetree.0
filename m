From: Rob Herring <robherring2@gmail.com>
Subject: Re: commit e38c0a1f breaks powerpc boards with uli1575 chip
Date: Wed, 18 Dec 2013 12:40:21 -0600
Message-ID: <52B1EC15.5070606@gmail.com>
References: <201312171135.38576@blacky.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201312171135.38576@blacky.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Nikita Yushchenko <nyushchenko@dev.rtsoft.ru>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <thierry.reding@avionic-design.de>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kumar Gala <galak@kernel.crashing.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Alexey Lugovskoy <lugovskoy@dev.rtsoft.ru>, Dmitry Krivoschekov <dkrivoschokov@dev.rtsoft.ru>
List-Id: devicetree@vger.kernel.org

[fixed DT maillist address]

On 12/17/2013 01:35 AM, Nikita Yushchenko wrote:
> Hi
> 
> While trying to make freescale p2020ds and  mpc8572ds boards working with mainline kernel, I faced that commit 
> e38c0a1f (Handle #address-cells > 2 specially) breaks things with these boards.

Good to see this broke in v3.7 and is just now found...

> 
> Both these boards have uli1575 chip.
> Corresponding part in device tree is something like
> 
>                 uli1575@0 {
>                         reg = <0x0 0x0 0x0 0x0 0x0>;
>                         #size-cells = <2>;
>                         #address-cells = <3>;
>                         ranges = <0x2000000 0x0 0x80000000
>                                   0x2000000 0x0 0x80000000
>                                   0x0 0x20000000
> 
>                                   0x1000000 0x0 0x0
>                                   0x1000000 0x0 0x0
>                                   0x0 0x10000>;
>                         isa@1e {
> ...
> 
> I.e. it has #address-cells = <3>
> 
> 
> With commit e38c0a1f reverted, devices under uli1575 are registered correctly, e.g. for rtc
> 
> OF: ** translation for device /pcie@ffe09000/pcie@0/uli1575@0/isa@1e/rtc@70 **
> OF: bus is isa (na=2, ns=1) on /pcie@ffe09000/pcie@0/uli1575@0/isa@1e
> OF: translating address: 00000001 00000070
> OF: parent bus is default (na=3, ns=2) on /pcie@ffe09000/pcie@0/uli1575@0
> OF: walking ranges...
> OF: ISA map, cp=0, s=1000, da=70
> OF: parent translation for: 01000000 00000000 00000000
> OF: with offset: 70
> OF: one level translation: 00000000 00000000 00000070
> OF: parent bus is pci (na=3, ns=2) on /pcie@ffe09000/pcie@0
> OF: walking ranges...
> OF: default map, cp=a0000000, s=20000000, da=70
> OF: default map, cp=0, s=10000, da=70
> OF: parent translation for: 01000000 00000000 00000000
> OF: with offset: 70
> OF: one level translation: 01000000 00000000 00000070
> OF: parent bus is pci (na=3, ns=2) on /pcie@ffe09000
> OF: walking ranges...
> OF: PCI map, cp=0, s=10000, da=70
> OF: parent translation for: 01000000 00000000 00000000
> OF: with offset: 70
> OF: one level translation: 01000000 00000000 00000070
> OF: parent bus is default (na=2, ns=2) on /
> OF: walking ranges...
> OF: PCI map, cp=0, s=10000, da=70
> OF: parent translation for: 00000000 ffc10000
> OF: with offset: 70
> OF: one level translation: 00000000 ffc10070
> OF: reached root node
> 
> With commit e38c0a1f in place, address translation fails:
> 
> OF: ** translation for device /pcie@ffe09000/pcie@0/uli1575@0/isa@1e/rtc@70 **
> OF: bus is isa (na=2, ns=1) on /pcie@ffe09000/pcie@0/uli1575@0/isa@1e
> OF: translating address: 00000001 00000070
> OF: parent bus is default (na=3, ns=2) on /pcie@ffe09000/pcie@0/uli1575@0
> OF: walking ranges...
> OF: ISA map, cp=0, s=1000, da=70
> OF: parent translation for: 01000000 00000000 00000000
> OF: with offset: 70
> OF: one level translation: 00000000 00000000 00000070
> OF: parent bus is pci (na=3, ns=2) on /pcie@ffe09000/pcie@0
> OF: walking ranges...
> OF: default map, cp=a0000000, s=20000000, da=70
> OF: default map, cp=0, s=10000, da=70
> OF: not found !
> 
> Either e38c0a1f should be reverted, or uli1575 (and perhaps other similar devices) have to be described in device 
> trees differently.

Reverting would break Tegra PCIe, but you should not have to change the
DT either. So we need a solution.

Is this something like this sufficient to fix it?

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 4b9317b..378aebd 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -74,7 +74,7 @@ static u64 of_bus_default_map(__be32 *addr, const
__be32 *range,
         * mapping doesn't specify a physical address. Rather, the address
         * specifies an identifier that must match exactly.
         */
-       if (na > 2 && memcmp(range, addr, na * 4) != 0)
+       if (na > 2 && memcmp(range, addr, (na - 2) * 4) != 0)
                return OF_BAD_ADDR;

        if (da < cp || da >= (cp + s))
