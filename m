Return-Path: <SRS0=W1u3=GL=gmail.com=richardcochran@kernel.org>
Date: Wed, 21 Mar 2018 14:36:36 -0700
From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next RFC V1 5/5] net: mdio: Add a driver for InES
 time stamping IP core.
Message-ID: <20180321213636.2mmfveu2vg5qbwpp@localhost>
References: <cover.1521656774.git.richardcochran@gmail.com>
 <e9def53dd0f751d7f5e3df47e604d7ccb6020159.1521656774.git.richardcochran@gmail.com>
 <20180321193315.GR24516@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180321193315.GR24516@lunn.ch>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 21, 2018 at 08:33:15PM +0100, Andrew Lunn wrote:
> Can you point us at some documentation for this.

The overall one-step functionality is described IEEE 1588.

> I think Florian and I want to better understand how this device works,
> in order to understand your other changes.

The device is from here:

   https://www.zhaw.ch/en/engineering/institutes-centres/ines/products-and-services/ptp-ieee-1588/ptp-hardware/#c43991

The only other docs that I have is a PDF of the register layout, but I
don't think I can redistribute that.  Actually, there really isn't any
detail in that doc at all.

Thanks,
Richard
