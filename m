From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH V5 net-next 4/6] dt-bindings: ptp: Introduce MII time
 stamping devices.
Date: Mon, 8 Jul 2019 22:11:24 -0700
Message-ID: <20190709051124.vf2au5htyhghk4yx@localhost>
References: <cover.1559281985.git.richardcochran@gmail.com>
 <d786656435c64160d50014beb3d3d9d1aaf6f22d.1559281985.git.richardcochran@gmail.com>
 <20190708213837.GA28934@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190708213837.GA28934@bogus>
Sender: netdev-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: netdev@vger.kernel.org, David Miller <davem@davemloft.net>, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 08, 2019 at 03:38:37PM -0600, Rob Herring wrote:
> > +Required properties of the control node:
> > +
> > +- compatible:		"ines,ptp-ctrl"
> 
> This is an IP block that gets integrated into SoCs?

It is an IP block implemented in an FPGA (like the zync or the socfpga).

> It's not very 
> specific given that there could be different versions of the IP block 
> and SoC vendors can integrate various versions of the IP block in their 
> own unique (i.e. buggy) way.

There is a version register where both the interface and FPGA are
versioned.  The driver doesn't presently do anything with that field,
but if newer interfaces appear, then the driver can deal with that
without any DT help.

Thanks,
Richard
