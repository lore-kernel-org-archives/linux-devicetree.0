From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 1/2] of: support dtc compiler flags for overlays
Date: Tue, 25 Apr 2017 17:10:58 -0700
Message-ID: <58FFE592.2030203@gmail.com>
References: <1493075119-32026-1-git-send-email-frowand.list@gmail.com>
 <1493075119-32026-2-git-send-email-frowand.list@gmail.com>
 <CAK7LNARd-XsCfSJhDj3JisH=u4XZm8DaPEa5Pg2ciWrq8Ueing@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <CAK7LNARd-XsCfSJhDj3JisH=u4XZm8DaPEa5Pg2ciWrq8Ueing@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <stephen.boyd@linaro.org>, Michal Marek <mmarek@suse.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 04/25/17 15:04, Masahiro Yamada wrote:
> 2017-04-25 8:05 GMT+09:00  <frowand.list@gmail.com>:
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> The dtc compiler version that adds initial support was available
>> in 4.11-rc1.  Add the ability to set the dtc compiler flags needed
>> by overlays.
>>
>> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
>> ---
> 
> 
> I know your motivation for 1/2 is overlay,
> but this patch itself is more generic.
> (support for per-file dtc compiler flag)
> 
> Could you reword the commit subject a little bit?
> 
> Otherwise,
> 
> Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Fixed in version 4.

-Frank

> 
> 
> 
>>  scripts/Makefile.lib | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>> index 0a07f9014944..0bbec480d323 100644
>> --- a/scripts/Makefile.lib
>> +++ b/scripts/Makefile.lib
>> @@ -283,6 +283,8 @@ ifeq ($(KBUILD_ENABLE_EXTRA_GCC_CHECKS),)
>>  DTC_FLAGS += -Wno-unit_address_vs_reg
>>  endif
>>
>> +DTC_FLAGS += $(DTC_FLAGS_$(basetarget))
>> +
>>  # Generate an assembly file to wrap the output of the device tree compiler
>>  quiet_cmd_dt_S_dtb= DTB     $@
>>  cmd_dt_S_dtb=                                          \
>> --
> 
> 

