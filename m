From: Kevin Cernekee <cernekee@gmail.com>
Subject: Re: [PATCH V6 15/25] MIPS: BMIPS: Flush the readahead cache after DMA
Date: Wed, 25 Mar 2015 10:08:47 -0700
Message-ID: <CAJiQ=7Cca_rc+g5uo-7h6PUSu3QCbC=Ev1-hnqoqz1wy_EKeZQ@mail.gmail.com>
References: <1419529760-9520-1-git-send-email-cernekee@gmail.com>
 <1419529760-9520-16-git-send-email-cernekee@gmail.com> <20150325092358.GA31933@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150325092358.GA31933@linux-mips.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Jaedon Shin <jaedon.shin@gmail.com>, Andrew Bresticker <abrestic@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Jonas Gorski <jogo@openwrt.org>, Arnd Bergmann <arnd@arndb.de>, Brian Norris <computersforpeace@gmail.com>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 25, 2015 at 2:23 AM, Ralf Baechle <ralf@linux-mips.org> wro=
te:
> On Thu, Dec 25, 2014 at 09:49:10AM -0800, Kevin Cernekee wrote:
>
>> BMIPS 3300/435x/438x CPUs have a readahead cache that is separate fr=
om
>> the L1/L2.  During a DMA operation, accesses adjacent to a DMA buffe=
r
>> may cause parts of the DMA buffer to be prefetched into the RAC.  To
>> avoid possible coherency problems, flush the RAC upon DMA completion=
=2E
>>
>> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
>> Signed-off-by: Jaedon Shin <jaedon.shin@gmail.com>
>> ---
>>  arch/mips/mm/dma-default.c | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/mips/mm/dma-default.c b/arch/mips/mm/dma-default.c
>> index af5f046..38ee47a 100644
>> --- a/arch/mips/mm/dma-default.c
>> +++ b/arch/mips/mm/dma-default.c
>> @@ -18,6 +18,7 @@
>>  #include <linux/highmem.h>
>>  #include <linux/dma-contiguous.h>
>>
>> +#include <asm/bmips.h>
>>  #include <asm/cache.h>
>>  #include <asm/cpu-type.h>
>>  #include <asm/io.h>
>
> Aside of platform-specific headers having no business of getting
> included directly in a generic arch file

<asm/bmips.h> covers all BMIPS CPUs across multiple platforms.

The intention was to add code needed to support BMIPS CPUs into a
central place, rather than duplicating it in the platform code for
each of the BMIPS-based systems: arch/mips/{bcm63xx,bmips,brcmstb}.

> this also breaks the build
> of many platforms:
>
>   CC      arch/mips/mm/dma-default.o
> In file included from arch/mips/mm/dma-default.c:21:0:
> ./arch/mips/include/asm/bmips.h: In function =E2=80=98bmips_read_zscm=
_reg=E2=80=99:
> ./arch/mips/include/asm/bmips.h:97:160: error: cast to pointer from i=
nteger of different size [-Werror=3Dint-to-pointer-cast]
>   cache_op(Index_Load_Tag_S, ZSCM_REG_BASE + offset);
>                                                                      =
                                                                       =
                    ^
> ./arch/mips/include/asm/bmips.h: In function =E2=80=98bmips_write_zsc=
m_reg=E2=80=99:
> ./arch/mips/include/asm/bmips.h:118:160: error: cast to pointer from =
integer of different size [-Werror=3Dint-to-pointer-cast]
>   cache_op(Index_Store_Tag_S, ZSCM_REG_BASE + offset);
>
> I think the broken platforms are all the 64 bit platforms.

Hmm, looks like I might need to use 0x97000000UL for ZSCM_REG_BASE.

If this fixes the build should I resubmit, or do you really want the
BMIPS flush code moved into another file?
