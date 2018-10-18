From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/4] nfc: pn532_uart: Add NXP PN532 to devicetree docs
Date: Thu, 18 Oct 2018 15:41:29 -0500
Message-ID: <20181018204129.GA25436@bogus>
References: <20181018144251.30028-1-poeschel@lemonage.de>
 <20181018144251.30028-2-poeschel@lemonage.de>
 <F2B73CDB-434A-41F5-8A9E-3E4E76DB89C9@holtmann.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <F2B73CDB-434A-41F5-8A9E-3E4E76DB89C9@holtmann.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Holtmann <marcel@holtmann.org>
Cc: Lars Poeschel <poeschel@lemonage.de>, devicetree <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Peter Rosin <peda@axentia.se>, Vadim Pasternak <vadimp@mellanox.com>, Lei YU <mine260309@gmail.com>, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 18, 2018 at 05:03:13PM +0200, Marcel Holtmann wrote:
> Hi Lars,
> 
> > Add pn532 to the trivial-devices.txt binding doc.
> > 
> > Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
> > ---
> > Documentation/devicetree/bindings/trivial-devices.txt | 1 +
> > 1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/trivial-devices.txt b/Documentation/devicetree/bindings/trivial-devices.txt
> > index 763a2808a95c..c580be08a380 100644
> > --- a/Documentation/devicetree/bindings/trivial-devices.txt
> > +++ b/Documentation/devicetree/bindings/trivial-devices.txt
> > @@ -172,6 +172,7 @@ nxp,pcf2129		Real-time clock
> > nxp,pcf8523		Real-time Clock
> > nxp,pcf8563		Real-time clock/calendar
> > nxp,pcf85063		Tiny Real-Time Clock
> > +nxp,pn532-uart		NXP PN532 NFC-/RFID-Chip, using UART interface
> 
> is this really such a trivial device? It doesn’t require any GPIO to enable / reset the NFC chip?

Considering it supports multiple interfaces, it is not.

The '-uart' can be dropped and the same compatible used for any 
of the bus connections because the device is bound based on the bus 
type.

Rob
