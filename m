From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r8a7795: salvator-xs: enable
 USB2.0 phy channel 3
Date: Mon, 2 Oct 2017 09:45:07 +0100
Message-ID: <8642690f-a37b-2de3-7f59-9f0be99ef170@ideasonboard.com>
References: <1506925789-19392-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1506925789-19392-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdUGU-6c=QoekksFfpoP1x15vUmFu272wd5YqqnQe-RwmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUGU-6c=QoekksFfpoP1x15vUmFu272wd5YqqnQe-RwmA@mail.gmail.com>
Content-Language: en-GB
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Kieran Bingham <kieran@ksquared.org.uk>, =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
List-Id: devicetree@vger.kernel.org

Hi Geert, Shimoda-san,

On 02/10/17 09:20, Geert Uytterhoeven wrote:
> Hi Shimoda-san,
> 
> On Mon, Oct 2, 2017 at 8:29 AM, Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
>> This patch enables the USB2.0 phy channel 3. R-Car H3 ES2.0 has
>> this channel and we can use it on the Salvator-XS.
>>
>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
>> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
>> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
>> @@ -99,6 +99,11 @@
>>                 groups = "usb2";
>>                 function = "usb2";
>>         };
>> +
>> +       usb2_ch3_pins: usb2_ch3 {
>> +               groups = "usb2_ch3";
>> +               function = "usb2_ch3";
>> +       };
>>  };
> 
> Using these pins requires changing SW31, disabling the interrupt capabilities
> of the ADV7482? Does the ADV7482 still work after that?

The ADV7482 is currently working without interrupts at the moment. However, I do
have hotplug and interrupt handling on my todo list, and infact I have already
started a patch adding interrupt support.


The DT currently specifies the following interrupts for the ADV7482,

+	video-receiver@70 {
+		compatible = "adi,adv7482";
+		interrupt-parent = <&gpio6>;
+		interrupt-names = "intrq1", "intrq2";
+		interrupts = <30 IRQ_TYPE_LEVEL_LOW>,
+			     <31 IRQ_TYPE_LEVEL_LOW>;

And the start of interrupt handling looks like: (this is not integrated, nor
finished):

https://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git/commit/?h=adv748x/dev&id=82c7d0100edd28fa429c3811c575bad7a4d92cfd

This purely registers the interrupts currently; so if I need to do anything
differently to handle the USB2 conflict, please let me know.

As for going forwards, I believe that the ADV7482 can actually configure what
interrupts are triggered on either interrupt source, (INTRQ1/INTRQ2) and
therefore we could potentially get by with only INTRQ1, (INT 30) if we needed
to; however it would be good to handle this conflict in a generic way.


Regards

Kieran

> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
