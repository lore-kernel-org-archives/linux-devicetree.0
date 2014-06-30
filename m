From: punnaiah choudary kalluri <punnaia@xilinx.com>
Subject: Re: [PATCH v2 2/2] usb: chipidea: Add support for zynq usb host and
 device controller
Date: Mon, 30 Jun 2014 09:02:07 +0530
Message-ID: <CAGnW=BaRNQZhcg-=sY-vUoh8aSdHNeP7HY5VjmjoChbnMGH9cQ@mail.gmail.com>
References: <1403868233-5123-1-git-send-email-punnaia@xilinx.com>
	<fa656d2d-a2a8-4b8d-a29b-e89e4bfced3e@BL2FFO11FD034.protection.gbl>
	<20140627125515.GA6025@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140627125515.GA6025@pengutronix.de>
Sender: linux-doc-owner@vger.kernel.org
To: Michael Grzeschik <mgr@pengutronix.de>
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Peter Chen <Peter.Chen@freescale.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Kumar Gala <galak@codeaurora.org>, rdunlap@infradead.org, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, Punnaiah Choudary <kpc528@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 27, 2014 at 6:25 PM, Michael Grzeschik <mgr@pengutronix.de> wrote:
> Hi,
>
> On Fri, Jun 27, 2014 at 04:53:53PM +0530, Punnaiah Choudary Kalluri wrote:
>> Zynq soc uses Chipidea/Synopsys usb IP core(CI13612). This patch adds
>> necessary glue to allow the chipidea driver to work on zynq soc.
>>
>
> Did you see the currently discussed patches for the generic chipidea
> glue?
>
> http://www.spinics.net/lists/linux-usb/msg109576.html

I have not seen this patch and thanks for pointing this

>
> Try to improve that code instead writing another version
> of this simple gluecode.

Sure.  i will check this patch and see if anything to be added for zynq
in a generic way.

Thanks,
Punnaiah

>
>
> Thanks,
> Michael
>
>
> --
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
