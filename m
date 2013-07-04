From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Thu, 04 Jul 2013 12:58:29 +0200
Message-ID: <51D55555.3040403@gmail.com>
References: <51D348F5.2080205@gmail.com>
 <00ae01ce77cb$524d57f0$f6e807d0$%dae@samsung.com>
 <20130703090242.GM516@pengutronix.de>
 <20130703095248.GG13924@flint.arm.linux.org.uk>
 <20130704083307.GH10414@pengutronix.de>
 <20130704084052.GP13924@flint.arm.linux.org.uk>
 <20130704085817.GZ516@pengutronix.de>
 <20130704091131.GR13924@flint.arm.linux.org.uk>
 <20130704093047.GJ10414@pengutronix.de> <51D54409.6020608@gmail.com>
 <20130704100932.GL10414@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130704100932.GL10414-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: 'Jean-Francois Moine' <moinejf-GANU6spQydw@public.gmane.org>, 'Daniel Drake' <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/04/13 12:09, Sascha Hauer wrote:
> On Thu, Jul 04, 2013 at 11:44:41AM +0200, Sebastian Hesselbarth wrote:
>> On 07/04/13 11:30, Sascha Hauer wrote:
>>> On Thu, Jul 04, 2013 at 10:11:31AM +0100, Russell King wrote:
>>>> On Thu, Jul 04, 2013 at 10:58:17AM +0200, Sascha Hauer wrote:
>>>>> On Thu, Jul 04, 2013 at 09:40:52AM +0100, Russell King wrote:
>>>>>> Wrong.  Please read the example with the diagrams I gave.  Consider
>>>>>> what happens if you have two display devices connected to a single
>>>>>> output, one which fixes the allowable mode and one which _can_
>>>>>> reformat the selected mode.
>>>>>
>>>>> What you describe here is a forced clone mode. This could be described
>>>>> in the devicetree so that a driver wouldn't start before all connected
>>>>> displays (links) are present, but this should be limited to the affected
>>>>> path, not to the whole componentized device.
>>>>
>>>> Okay, to throw a recent argument back at you: so what in this scenario
>>>> if you have a driver for the fixed-mode device but not the other device?
>>>>
>>>> It's exactly the same problem which you were describing to Sebastian
>>>> just a moment ago with drivers missing from the supernode approach -
>>>> you can't start if one of those "forced clone" drivers is missing.
>>>
>>> Indeed, then you will see nothing on your display, but I rather make
>>> this setup a special case than the rather usual case that we do not
>>> have compiled in all drivers for all devices referenced in the
>>> supernode.
>>
>> The super-node links SoC internal devices that do not necessarily match
>> with the subsystem driver. You have one single DRM driver exploiting
>> several device nodes for a single video card.
>>
>> But you need one device node to hook the driver to.
>
> Currently on i.MX we use a platform_device for this purpose.

Sascha,

I have the impression that we are not that far away in our proposals.

The platform_device you are using on i.MX is what we have been referring
as the "super-node" during the discussion. I see device nodes as some
kind of platform_device - no all really end up in one as it depends on
the bus probing the nodes - but they are logical nodes that sometimes
1:1 match the physical nodes (devices).

The remaining issue I see at least for Dove and the DRM driver that
will be compatible with Armada 510 and e.g. PXA2128 or Armada 610 is:

We cannot match the DRM driver with any of the devices_nodes in question
(a) using lcd-controller will always end-up in two DRM drivers on Dove
     having two lcd controllers
(b) using display-controller will not work on other SoCs because it is
     unique to Armada 510.

With (a) you could tell lcd1 to go to "slave-mode" as v4l2 does but that
will also lead to very SoC specific drivers. Moreover, you will also
have to tell lcd0 to be either stand-alone or master-mode. You need to
know weather to wait for DRM driver loaded on lcd1 (slave) to fail after
reading "slave-mode" property.

The super-node solves it easily and has a strong relation to a virtual
video card. The actual point-to-point links match v4l2 approach.

Even the v4l2 approach could be used to describe all possible
combinations we discussed. But I do not see the beauty of it as it will
make dealing with translation of device node to subsystem requirements
and even physical SoC IP a lot more complicated.

With v4l2 you will have to link
(=> denoting visible video stream, -> logical link)

the single card, single lcd-controller case:
(LCD0)->(HDMI)=>

the multiple card, single lcd-controller case:
(LCD0)->(DCON)->(HDMI)=> and
(LCD1)---+  +=>

and the single card, multiple lcd-controller case:
(LCD0)->(LCD1)->(DCON)->(HDMI)=>
                     +=>

All this may allow you to determine the required setup in the driver
but it relates in no way how the data flow is nor how the devices
are physically connected.

Sebastian
