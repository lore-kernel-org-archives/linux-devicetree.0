From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] powerpc: dts: use #include "..." to include local DT
Date: Wed, 14 Jun 2017 14:55:00 +0900
Message-ID: <CAK7LNAS0tkpCuCjjCe=P_Qc2Q12B-+7YgAipko5n+AoeASpQnQ@mail.gmail.com>
References: <1495602744-18874-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNARnkHTyAMXjPZnOxOkP_b8vc6qvYOv-wf_Fn0eaPSdpeA@mail.gmail.com> <87r2yogpc6.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87r2yogpc6.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, Anatolij Gustschin <agust@denx.de>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi.


2017-06-13 19:21 GMT+09:00 Michael Ellerman <mpe@ellerman.id.au>:
> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
>
>> Hi
>>
>> (+Anatolij Gustschin <agust@denx.de>)
>>
>>
>> Ping.
>> I am not 100% sure who is responsible for this,
>> but somebody, could take a look at this patch, please?
>
> Have you tested it actually works?
>
> It sounds reasonable, and if it behaves as you describe there is no
> change in behaviour, right?


I do not have access to hardware,
but it is pretty easy to test this patch.


$ make O=foo ARCH=powerpc CROSS_COMPILE=powerpc-linux-  dts/ac14xx.dtb

gave me the DTB output.

The binary comparison matched with/without this patch,
so I am sure there is no change in behavior.

Likewise for mpc5121ads and pdm360ng.


Double-check by Anatolij was very appreciated.




-- 
Best Regards
Masahiro Yamada
