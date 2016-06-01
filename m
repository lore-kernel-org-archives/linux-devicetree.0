From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 13/13] ARM: dts: blanche: add Ethernet support
Date: Wed, 1 Jun 2016 15:16:30 +0300
Message-ID: <a60346f2-2abb-342b-dd20-38d401c4ceb3@cogentembedded.com>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <1669958.qjJ7i3NBPv@wasted.cogentembedded.com>
 <CAMuHMdU2P6VKXNpEHGOKpyuM45Pk0CuHWngxwu5AYGqYfduXXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdU2P6VKXNpEHGOKpyuM45Pk0CuHWngxwu5AYGqYfduXXg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 6/1/2016 11:22 AM, Geert Uytterhoeven wrote:

>> --- renesas.orig/arch/arm/boot/dts/r8a7792-blanche.dts
>> +++ renesas/arch/arm/boot/dts/r8a7792-blanche.dts
>
>> +       ethernet@18000000 {
>> +               compatible = "smsc,lan89218", "smsc,lan9115";
>
> The "smsc,lan89218" needs to be documented in the device tree bindings.

    Have you looked at those bindings?

> Google couldn't find any evidence you submitted a patch for that.

    Because the bindings document *any* LAN9115 compatible chip already.

> Gr{oetje,eeting}s,
>
>                         Geert

MBR, Sergei
