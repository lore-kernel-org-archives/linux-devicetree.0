From: Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v4 05/06] devicetree: bindings: Remove unused 32-bit CMT bindings
Date: Tue, 15 Mar 2016 10:18:23 +0900
Message-ID: <CANqRtoReyc+1NKXXupVShSrGcM8MPtA0JLHMjG31ABLbcQKCRQ@mail.gmail.com>
References: <20160314142342.17180.21352.sendpatchset@little-apple>
	<20160314142434.17180.92245.sendpatchset@little-apple>
	<56E6F30B.9090707@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <56E6F30B.9090707@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Tue, Mar 15, 2016 at 2:21 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Hello.
>
> On 03/14/2016 05:24 PM, Magnus Damm wrote:
>
>> From: Magnus Damm <damm+renesas@opensource.se>
>>
>> Remove the 32-bit CMT compat strings to reduce maintenance burden.
>>
>> It should be fine to break DT compatibility because the 32-bit
>> 32-bit
>
>
>    Once is enough. :-)

Right, forgot about that one. Think of it as 64-bit compatible. =)

Cheers,

/ magnus
