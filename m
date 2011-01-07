From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [RFC] MPIC Bindings and Bindings for AMP Systems
Date: Fri, 7 Jan 2011 14:57:13 -0600
Message-ID: <20110107145713.174e3a67@udp111988uds.am.freescale.net>
References: <4D12F171.7010103@mentor.com>
	<20101223185623.GA20384@angua.secretlab.ca>
	<4D13C402.2090209@mentor.com>
	<20101223223325.GK20384@angua.secretlab.ca>
	<20110103135120.32aeb60d@udp111988uds.am.freescale.net>
	<4D24E99F.90908@mentor.com>
	<20110105160918.2b530fea@udp111988uds.am.freescale.net>
	<DD7A9A95166BF4418C4C1EB2033B6EE2038FA8E4@na3-mail.mgc.mentorg.com>
	<20110105170725.1a82c5a6@udp111988uds.am.freescale.net>
	<DD7A9A95166BF4418C4C1EB2033B6EE2038FA8FD@na3-mail.mgc.mentorg.com>
	<AANLkTikROM4MtmLYEK_6ndRzbDJ3xjMM5iSPzDhpRWLy@mail.gmail.com>
	<DD7A9A95166BF4418C4C1EB2033B6EE2038FA900@na3-mail.mgc.mentorg.com>
	<AANLkTikY8z3V-opZ6K3j28QfyBV_p8jEAhxOKywjX27T@mail.gmail.com>
	<DD7A9A95166BF4418C4C1EB2033B6EE2038FA90D@na3-mail.mgc.mentorg.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <DD7A9A95166BF4418C4C1EB2033B6EE2038FA90D-1KJr3DFo5IITHwIYFunNKKbYDNqAj0Ws@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "Blanchard, Hollis" <Hollis_Blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: "Inge, Meador" <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 7 Jan 2011 12:30:52 -0800
"Blanchard, Hollis" <Hollis_Blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> wrote:

> On 01/07/2011 08:44 AM, Grant Likely wrote:
> > On Fri, Jan 7, 2011 at 9:00 AM, Blanchard, Hollis
> > <Hollis_Blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>  wrote:
> >> On 01/07/2011 07:48 AM, Grant Likely wrote:
> >>> Actually, for a while now the kernel has been moving towards userspace
> >>> being responsible for device identification.  That's what udev is for.
> >>>    The kernel udev looks at the available information when a device is
> >>> registered/bound, and it creates useful symlinks to the dynamically
> >>> assigned major/minor devices.  The rest of userspace doesn't need to
> >>> know about it; it can simply use the symlinks in /dev, but it is
> >>> appropriate to let udev figure out the correct naming.
> >> Can you point out an example of how this is done for Open Firmware
> >> devices currently?
> > Nope, because while it has been a theoretical concern, in practice the
> > issue hasn't come up on any of the hardware I've worked on or I've
> > seen patches for.
> That is still this case here: it's a theoretical concern. Don't forget: 
> we're talking about eight registers in the MPIC. There is no bus, no 
> hotplug, nothing. Really, the only requirement is that somehow we can 
> match the names used in the hardware documentation.

It's a practical concern on other devices, and we need to solve that.
Once that happens, the same infrastructure should be usable to deal
with this as well -- though really, it's a separate issue from what
goes in the device tree.

The established mechanism for "match the names used in the hardware
documentation" is aliases.

In this particular case, if you want userspace to just see timers 0-7,
have the kernel driver look for the standard aliases to determine which
block is which, and expose it to userspace in the manner of your
choosing.

> > Mostly this is because the device tree
> > representations are internally self consistent;
> > dependencies/connections are explicitly expressed with phandles or
> > full paths which eliminates any need for enumeration in all the cases
> > I've had to deal with.
> The device tree on every platform contains devices which must be 
> referenced by userspace. That is the problem we're trying to solve -- 
> let's not get distracted by theoretical principles of enumeration.
> 
> The closest analogy might be serial devices, which unlike ethernet 
> devices don't have other distinguishing information for udev to 
> interpret. To my surprise, when I reverse the order of the serial nodes 
> in the device tree, the ttyS0/S1 ordering reverses too. This is exactly 
> the problem we were trying to avoid... but it seems nobody has solved it 
> anywhere. :(

What if you plug in a PCI serial card?  Or USB?  What if you're under a
hypervisor and you have a variety of virtual serial/console/etc.
objects that don't have any meaningful enumeration order?

As Grant suggested, udev should be made aware of device-tree aliases --
which would be the distinguishing information udev needs.

In the absence of aliases or other good information, perhaps the udev
rule could fall back on heuristics such as bus type and address to at
least reduce unpredictability.

-Scott
