Return-Path: <SRS0=W1u3=GL=gmail.com=richardcochran@kernel.org>
Date: Wed, 21 Mar 2018 15:47:02 -0700
From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next RFC V1 5/5] net: mdio: Add a driver for InES
 time stamping IP core.
Message-ID: <20180321224702.cbcq3wckmojsrgjf@localhost>
References: <cover.1521656774.git.richardcochran@gmail.com>
 <e9def53dd0f751d7f5e3df47e604d7ccb6020159.1521656774.git.richardcochran@gmail.com>
 <20180321193315.GR24516@lunn.ch>
 <20180321213636.2mmfveu2vg5qbwpp@localhost>
 <20180321214436.GX24516@lunn.ch>
 <20180321215729.engnoxpaympvvdc5@localhost>
 <20180321221652.GZ24516@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180321221652.GZ24516@lunn.ch>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 21, 2018 at 11:16:52PM +0100, Andrew Lunn wrote:
> The MAC drivers are clients of this device. They then use a phandle
> and specifier:
> 
> 	eth0: ethernet-controller@72000 {
> 		compatible = "marvell,kirkwood-eth";
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 		reg = <0x72000 0x4000>;
> 
> 		timerstamper = <&timestamper 2>
> 	}
> 
> The 2 indicates this MAC is using port 2.
> 
> The MAC driver can then do the standard device tree things to follow
> the phandle to get access to the device and use the API it exports.

But that would require hacking every last MAC driver.

I happy to improve the modeling, but the solution should be generic
and work for every MAC driver.

Thanks,
Richard
