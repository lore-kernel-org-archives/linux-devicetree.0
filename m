From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 2/6] kbuild: add dtc as dependency on .dtb files
Date: Thu, 1 Mar 2018 14:45:49 +0900
Message-ID: <CAK7LNAT+_0t4PQxW911a0xL-f54WHGbF8t3rEq2Pfngr3J7BOQ@mail.gmail.com>
References: <20180228233249.26281-1-robh@kernel.org> <20180228233249.26281-3-robh@kernel.org>
 <CAK7LNAQSJ1uzgmta76rJwDpi08SB5gwcRPxu_TPw0u0XzgGaJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNAQSJ1uzgmta76rJwDpi08SB5gwcRPxu_TPw0u0XzgGaJA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

2018-03-01 13:33 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> 2018-03-01 8:32 GMT+09:00 Rob Herring <robh@kernel.org>:
>> If dtc is rebuilt, we should rebuild .dtb files with the new dtc.
>>
>> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>
>
> Hmm, I am not 100% sure about this.
>
> Is there a case where resulted DTBs
> depend on DTC version?
>
>
> If I understand correctly,
> DTS and DTB are 1:1
> Unlike CC, there is no room for optimization.


Maybe I was wrong.

Is there room for optimization
in 'DT strings' section?

I guess it is optimized enough to avoid string duplication,
but there could be different results
without changing the specification.





> Some possibilities could be:
>      - specification is updated.
>     ( /dts-v1/ in DTS should be updated if so)
>   - buggy DTC version generates broken DTBs.
>
>


-- 
Best Regards
Masahiro Yamada
