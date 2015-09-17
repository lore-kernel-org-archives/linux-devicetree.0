From: Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2 11/11] devicetree: bindings: Remove deprecated properties
Date: Thu, 17 Sep 2015 19:33:37 +0900
Message-ID: <CANqRtoRMLTrG0n6GJcfA86kBAev2fUesZ_-V=1OMPwOW8XdkUQ@mail.gmail.com>
References: <20150917095325.5369.73893.sendpatchset@little-apple>
	<20150917095511.5369.41259.sendpatchset@little-apple>
	<CAMuHMdV5rgk0rcCz-8w6Jmq66iAnbA6RTUoFyXNU9CV6PcU4Dw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdV5rgk0rcCz-8w6Jmq66iAnbA6RTUoFyXNU9CV6PcU4Dw@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-sh list <linux-sh@vger.kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Simon Horman <horms+renesas@verge.net.au>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On Thu, Sep 17, 2015 at 7:04 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Sep 17, 2015 at 11:55 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
>> From: Magnus Damm <damm+renesas@opensource.se>
>>
>> The deprecated DT properies are part of the GIT history,
>
> properties

Oops!

>> no need to keep them around any longer.
>
> They're still in the driver because in-the-field R-Car Gen2 DTSes use them,
> right? You may add a comment in the driver, to prevent a janitor from
> re-adding them to the bindings.

Yes, good idea!

>> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>
> Nevertheless
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you!

/ magnus
