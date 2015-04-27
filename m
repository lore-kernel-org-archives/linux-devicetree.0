From: "Reizer, Eyal" <eyalr@ti.com>
Subject: RE: [PATCH 1/1] Documentation: Add dt-binding for TI-btwilink driver
Date: Mon, 27 Apr 2015 06:33:57 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B2365AA56@DFRE01.ent.ti.com>
References: <1430106433-7132-1-git-send-email-gigi.joseph@ti.com>
 <AE3797AF-6797-44E0-828C-6498DB73980F@holtmann.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AE3797AF-6797-44E0-828C-6498DB73980F@holtmann.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Holtmann <marcel@holtmann.org>, Gigi Joseph <gigi.joseph@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Gigi, Joseph" <gigi.joseph@ti.com>, "Ziv, Dotan" <dotanz@ti.com>
List-Id: devicetree@vger.kernel.org

Hi Marcel,

> -----Original Message-----
> From: Marcel Holtmann [mailto:marcel@holtmann.org]
> Sent: Monday, April 27, 2015 7:32 AM
> To: Gigi Joseph
> Cc: devicetree@vger.kernel.org; Rob Herring; Pawel Moll; Mark Rutland; Ian
> Campbell; Kumar Gala; linux-kernel@vger.kernel.org; Gigi, Joseph
> Subject: Re: [PATCH 1/1] Documentation: Add dt-binding for TI-btwilink driver
> 
> Hi Gigi,
> 
> > btwilink binds bluetooth hci0 interface with the shared transport
> > driver
> >
> > Signed-off-by: Gigi Joseph <gigi.joseph@ti.com>
> > ---
> > Documentation/devicetree/bindings/btwilink.txt | 15 +++++++++++++++
> > 1 file changed, 15 insertions(+)
> > create mode 100644 Documentation/devicetree/bindings/btwilink.txt
> >
> > diff --git a/Documentation/devicetree/bindings/btwilink.txt
> > b/Documentation/devicetree/bindings/btwilink.txt
> > new file mode 100644
> > index 0000000..d286aea
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/btwilink.txt
> > @@ -0,0 +1,15 @@
> > +btwilink
> > +--------
> > +
> > +Required properties:
> > +
> > +	- compatible : must be "ti,btwilink"
> > +
> > +Example:
> > +
> > +Enable the btwilink driver to bind the bluetooth hci0 interface with
> > +ti-st shared transport driver
> > +
> > +btwilink {
> > +	compatible = "ti,btwilink";
> > +};
> 
> actually I wonder if someone finally starts re-writing the TI-ST driver to
> integrate with the new Bluetooth subsystem features (like hdev->setup,
> __hci_cmd_sync and h4_recv_buf) so that this complicated setup is no longer
> needed.
> 
> I do not think we actually would need a shared transport at all. We should
> have a Bluetooth HCI driver that can have children for FM radio and GPS
> exposed. Exposing proper platform devices with Bluetooth HCI as parent
> makes sense. The shared transport is not really a parent. First and foremost,
> this is a Bluetooth chip. The FM radio and GPS features are just glued on top of
> it.
> 

Thank you for your suggestion!
One clarification: Wilink8 is not a Bluetooth chip.
It is a combo device that includes wlan subsystem (connected over sdio) and bluetooth+gps connected using a single physical uart.
The shared transport abstracts this single uart to look like two separated devices to the system.
It was written in the past and is being used today by all the wilink family based products.
My suggestion is to take a two steps approach here:

1. For the short term we need it updated in upstream (right now it is broken since 3.8 as it is lacking support for device tree) and all customers need to patch it manually.
2. Once we have it updated we can look into switching from using shared transport to the mechanism you describe above. 
    We would need to study it and make sure it can fully replace the shared transport driver.

Best Regards,
Eyal
