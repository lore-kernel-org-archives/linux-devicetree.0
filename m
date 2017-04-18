From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v6 17/39] platform: add video-multiplexer subdevice driver
Date: Tue, 18 Apr 2017 10:09:49 +0200
Message-ID: <1492502989.2432.23.camel@pengutronix.de>
References: <1490661656-10318-1-git-send-email-steve_longerbeam@mentor.com>
 <1490661656-10318-18-git-send-email-steve_longerbeam@mentor.com>
 <20170404124732.GD3288@valkosipuli.retiisi.org.uk>
 <1492091578.2383.39.camel@pengutronix.de> <20170414203216.GA10920@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170414203216.GA10920@amd>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pavel Machek <pavel@ucw.cz>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, Steve Longerbeam <steve_longerbeam@mentor.com>, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, linux@armlinux.org.uk, geert@linux-m68k.org, Steve Longerbeam <slongerbeam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>, jean-christophe.trotin@st.com, kernel@pe
List-Id: devicetree@vger.kernel.org

Hi Pavel,

On Fri, 2017-04-14 at 22:32 +0200, Pavel Machek wrote:
> Hi!
> 
> > > The MUX framework is already in linux-next. Could you use that instead of
> > > adding new driver + bindings that are not compliant with the MUX framework?
> > > I don't think it'd be much of a change in terms of code, using the MUX
> > > framework appears quite simple.
> > 
> > It is not quite clear to me how to design the DT bindings for this. Just
> > splitting the video-multiplexer driver from the mux-mmio / mux-gpio
> > would make it necessary to keep the video-multiplexer node to describe
> > the of-graph bindings. But then we have two different nodes in the DT
> > that describe the same hardware:
> > 
> > 	mux: mux {
> > 		compatible = "mux-gpio";
> > 		mux-gpios = <&gpio 0>, <&gpio 1>;
> > 		#mux-control-cells = <0>;
> > 	}
> > 
> > 	video-multiplexer {
> > 		compatible = "video-multiplexer"
> > 		mux-controls = <&mux>;
> > 
> > 		ports {
> > 			/* ... */
> > 		}
> > 	}
> > 
> > It would feel more natural to have the ports in the mux node, but then
> > how would the video-multiplexer driver be instanciated, and how would it
> > get to the of-graph nodes?
> 
> Device tree representation and code used to implement the muxing
> driver should be pretty independend, no? Yes, one piece of hardware
> should have one entry in the device tree,

I agree.

>  so it should be something like:
> 
>  	video-multiplexer {
>  		compatible = "video-multiplexer-gpio"	
>  		mux-gpios = <&gpio 0>, <&gpio 1>;
>  		#mux-control-cells = <0>;
> 
>  		mux-controls = <&mux>;
>  
>  		ports {
>  			/* ... */
>  		}
>  	}

That self-referencing mux-controls property looks a bit superfluous:

	mux: video-multiplexer {
		mux-controls = <&mux>;
	};

Other than that, I'm completely fine with splitting the compatible into
something like video-mux-gpio and video-mux-mmio and reusing the
mux-gpios property for video-mux-gpio.

> You should be able to use code in drivers/mux as a library...

This is a good idea in principle, but this requires some rework of the
mux subsystem, and that subsystem hasn't even landed yet. For now I'd
like to focus on getting the DT bindings right.

I'd honestly prefer to not add this rework as a requirement for the i.MX
media drivers to get into staging.

regards
Philipp
