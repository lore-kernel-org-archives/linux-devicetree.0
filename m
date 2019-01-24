From: Lars Poeschel <poeschel@lemonage.de>
Subject: Re: [PATCH v5 2/7] nfc: pn532_uart: Add NXP PN532 to devicetree docs
Date: Thu, 24 Jan 2019 11:02:10 +0100
Message-ID: <20190124100209.GA8674@lem-wkst-02.lemonage>
References: <20190111161812.26325-1-poeschel@lemonage.de>
 <20190111161812.26325-2-poeschel@lemonage.de>
 <20190115195902.GA3106@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190115195902.GA3106@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, open list <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 15, 2019 at 01:59:02PM -0600, Rob Herring wrote:
> On Fri, 11 Jan 2019 17:18:05 +0100, Lars Poeschel wrote:
> > Add a simple binding doc for the pn532.
> > 
> > Cc: Johan Hovold <johan@kernel.org>
> > Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
> > ---
> > Changes in v4:
> > - Add documentation about reg property in case of i2c
> > 
> > Changes in v3:
> > - seperate binding doc instead of entry in trivial-devices.txt
> > 
> >  .../devicetree/bindings/nfc/pn532.txt         | 33 +++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/nfc/pn532.txt
> > 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.

Thanks for the clarification! To be clear: It was not intentional to not
add your tag. It was unknowingness.

Thanks again,
Lars
