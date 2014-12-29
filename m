From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] ARM: shmobile: r8a7791: add ADSP clocks
Date: Mon, 29 Dec 2014 23:34:07 +0300
Message-ID: <54A1BABF.5070208@cogentembedded.com>
References: <1937156.Ii2YrGkOFy@wasted.cogentembedded.com> <CAMuHMdUqC5v-d95Sk2NewSE-EBKS49vn7jPKpixF2djg6NOmVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUqC5v-d95Sk2NewSE-EBKS49vn7jPKpixF2djg6NOmVw@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, Linux-sh list <linux-sh@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 12/29/2014 11:24 PM, Geert Uytterhoeven wrote:

>> --- renesas.orig/include/dt-bindings/clock/r8a7791-clock.h
>> +++ renesas/include/dt-bindings/clock/r8a7791-clock.h

>> -#define R8A7791_CLK_RCAN               9
>> +#define R8A7791_CLK_ADSP               9
>> +#define R8A7791_CLK_RCAN               10

> R8A7791_CLK_RCAN is changed?

    Yes. It shouldn't be?

> Gr{oetje,eeting}s,
>                          Geert

WBR, Sergei

