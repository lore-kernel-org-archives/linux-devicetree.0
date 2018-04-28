From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add keyword for devicetree overlay notifiers
Date: Fri, 27 Apr 2018 18:13:00 -0700
Message-ID: <31393190-2e26-cdf4-09fa-011d6a0ec455@gmail.com>
References: <1524876619-26283-1-git-send-email-frowand.list@gmail.com>
 <0fc405e3-dd6b-3891-3d6b-0026c59a4d74@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0fc405e3-dd6b-3891-3d6b-0026c59a4d74@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 04/27/18 17:57, Frank Rowand wrote:
> Hi Rob,
> 
> I'm not sure how the extra "From:" of sony.com got into
> this email.  I'll have to dig into my scripts and/or
> git configs to figure that out.  The real "From:" is
> the gmail.com one.

Darn it...

The real "From: is the sony.com one.  The wrong "From" is the gmail one.

-Frank

> 
> -Frank
> 
> On 04/27/18 17:50, frowand.list@gmail.com wrote:
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> From: Frank Rowand <frowand.list@gmail.com>
>>
>> Devicetree overlay notifiers have a chance to potentially get
>> pointers into the overlay unflattened devicetree and overlay FDT.
>> The only protection against these pointers being accessed after
>> the underlying data has been released by kfree() is by source
>> code review of patches.  Add a keyword line to the devicetree
>> overlay maintainers entry to try to catch overlay notifier
>> related patches.
>>
>> The keyword line is added to the devicetree overlay entry instead
>> of the devicetree entry so that not all maintainers will receive
>> the additional review traffic.  Add Frank Rowand (already a
>> maintainer in the devicetree entry) so that he will receive
>> the additional review traffic.
>>
>> Signed-off-by: Frank Rowand <frowand.list@gmail.com>
>> ---
>>  MAINTAINERS | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 92be777d060a..aca3956694f8 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -10422,12 +10422,14 @@ F:	drivers/infiniband/ulp/opa_vnic
>>  
>>  OPEN FIRMWARE AND DEVICE TREE OVERLAYS
>>  M:	Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>> +M:	Frank Rowand <frowand.list@gmail.com>
>>  L:	devicetree@vger.kernel.org
>>  S:	Maintained
>>  F:	Documentation/devicetree/dynamic-resolution-notes.txt
>>  F:	Documentation/devicetree/overlay-notes.txt
>>  F:	drivers/of/overlay.c
>>  F:	drivers/of/resolver.c
>> +K:	of_overlay_notifier_
>>  
>>  OPEN FIRMWARE AND FLATTENED DEVICE TREE
>>  M:	Rob Herring <robh+dt@kernel.org>
>>
> 
> 
