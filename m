From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 0/6] dtc updates for 4.17
Date: Thu, 1 Mar 2018 13:43:59 +0900
Message-ID: <CAK7LNARdHBVBw_7ftyTEtyJ5KSX03dqB7y+=o2xQH1rYPtChTQ@mail.gmail.com>
References: <20180228233249.26281-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180228233249.26281-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

2018-03-01 8:32 GMT+09:00 Rob Herring <robh@kernel.org>:
> This series updates building dtc with flex and bison rather than using
> the _shipped files and updates dtc to the current upstream version. The
> new dtc adds some new warnings, so turn off the noisiest ones. While
> here adjusting the warnings, we can also now re-enable some that have
> gotten fixed.
>
> Yamada-san, I figured out why you wanted the dtc update after I wrote
> the patch to remove the shipped files... :) I guess you may already have
> a similar patch.


Exactly, this is what I expected.

What I blocked me was ambiguous grammar
as I mentioned in:
https://www.spinics.net/lists/kernel/msg2670836.html



> I suppose the first patch should go into 4.16, but
> nothing needs the fix yet. So it may be easier if you can just ack it
> and I'll keep it with the rest of the series.

Just browsing the series, nothing of the rest of it depends on 1/6
but feel free to pick it to your tree if you want.





-- 
Best Regards
Masahiro Yamada
