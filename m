From: Lars Poeschel <poeschel@lemonage.de>
Subject: Re: [PATCH v2 2/4] nfc: pn532_uart: Add NXP PN532 to devicetree docs
Date: Fri, 19 Oct 2018 11:12:21 +0200
Message-ID: <20181019091221.GB26696@lem-wkst-02.lemonage>
References: <20181018144251.30028-1-poeschel@lemonage.de>
 <20181018144251.30028-2-poeschel@lemonage.de>
 <F2B73CDB-434A-41F5-8A9E-3E4E76DB89C9@holtmann.org>
 <20181018204129.GA25436@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181018204129.GA25436@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, devicetree <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Peter Rosin <peda@axentia.se>, Vadim Pasternak <vadimp@mellanox.com>, Lei YU <mine260309@gmail.com>, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 18, 2018 at 03:41:29PM -0500, Rob Herring wrote:
> On Thu, Oct 18, 2018 at 05:03:13PM +0200, Marcel Holtmann wrote:
> > Hi Lars,
> > 
> > > Add pn532 to the trivial-devices.txt binding doc.
> > > 
> > > Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
> > > ---
> > > Documentation/devicetree/bindings/trivial-devices.txt | 1 +
> > > 1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/trivial-devices.txt b/Documentation/devicetree/bindings/trivial-devices.txt
> > > index 763a2808a95c..c580be08a380 100644
> > > --- a/Documentation/devicetree/bindings/trivial-devices.txt
> > > +++ b/Documentation/devicetree/bindings/trivial-devices.txt
> > > @@ -172,6 +172,7 @@ nxp,pcf2129		Real-time clock
> > > nxp,pcf8523		Real-time Clock
> > > nxp,pcf8563		Real-time clock/calendar
> > > nxp,pcf85063		Tiny Real-Time Clock
> > > +nxp,pn532-uart		NXP PN532 NFC-/RFID-Chip, using UART interface
> > 
> > is this really such a trivial device? It doesn’t require any GPIO to enable / reset the NFC chip?

It does not require any additional things like GPIO or Interrupts. These
are optional and at the moment not supported by the driver.

> Considering it supports multiple interfaces, it is not.
> 
> The '-uart' can be dropped and the same compatible used for any 
> of the bus connections because the device is bound based on the bus 
> type.

Ok.
I drop the '-uart' part from the compatible string and provide a
seperate, little binding doc, documenting the compatible string used.

But does this also have consequences for the already existing -i2c
driver? This one uses 'nxp,pn532-i2c' as compatible string.

Thanks,
Lars
