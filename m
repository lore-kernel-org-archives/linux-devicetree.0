From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 2/2] ARM: dts: r8a7743: Add IIC cores to dtsi
Date: Tue, 22 Aug 2017 15:20:44 +0300
Message-ID: <0b7c2e3e-e620-fc47-6bca-6ec4e6b4efb2@cogentembedded.com>
References: <1502196418-31341-1-git-send-email-biju.das@bp.renesas.com>
 <12d923ba-184c-ef59-f27b-41a7592a5f93@cogentembedded.com>
 <20170810080121.GE16647@verge.net.au> <20170810112411.GA4380@katana>
 <TY1PR06MB0702EA22AFE7D8145BF623A6B7880@TY1PR06MB0702.apcprd06.prod.outlook.com>
 <CAMuHMdXX0BRvWOc4iosiYNWuA4tP2BpLF5kndNrDL4FeKctgkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXX0BRvWOc4iosiYNWuA4tP2BpLF5kndNrDL4FeKctgkA@mail.gmail.com>
Content-Language: en-MW
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Chris Paterson <Chris.Paterson2@renesas.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Simon Horman <horms@verge.net.au>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Biju Das <biju.das@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello!

On 08/14/2017 05:15 PM, Geert Uytterhoeven wrote:

>>> From: Wolfram Sang [mailto:wsa@the-dreams.de]
>>> Sent: 10 August 2017 12:24
>>>
>>>
>>>>>> +                i2c6: i2c@e60b0000 {
>>>>>
>>>>>     I'd use iic0 as the label.
> 
> Sergei: I assume you meant "iic3"? ;-)

    After having a look at the manual, yes. :-)

[...]

> Gr{oetje,eeting}s,
> 
>                          Geert

MBR, Sergei
