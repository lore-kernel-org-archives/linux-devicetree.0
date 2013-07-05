From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Fri, 5 Jul 2013 12:07:50 +0200
Message-ID: <20130705100750.GJ516@pengutronix.de>
References: <20130703090242.GM516@pengutronix.de>
	<20130703095248.GG13924@flint.arm.linux.org.uk>
	<20130704083307.GH10414@pengutronix.de>
	<20130704084052.GP13924@flint.arm.linux.org.uk>
	<20130704085817.GZ516@pengutronix.de>
	<20130704091131.GR13924@flint.arm.linux.org.uk>
	<20130704093047.GJ10414@pengutronix.de>
	<51D54409.6020608@gmail.com>
	<20130704100932.GL10414@pengutronix.de>
	<51D55555.3040403@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <51D55555.3040403@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: 'Jean-Francois Moine' <moinejf@free.fr>, 'Daniel Drake' <dsd@laptop.org>, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, Russell King <rmk@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 04, 2013 at 12:58:29PM +0200, Sebastian Hesselbarth wrote:
> On 07/04/13 12:09, Sascha Hauer wrote:
> >On Thu, Jul 04, 2013 at 11:44:41AM +0200, Sebastian Hesselbarth wrote:
> >>On 07/04/13 11:30, Sascha Hauer wrote:
> >>>On Thu, Jul 04, 2013 at 10:11:31AM +0100, Russell King wrote:
> >>>>On Thu, Jul 04, 2013 at 10:58:17AM +0200, Sascha Hauer wrote:
> >>>>>On Thu, Jul 04, 2013 at 09:40:52AM +0100, Russell King wrote:
> >>>>>>Wrong.  Please read the example with the diagrams I gave.  Consider
> >>>>>>what happens if you have two display devices connected to a single
> >>>>>>output, one which fixes the allowable mode and one which _can_
> >>>>>>reformat the selected mode.
> >>>>>
> >>>>>What you describe here is a forced clone mode. This could be described
> >>>>>in the devicetree so that a driver wouldn't start before all connected
> >>>>>displays (links) are present, but this should be limited to the affected
> >>>>>path, not to the whole componentized device.
> >>>>
> >>>>Okay, to throw a recent argument back at you: so what in this scenario
> >>>>if you have a driver for the fixed-mode device but not the other device?
> >>>>
> >>>>It's exactly the same problem which you were describing to Sebastian
> >>>>just a moment ago with drivers missing from the supernode approach -
> >>>>you can't start if one of those "forced clone" drivers is missing.
> >>>
> >>>Indeed, then you will see nothing on your display, but I rather make
> >>>this setup a special case than the rather usual case that we do not
> >>>have compiled in all drivers for all devices referenced in the
> >>>supernode.
> >>
> >>The super-node links SoC internal devices that do not necessarily match
> >>with the subsystem driver. You have one single DRM driver exploiting
> >>several device nodes for a single video card.
> >>
> >>But you need one device node to hook the driver to.
> >
> >Currently on i.MX we use a platform_device for this purpose.
> 
> Sascha,
> 
> I have the impression that we are not that far away in our proposals.
> 
> The platform_device you are using on i.MX is what we have been referring
> as the "super-node" during the discussion. I see device nodes as some
> kind of platform_device - no all really end up in one as it depends on
> the bus probing the nodes - but they are logical nodes that sometimes
> 1:1 match the physical nodes (devices).
> 
> The remaining issue I see at least for Dove and the DRM driver that
> will be compatible with Armada 510 and e.g. PXA2128 or Armada 610 is:
> 
> We cannot match the DRM driver with any of the devices_nodes in question
> (a) using lcd-controller will always end-up in two DRM drivers on Dove
>     having two lcd controllers
> (b) using display-controller will not work on other SoCs because it is
>     unique to Armada 510.
> 
> With (a) you could tell lcd1 to go to "slave-mode" as v4l2 does but that
> will also lead to very SoC specific drivers. Moreover, you will also
> have to tell lcd0 to be either stand-alone or master-mode. You need to
> know weather to wait for DRM driver loaded on lcd1 (slave) to fail after
> reading "slave-mode" property.
> 
> The super-node solves it easily and has a strong relation to a virtual
> video card. The actual point-to-point links match v4l2 approach.
> 
> Even the v4l2 approach could be used to describe all possible
> combinations we discussed. But I do not see the beauty of it as it will
> make dealing with translation of device node to subsystem requirements
> and even physical SoC IP a lot more complicated.
> 
> With v4l2 you will have to link
> (=> denoting visible video stream, -> logical link)
> 
> the single card, single lcd-controller case:
> (LCD0)->(HDMI)=>
> 
> the multiple card, single lcd-controller case:
> (LCD0)->(DCON)->(HDMI)=> and
> (LCD1)---+  +=>
> 
> and the single card, multiple lcd-controller case:
> (LCD0)->(LCD1)->(DCON)->(HDMI)=>

No, the link can spawn a graph. There is no need to build a chain only.
You can't link LCD0 to LCD1, that makes no sense.

Again the difference between supernodes and graphs is that the supernode
approach does not contain information about what components are needed
to do something useful with the device. You simply have to wait until
*all* components are present which may never happen if you don't drivers
for all components of the device.
With the graph instead you can start doing something once you find a
link between a source and a sink, no matter if other links are still
missing.

Another important point is that if you have a board with multiple i2c
encoder chips, how do you decide which one is connected to which LCDx
when all information you have is: "I need these x components", but have
no information how these components are connected to each other.
Fortunately I don't have hardware here which does something like this,
but it would also be possible to chain multiple encoder chips. This
could be described in a graph, but when all we have is a list of
components without connection information we would need board specific
code to handle the layout.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
