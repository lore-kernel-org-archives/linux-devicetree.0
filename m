From: Nobuhiro Iwamatsu <iwamatsu-+mkmVskJBflAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 5/6] arm: mvebu: Enable USB controllers on Armada XP
 OpenBlocks AX3-4 board
Date: Sat, 19 Jan 2013 09:07:51 +0900
Message-ID: <CABMQnVLtXfs+bUsSm0xN6KRO8hCeaqy6xKbRaHS-qX0OdiZfbQ@mail.gmail.com>
References: <1358243670-11935-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1358243670-11935-5-git-send-email-ezequiel.garcia@free-electrons.com>
 <CABMQnVLD+VKj53dfQC24AwCboed3EGt+gqTKt-B9q8nhEx3Ytg@mail.gmail.com>
 <CALF0-+XKGk+ru3VZ6815KTu_Aj_daYafr+Y5WJ9dXUoFqbTHOQ@mail.gmail.com> <20130116203713.7b396070@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130116203713.7b396070@skate>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <elezegarcia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michael Opdenacker <michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Thomas, Thank you for the detailed explanation.

Ezequiel, I checked your patch on OpenBlocks AX3, work fine.

But I have a question. your patch "arm: mvebu: Add support for USB
host controllers in Armada 370/XP"
was set USB controller of 0xd0050000 to IRQ 45. I think this is 47,
and 0xd0052000 is 45.
Because manual has been written irq 45 is USB2.
I'm sorry if if my lack of understanding or typo in the manual.

Best regards,
  Nobuhiro

On Thu, Jan 17, 2013 at 4:37 AM, Thomas Petazzoni
<thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Dear Ezequiel Garcia,
>
> On Wed, 16 Jan 2013 16:16:59 -0300, Ezequiel Garcia wrote:
>
>> >> +               usb@d0050000 {
>> >> +                       status = "okay";
>> >> +               };
>> >> +               usb@d0051000 {
>> >> +                       status = "okay";
>> >> +               };
>> >> +               usb@d0052000 {
>> >> +                       status = "okay";
>> >> +               };
>> > USB2 of openblocks-ax3-4 is used as Mini-PCIE.
>> > I think this is unnecessary.
>>
>> Mmm... could you explain this with some more detail.
>> Unfortunately, I don't have access to an Openblocks board to check on
>> this, so I'd appreciate any clarification.
>>
>> Is there any Openblocks datasheet or hardware schematics publicly
>> available for me to look at?
>
> As far as I know, there is no public document. I've been given access
> to a PDF, in Japanese, that gives some details about the hardware.
>
> From what I can read, only 2 USB ports are used from the internal
> Marvell EHCI controller.
>
> Another USB port is available, but it is connected to a USB controller
> that sits on the PCIe bus. And the PCIe interface on which this USB
> controller is connected is not enabled in the default U-Boot shipped
> with AX3-4 (at least not with the generation I have). I've been given
> an U-Boot version that is supposed to enable this PCIe interface, but I
> haven't tested yet.
>
> Anyway, from a Marvell EHCI controller perspective, only two ports are
> used, as Nobuhiro said. I am not sure which ports, but it seems like
> the first two ones were used. One of the two physical ports is a
> combined USB / eSATA port, but I don't think this makes any difference
> at the software level.
>
> I don't have the OpenBlocks AX3-4 with me right now, but I could
> probably make a test on Friday.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com



-- 
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org}
   GPG ID: 40AD1FA6
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
