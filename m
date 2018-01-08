From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 0/3] usb: renesas_usbhs: Add RZ/A1 support
Date: Mon, 8 Jan 2018 13:15:08 +0100
Message-ID: <CAMuHMdXu22ihgkVgPhCtbk9X21nyk3SFwGAiObEgcv=Kf2H-ow@mail.gmail.com>
References: <20180105224647.42262-1-chris.brandt@renesas.com>
 <CAMuHMdV+1Y+OozRa0P2MJZQ-rT+ZfmW4iy2AYya1EMgrjb+y8Q@mail.gmail.com> <SG2PR06MB1165E6B9D4C00EE2A98E8E348A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB1165E6B9D4C00EE2A98E8E348A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, USB list <linux-usb@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Mon, Jan 8, 2018 at 12:59 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Monday, January 08, 2018, Geert Uytterhoeven wrote:
>> Thanks for the update, but I think there has been a misunderstanding.
>> I didn't mean to drop "renesas,usbhs-r7s72100" everywhere, only from
>> the matching in the driver.
>
> Opps, I was all kinds of confused then.
>
> So, before I submit a V4, here is my understanding:
>
> drivers/.../common.c
>  * contains -only-  '.compatible = "renesas,rza1-usbhs"'

OK.

> Documentation/.../renesas_usbhs.txt
>  * contains both "renesas,usbhs-r7s72100" and "renesas,rza1-usbhs"

OK.

> r7s72100.dtsi
> * usbhs0: usb@e8010000 {
>     compatible = "renesas,usbhs-r7s72100", "renesas,rza1-usbhs";

OK.

> Is this correct?

Yes.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
