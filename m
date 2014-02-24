From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC PATCH] [media]: of: move graph helpers from
 drivers/media/v4l2-core to drivers/of
Date: Mon, 24 Feb 2014 18:36:29 +0100
Message-ID: <1393263389.3091.82.camel@pizza.hi.pengutronix.de>
References: <1392119105-25298-1-git-send-email-p.zabel@pengutronix.de>
	 < CAL_Jsq+U9zU1i+STLHMBjY5BeEP6djYnJVE5X1ix-D2q_zWztQ@mail.gmail.com>
	 < 20140217181451.7EB7FC4044D@trevor.secretlab.ca>
	 <20140218070624.GP17250@ pengutronix.de>
	 <20140218162627.32BA4C40517@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140218162627.32BA4C40517-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Dienstag, den 18.02.2014, 16:26 +0000 schrieb Grant Likely:
> On Tue, 18 Feb 2014 08:06:24 +0100, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > Hi Grant,
> > 
> > On Mon, Feb 17, 2014 at 06:14:51PM +0000, Grant Likely wrote:
> > > On Tue, 11 Feb 2014 07:56:33 -0600, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > > > On Tue, Feb 11, 2014 at 5:45 AM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > > > > From: Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > > >
> > > > > This patch moves the parsing helpers used to parse connected graphs
> > > > > in the device tree, like the video interface bindings documented in
> > > > > Documentation/devicetree/bindings/media/video-interfaces.txt, from
> > > > > drivers/media/v4l2-core to drivers/of.
> > > > 
> > > > This is the opposite direction things have been moving...
> > > > 
> > > > > This allows to reuse the same parser code from outside the V4L2 framework,
> > > > > most importantly from display drivers. There have been patches that duplicate
> > > > > the code (and I am going to send one of my own), such as
> > > > > http://lists.freedesktop.org/archives/dri-devel/2013-August/043308.html
> > > > > and others that parse the same binding in a different way:
> > > > > https://www.mail-archive.com/linux-omap-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg100761.html
> > > > >
> > > > > I think that all common video interface parsing helpers should be moved to a
> > > > > single place, outside of the specific subsystems, so that it can be reused
> > > > > by all drivers.
> > > > 
> > > > Perhaps that should be done rather than moving to drivers/of now and
> > > > then again to somewhere else.
> > > 
> > > This is just parsing helpers though, isn't it? I have no problem pulling
> > > helper functions into drivers/of if they are usable by multiple
> > > subsystems. I don't really understand the model being used though. I
> > > would appreciate a description of the usage model for these functions
> > > for poor folks like me who can't keep track of what is going on in
> > > subsystems.
> > 
> > You can find it under Documentation/devicetree/bindings/media/video-interfaces.txt
> 
> Okay, I think I'm okay with moving the helpers, but I will make one
> requirement. I would like to have a short binding document describing
> the pattern being used. The document above talks a lot about video
> specific issues, but the helpers appear to be specifically about the
> tree walking properties of the API.

Reusing the non-video-secific parts of video-interfaces.txt, how about
the following:

"Common bindings for device graphs"

General concept
---------------

The hierarchical organisation of the device tree is well suited to describe
control flow to devices, but data flow between devices that work together to
form a logical compound device can follow arbitrarily complex graphs.
The device tree graph bindings allow to describe data bus connections between
individual devices, that can't be inferred from device tree parent-child
relationships. The common bindings do not contain any information about the
direction or type of data flow, they just map connections. Specific properties
of the connections can be set depending on the type of connection. To see
how this binding applies to video pipelines, see for example
Documentation/device-tree/bindings/media/video-interfaces.txt.

Data interfaces on devices are described by their child 'port' nodes. The port
node contains an 'endpoint' subnode for each remote device connected to this
port via a bus. If a port is connected to more than one remote device on the
same bus, an 'endpoint' child node must be provided for each of them. If more
than one port is present in a device node or there is more than one endpoint at
a port, or port node needs to be associated with a selected hardware interface,
a common scheme using '#address-cells', '#size-cells' and 'reg' properties is
used.

device {
	...
	#address-cells = <1>;
	#size-cells = <0>;

	port@0 {
		...
		endpoint@0 { ... };
		endpoint@1 { ... };
	};

	port@1 { ... };
};

All 'port' nodes can be grouped under optional 'ports' node, which allows to
specify #address-cells, #size-cells properties independently for the 'port'
and 'endpoint' nodes and any child device nodes a device might have.

device {
	...
	ports {
		#address-cells = <1>;
		#size-cells = <0>;

		port@0 {
			...
			endpoint@0 { ... };
			endpoint@1 { ... };
		};

		port@1 { ... };
	};
};

Each endpoint can contain a 'remote-endpoint' phandle property that points to
the corresponding endpoint in the port of the remote device. Two 'endpoint'
nodes are linked with each other through their 'remote-endpoint' phandles.

device_1 {
	port {
		device_1_output: endpoint {
			remote-endpoint = <&device_2_input>;
		};
	};
};

device_1 {
	port {
		device_2_input: endpoint {
			remote-endpoint = <&device_1_output>;
		};
	};
};


Required properties
-------------------

If there is more than one 'port' or more than one 'endpoint' node or 'reg'
property is present in port and/or endpoint nodes the following properties
are required in a relevant parent node:

 - #address-cells : number of cells required to define port/endpoint
		    identifier, should be 1.
 - #size-cells    : should be zero.

Optional endpoint properties
----------------------------

- remote-endpoint: phandle to an 'endpoint' subnode of a remote device node.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
