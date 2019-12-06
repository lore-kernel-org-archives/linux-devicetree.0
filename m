Return-Path: <SRS0=B/fR=Z4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F12C43603
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 01:37:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BD9021823
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 01:37:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhhuwqAD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbfLFBhb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Dec 2019 20:37:31 -0500
Received: from mail-pj1-f47.google.com ([209.85.216.47]:35341 "EHLO
        mail-pj1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbfLFBhb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Dec 2019 20:37:31 -0500
Received: by mail-pj1-f47.google.com with SMTP id w23so2036238pjd.2
        for <devicetree@vger.kernel.org>; Thu, 05 Dec 2019 17:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QFmhbe9ddbtIYeSdC4Wa6/rdFsIq9qRHGhAnGj5nGkM=;
        b=XhhuwqADs6mLxYXgwr9goFhkfDgRSSlIDeSDp3BPh5piuUlXXTwlcYbOlpQpNgMgDu
         YUfilYWd5Pe33/hwFfPgE1+gaEDpZ8RZqKkFOn5Cfx8edqpK6FivqoUZf1C4v5SP03gs
         ytYTOLQ4muvA1/RYOaFlae7Z4g5g8BB/u2hlyjIOesyNVUlbY25a0AtASk2pNlVITADw
         wpXfOm0j2FGxn0IkeMSYMNx6/+QxUgmnfKW86LiGjV0hKmRgftZga+/JnMfKI5jfkHzb
         sKqY9nUqVAdzg1rmSehXuyhqm6A3M/ROZv9PcMPAAvRmx4FNRxZuan4Dv/1RZeh7D9J2
         jEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QFmhbe9ddbtIYeSdC4Wa6/rdFsIq9qRHGhAnGj5nGkM=;
        b=VNqKl7jFDuj5B4TXR5nB3y2Tgru3KhtYXoY91kYq8PioatMtVK+M9DCRYCRbEuoHAy
         wjf2olmGSWTyHnOggL2bvvSOYqAXKIorqcmkOuazhDvnYD24wuKuIZpUoe9bQw/wZ5Li
         CFaI8/g15CeHu0JfMAWLoYRp+JMUYvSnRl69iFUtKBmOkOGyT7jJwmoSJfYOyG1iKMpo
         OT6LmopAMtMsxPk2LMPh9qpaoq/9GTB5NO77D+5OkLvOS7hkqHt640EUKRd8OM9NdIVO
         7cWlkkrM9gwzv0XdOn6fBD82H5zFOHucKSZ3wu0371gBWUlOtYXP49jwgVVCN+kpX3SV
         XaNg==
X-Gm-Message-State: APjAAAW546X5JGtmt+vm+KyqUobWt1eTBZmIEJipGA0YjqYKVmywadNR
        qaUrvPpW7RFA1yWj/5VuE6E=
X-Google-Smtp-Source: APXvYqxzIHtC1cYPN+CFT0NVT86qIF5tw1U2wBpSj9uhHmEuxmfJAzpLazXlVC8A19qan9GSD8coaA==
X-Received: by 2002:a17:902:12c:: with SMTP id 41mr12061982plb.224.1575596250288;
        Thu, 05 Dec 2019 17:37:30 -0800 (PST)
Received: from ?IPv6:240d:1a:90a:7900:b0a6:2318:ed21:5e5? ([240d:1a:90a:7900:b0a6:2318:ed21:5e5])
        by smtp.gmail.com with ESMTPSA id o12sm924967pjf.19.2019.12.05.17.37.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Dec 2019 17:37:29 -0800 (PST)
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
To:     Segher Boessenkool <segher@kernel.crashing.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Rob Herring <robh+dt@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Gleixner <tglx@linutronix.de>
References: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de>
 <87wobedpit.fsf@mpe.ellerman.id.au>
 <20191203183531.GT24609@gate.crashing.org>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <493a7da7-774c-1515-b43a-80d72c9d3c19@gmail.com>
Date:   Thu, 5 Dec 2019 19:37:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191203183531.GT24609@gate.crashing.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 12/3/19 12:35 PM, Segher Boessenkool wrote:
> Hi!
> 
> On Tue, Dec 03, 2019 at 03:03:22PM +1100, Michael Ellerman wrote:
>> Sebastian Andrzej Siewior <bigeasy@linutronix.de> writes:
>> I've certainly heard it said that on some OF's the phandle was just ==
>> the address of the internal representation, and I guess maybe for SLOF
>> that is true.
> 
> It is (or was).  In many OFs it is just the effective address of some
> node structure.  SLOF runs with translation off normally.
> 
>> They seem to vary wildly though, eg. on an Apple G5:
> 
> Apple OF runs with translation on usually.  IIRC these are effective
> addresses as well.
> 
> The OF they have on G5 machines is mostly 32-bit, for compatibility is my
> guess (for userland things dealing with addresses from OF, importantly).
> 
>>   $ find /proc/device-tree/ -name phandle | xargs lsprop | head -10
>>   /proc/device-tree/vsp@0,f9000000/veo@f9180000/phandle ff970848
>>   /proc/device-tree/vsp@0,f9000000/phandle ff970360
>>   /proc/device-tree/vsp@0,f9000000/veo@f9080000/phandle ff970730
>>   /proc/device-tree/nvram@0,fff04000/phandle ff967fb8
>>   /proc/device-tree/xmodem/phandle ff9655e8
>>   /proc/device-tree/multiboot/phandle ff9504f0
>>   /proc/device-tree/diagnostics/phandle ff965550
>>   /proc/device-tree/options/phandle ff893cf0
>>   /proc/device-tree/openprom/client-services/phandle ff8925b8
>>   /proc/device-tree/openprom/phandle ff892458
>>
>> That machine does not have enough RAM for those to be 32-bit real
>> addresses. I think Apple OF is running in virtual mode though (?), so
>> maybe they are pointers?
> 
> Yes, I think the default is to have 8MB ram at the top of 4GB (which is
> the physical address of the bootrom, btw) for OF.
> 
>> And on an IBM pseries machine they're a bit all over the place:
>>
>>   /proc/device-tree/cpus/PowerPC,POWER8@40/ibm,phandle 10000040
>>   /proc/device-tree/cpus/l2-cache@2005/ibm,phandle 00002005
>>   /proc/device-tree/cpus/PowerPC,POWER8@30/ibm,phandle 10000030
>>   /proc/device-tree/cpus/PowerPC,POWER8@20/ibm,phandle 10000020
>>   /proc/device-tree/cpus/PowerPC,POWER8@10/ibm,phandle 10000010
>>   /proc/device-tree/cpus/l2-cache@2003/ibm,phandle 00002003
>>   /proc/device-tree/cpus/l2-cache@200a/ibm,phandle 0000200a
>>   /proc/device-tree/cpus/l3-cache@3108/ibm,phandle 00003108
>>   /proc/device-tree/cpus/l2-cache@2001/ibm,phandle 00002001
>>   /proc/device-tree/cpus/l3-cache@3106/ibm,phandle 00003106
>>   /proc/device-tree/cpus/ibm,phandle fffffff8
>>   /proc/device-tree/cpus/l3-cache@3104/ibm,phandle 00003104
>>   /proc/device-tree/cpus/l2-cache@2008/ibm,phandle 00002008
>>   /proc/device-tree/cpus/l3-cache@3102/ibm,phandle 00003102
>>   /proc/device-tree/cpus/l2-cache@2006/ibm,phandle 00002006
>>   /proc/device-tree/cpus/l3-cache@3100/ibm,phandle 00003100
>>   /proc/device-tree/cpus/PowerPC,POWER8@8/ibm,phandle 10000008
>>   /proc/device-tree/cpus/l2-cache@2004/ibm,phandle 00002004
>>   /proc/device-tree/cpus/PowerPC,POWER8@48/ibm,phandle 10000048
>>   /proc/device-tree/cpus/PowerPC,POWER8@38/ibm,phandle 10000038
>>   /proc/device-tree/cpus/l2-cache@2002/ibm,phandle 00002002
>>   /proc/device-tree/cpus/PowerPC,POWER8@28/ibm,phandle 10000028
>>   /proc/device-tree/cpus/l3-cache@3107/ibm,phandle 00003107
>>   /proc/device-tree/cpus/PowerPC,POWER8@18/ibm,phandle 10000018
>>   /proc/device-tree/cpus/l2-cache@2000/ibm,phandle 00002000
>>   /proc/device-tree/cpus/l3-cache@3105/ibm,phandle 00003105
>>   /proc/device-tree/cpus/l3-cache@3103/ibm,phandle 00003103
>>   /proc/device-tree/cpus/l3-cache@310a/ibm,phandle 0000310a
>>   /proc/device-tree/cpus/PowerPC,POWER8@0/ibm,phandle 10000000
>>   /proc/device-tree/cpus/l2-cache@2007/ibm,phandle 00002007
>>   /proc/device-tree/cpus/l3-cache@3101/ibm,phandle 00003101
>>   /proc/device-tree/pci@80000002000001b/ibm,phandle 2000001b
> 
> Some (the 1000xxxx) look like addresses as well.
> 
>>> So the hash array has 64 entries out which only 8 are populated. Using
>>> hash_32() populates 29 entries.
> 
>> On the G5 it's similarly inefficient:
>> [    0.007379] OF: of_populate_phandle_cache(242) Used entries: 31, hashed: 111
> 
>> And some output from a "real" pseries machine (IBM OF), which is
>> slightly better:
>> [    0.129467] OF: of_populate_phandle_cache(242) Used entries: 39, hashed: 81
> 
>> So yeah using hash_32() is quite a bit better in both cases.
> 
> Yup, no surprise there.  And hash_32 is very cheap to compute.
> 
>> And if I'm reading your patch right it would be a single line change to>> switch, so that seems like it's worth doing to me.
> 
> Agreed!
> 
> Btw.  Some OFs mangle the phandles some way, to make it easier to catch
> people using it as an address (and similarly, mangle ihandles differently,
> so you catch confusion between ihandles and phandles as well).  Like a
> simple xor, with some odd number preferably.  You should assume *nothing*
> about phandles, they are opaque identifiers.

For arm32 machines that use dtc to generate the devicetree, which is a
very large user base, we certainly can make assumptions about phandles.
Especially because the complaints about the overhead of phandle based
lookups have been voiced by users of this specific set of machines.

For systems with a devicetree that does not follow the assumptions, the
phandle cache should not measurably increase the overhead of phandle
based lookups.  For these systems, they might not see an overhead
reduction from the existence of the cache and they may or may not
see the overhead reduction.  This was explicitly stated during the
reviews of the possible phandle cache implementation alternatives.

If you have measurements of a system where implementing the phandle
cache increased the overhead, and the additional overhead is a concern
(such as significantly increasing boot time) then please share that
information with us.  Otherwise this is just a theoretical exercise.

-Frank

> 
> 
> Segher
> 

