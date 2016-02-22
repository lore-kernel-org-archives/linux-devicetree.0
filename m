From: John Keeping <john@metanate.com>
Subject: Re: Disabling graph endpoints in device trees
Date: Mon, 22 Feb 2016 17:26:00 +0000
Message-ID: <20160222172600.67904681.john@metanate.com>
References: <20160222141438.79de430c.john@metanate.com>
	<1456157547.5148.44.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456157547.5148.44.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

Hi Phillipp,

On Mon, 22 Feb 2016 17:12:27 +0100, Philipp Zabel wrote:
> Am Montag, den 22.02.2016, 14:14 +0000 schrieb John Keeping:
> > Is there a reason why endpoints in a device tree graph can't be
> > disabled?  
> 
> You can always remove them using /delete-node/, which also has the
> advantage of reminding you not to leave a single dangling endpoint.

Thanks, I wasn't aware of /delete-node/.  It does indeed do what I want.

> > I would like to be able to force the use of a particular CRTC for
> > certain outputs even though the hardware is capable of connecting any
> > CRTC to any output.  In this case I need to be able to support a wide
> > range of frequencies for external HDMI monitors so I will configure one
> > of the CRTCs to be able to generate these while the other will be tied
> > into a limited set of clock rates as a result of the overall system
> > clock setup.
> > 
> > Currently this can only be achieved by removing the endpoints from the
> > base SoC .dtsi file but it feels like it should be possible to add
> > 'status = "disabled"' to the nodes in the board-specific .dts in order
> > to disable undesirable configurations.
> >
> > I tested the change below and it behaves exactly as I want, but I don't
> > claim to understand all of the users of these functions to know if it
> > will break something else (hence this isn't a formal patch).  
> 
> I don't know that any driver depends on being able to parse disabled
> endpoints, but given the above I'm not sure that keeping disabled
> endpoints in the device tree is a useful feature.
> Disabling ports makes more sense to me. It should be documented in
> Documentation/devicetree/bindings/graph.txt though.

That isn't relevent for my scenario because this case has a port with
multiple endpoints and we only want one of the endpoints to be
available:

	vopb_out: port {
		#address-cells = <1>;
		#size-cells = <0>;

		vopb_out_hdmi: endpoint@0 {
			reg = <0>;
			remote-endpoint = <&hdmi_in_vopb>;
		};
		vopb_out_mipi: endpoint@1 {
			reg = <1>;
			remote-endpoint = <&mipi_in_vopb>;
		};
	};

But I'm happy that /delete-node/ works and seems to be the right thing
to do.


Thanks,
John
