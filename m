From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v5 1/2] ARM: shmobile: r8a7790: add internal PCI bridge
 nodes
Date: Thu, 26 Jun 2014 16:34:59 +0400
Message-ID: <53AC1373.5010501@cogentembedded.com>
References: <201406242157.05973.sergei.shtylyov@cogentembedded.com>	<201406242159.55373.sergei.shtylyov@cogentembedded.com>	<53AB89B3.9020207@renesas.com> <CANqRtoSsx+NAz2W_utN-A2fx+=e_Ywt5eD=Tf9uGnEDvk3w-PQ@mail.gmail.com> <53AB9581.7090806@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <53AB9581.7090806@renesas.com>
Sender: linux-sh-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>
Cc: "horms@verge.net.au" <horms@verge.net.au>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "ben.dooks@codethink.co.uk" <ben.dooks@codethink.co.uk>
List-Id: devicetree@vger.kernel.org

Hello.

On 06/26/2014 07:37 AM, Yoshihiro Shimoda wrote:

>>>> From: Ben Dooks <ben.dooks@codethink.co.uk>

>>>> Add device nodes for the R8A7790 internal PCI bridge devices.

>>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>>> Reviewed-by: Ian Molton <ian.molton@codethink.co.uk>
>>>> [Sergei: added several properties to the PCI bridge nodes]
>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

>>> Thank you for the patch!

>>> I tested this patch on my lager board and a usb memory, and it works.

>>> Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

>> Thanks for testing. Just one quick question from my side: Which USB
>> port did you test?

> I tested usb ch1 only...

    Note that channel #2 also should work.

>> I somehow assumed that at least the majority of the USB ports on R-Car
>> Gen2 require a USB PHY device driver to work?
>
> Thank you for the point.
> About usb ch1, a USB PHY device driver doesn't need, I think.
> But, about ch0 and ch2, I think that they should require a USB PHY device driver.

    Only channel #0 requires the PHY driver as the default routing for USB0 is 
to USBHS; channel #2 is routed to OHCI/EHCI by default.

> Best regards,
> Yoshihiro Shimoda

WBR, Sergei

