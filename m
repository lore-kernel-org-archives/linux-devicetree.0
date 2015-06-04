From: Rob Herring <robh@kernel.org>
Subject: Re: of: clean-up unnecessary libfdt include paths
Date: Thu, 4 Jun 2015 12:02:55 -0500
Message-ID: <CAL_JsqKTNiVqZoPHn-UCPXMkddruNbywwiA2nwLkfbzaziXFBg@mail.gmail.com>
References: <1433308225-13874-1-git-send-email-robh@kernel.org> <20150604102032.DF5B4140280@ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150604102032.DF5B4140280@ozlabs.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Mackerras <paulus@samba.org>, Grant Likely <grant.likely@linaro.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 4, 2015 at 5:20 AM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> On Wed, 2015-03-06 at 05:10:25 UTC, Rob Herring wrote:
>> With the latest dtc import include fixups, it is no longer necessary to
>> add explicit include paths to use libfdt. Remove these across the
>> kernel.
>
> What are the "latest dtc import include fixups" ?

Changing the scripts/dtc/libfdt/libfdt.h includes from <> to "". The
import script does this now and the recent import in my for-next tree
has this. I'll clarify this in the commit message.

>
>> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
>> index c1ebbda..c16e836 100644
>> --- a/arch/powerpc/kernel/Makefile
>> +++ b/arch/powerpc/kernel/Makefile
>> @@ -2,7 +2,6 @@
>>  # Makefile for the linux kernel.
>>  #
>>
>> -CFLAGS_prom.o                = -I$(src)/../../../scripts/dtc/libfdt
>>  CFLAGS_ptrace.o              += -DUTS_MACHINE='"$(UTS_MACHINE)"'
>>
>>  subdir-ccflags-$(CONFIG_PPC_WERROR) := -Werror
>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>

Thanks.

Rob
