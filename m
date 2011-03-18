From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: RFC: Platform data for onboard USB assets
Date: Fri, 18 Mar 2011 16:00:09 +0100
Message-ID: <201103181600.09877.arnd@arndb.de>
References: <20110311165642.GA9996@kroah.com>
	<201103172333.01474.arnd@arndb.de> <4D82979B.2050003@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4D82979B.2050003-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 18 March 2011, Andy Green wrote:
> On 03/17/2011 10:33 PM, Somebody in the thread at some point said:
> > On Thursday 17 March 2011 22:47:36 Greg KH wrote:
> >>
> >> Well, that means that the device tree work is going to be useful here,
> >> right?  :)
> >
> > I like the idea. Let's make this the first use case where a lot of
> 
> You changed your first opinion about tagging "dynamically probed 
> devices" with what is effectively platform_data, cool.

I still don't like the idea of attaching platform_data to more
devices, when we try to move people away from that in other
parts of the kernel, because of the known deficiencies.

Passing a MAC address in a device tree property is a
well-established method that is used on many drivers, and
is portable across operating systems and architectures.

> > people will want to have the device tree on ARM. The patch to the
> > driver to check for a mac-address property is trivial, and we
> > can probably come up with a decent way of parsing the device
> > tree for USB devices, after all there is an existing spec for
> > it (http://playground.sun.com/1275/bindings/usb/usb-1_0.ps).
> 
> It doesn't do it already then.
> 
> That spec you pointed to from 1998 is obviously going to be a whole 
> subproject doing the binding, it seems to fingerprint devices by VID/PID 
> if I understood it.

We don't need to implement the entire binding. My point was that
if we implement a way to attach a device_node to a usb_device, we
should do it in a way that is compatible with that binding, rather
than coming up with a new way.

Most importantly, you can ignore the entire "compatible"-
and "name"-property matching. I think we only need to look
at the "reg" property to walk the bus structure, and any
usb_device we find during the USB hub probing simply gets
linked to its device_node.

> What's the plan for leveraging that level of generality on "dynamically 
> probed devices"?  I mean I know what I want to use this for and the 
> platform_data scheme covers all the soldered-on-the-board cases fine.

Isn't there also a device tree based OMAP tree that can boot on
Panda and is just waiting to get merged?
 
> Is there actually a need for sort of not platform_data but universal 
> vid_pid_specific_usb_device_option_data coming from the board definition 
> file or bootloader for *pluggable* usb devices?  udev seems to be well 
> established doing that already in a generic, not-platform-specific way 
> that can go in all distros and so on nicely.  Maybe this is just my 
> impoverished imagination and people do want, say, some kinds of USB mice 
> to operate at higher DPI or whatever when plugged in a specific board 
> because it is that board.

It should really not be tied to a specific board, and there is a lot
of work going on to remove the need for board-specific source code
files, replacing it all with data structures.

My impression so far is that attaching a struct device_node to
static USB devices can be useful in general, but I wouldn't
go so far to suggest using this for dynamically probed devices.

	Arnd
