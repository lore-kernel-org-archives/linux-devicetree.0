From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 5/6] arm: mvebu: Enable USB controllers on Armada XP
 OpenBlocks AX3-4 board
Date: Wed, 16 Jan 2013 20:37:13 +0100
Message-ID: <20130116203713.7b396070@skate>
References: <1358243670-11935-1-git-send-email-ezequiel.garcia@free-electrons.com>
	<1358243670-11935-5-git-send-email-ezequiel.garcia@free-electrons.com>
	<CABMQnVLD+VKj53dfQC24AwCboed3EGt+gqTKt-B9q8nhEx3Ytg@mail.gmail.com>
	<CALF0-+XKGk+ru3VZ6815KTu_Aj_daYafr+Y5WJ9dXUoFqbTHOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALF0-+XKGk+ru3VZ6815KTu_Aj_daYafr+Y5WJ9dXUoFqbTHOQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <elezegarcia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nobuhiro Iwamatsu <iwamatsu-+mkmVskJBflAfugRpC6u6w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michael Opdenacker <michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Ezequiel Garcia,

On Wed, 16 Jan 2013 16:16:59 -0300, Ezequiel Garcia wrote:

> >> +               usb@d0050000 {
> >> +                       status = "okay";
> >> +               };
> >> +               usb@d0051000 {
> >> +                       status = "okay";
> >> +               };
> >> +               usb@d0052000 {
> >> +                       status = "okay";
> >> +               };
> > USB2 of openblocks-ax3-4 is used as Mini-PCIE.
> > I think this is unnecessary.
> 
> Mmm... could you explain this with some more detail.
> Unfortunately, I don't have access to an Openblocks board to check on
> this, so I'd appreciate any clarification.
> 
> Is there any Openblocks datasheet or hardware schematics publicly
> available for me to look at?

As far as I know, there is no public document. I've been given access
to a PDF, in Japanese, that gives some details about the hardware.

>From what I can read, only 2 USB ports are used from the internal
Marvell EHCI controller.

Another USB port is available, but it is connected to a USB controller
that sits on the PCIe bus. And the PCIe interface on which this USB
controller is connected is not enabled in the default U-Boot shipped
with AX3-4 (at least not with the generation I have). I've been given
an U-Boot version that is supposed to enable this PCIe interface, but I
haven't tested yet.

Anyway, from a Marvell EHCI controller perspective, only two ports are
used, as Nobuhiro said. I am not sure which ports, but it seems like
the first two ones were used. One of the two physical ports is a
combined USB / eSATA port, but I don't think this makes any difference
at the software level.

I don't have the OpenBlocks AX3-4 with me right now, but I could
probably make a test on Friday.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
