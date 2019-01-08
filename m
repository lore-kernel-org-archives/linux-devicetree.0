From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: build dtb even without COMPILE_TEST
Date: Tue, 08 Jan 2019 21:14:07 +1100
Message-ID: <87bm4rtq1c.fsf@concordia.ellerman.id.au>
References: <1546595897-33291-1-git-send-email-clabbe@baylibre.com> <CAL_Jsq+Wo7kWTHg6f+HkTfq1=JN8r4iBrwSz9JRdJ0rhjyKSpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+Wo7kWTHg6f+HkTfq1=JN8r4iBrwSz9JRdJ0rhjyKSpg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Corentin Labbe <clabbe@baylibre.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Mark Rutland <mark.rutland@arm.com>, Paul Mackerras <paulus@samba.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Rob Herring <robh+dt@kernel.org> writes:
> On Fri, Jan 4, 2019 at 3:58 AM Corentin Labbe <clabbe@baylibre.com> wrote:
>>
>> I wanted to test the virtex440-ml507 qemu machine and found that the dtb
>> for it was not builded.
>
> Just do:
>
> make virtex440-ml507.dtb

I actually thought you had to do that, so I've never done anything different.

>> All powerpc DTB are only built when CONFIG_OF_ALL_DTBS is set which depend on
>> COMPILE_TEST.
>> But building DTB is not related to a "compile build test".
>
> But it is. We normally only build the dtbs for enabled platforms just
> like we only build platform/driver code for enabled platforms. It's
> hidden behind COMPILE_TEST so it only gets enabled for
> allmodconfig/allyesconfig builds.
>
>> So this patch made building of DTB independent of COMPILE_TEST (by
>> depending only on the PPC arch)
>> A better selection of which DTB to build could be done in the future
>> like that do the ARM arch.
>
> No reason you can't start that now for the platform you care about.
> You don't have to convert everyone.

Yeah that seems like the best option. I'm happy to take a patch just for
that target.

cheers
