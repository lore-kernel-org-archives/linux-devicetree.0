From: Paul Brook <paul-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Subject: Re: [Qemu-devel] CELF Project Proposal - Device tree support for QEMU
	system emulation.
Date: Tue, 22 Dec 2009 12:45:48 +0000
Message-ID: <200912221245.48495.paul@codesourcery.com>
References: <200912162246.42366.rob@landley.net>
	<4B2A94BB.4020200@codemonkey.ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4B2A94BB.4020200-rdkfGonbjUSkNkDKm+mE6A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Anthony Liguori <anthony-rdkfGonbjUSkNkDKm+mE6A@public.gmane.org>, CE Linux Developers List <celinux-dev-VxL1A5FK7jA05z2xGA6PZHhyD016LWXt@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> http://thread.gmane.org/gmane.comp.emulators.qemu/44869
> 
> I'm not sure why Paul never pushed it but I think he was able to create
> the syborg board purely from a device tree.

The patches referenced above include purely device-tree based Syborg and 
Stellaris boards.

It works fairly nicely for some embedded boards, but gets fairly hairy when 
you start considering more complex topologies/machines. I particular the PCI 
OF/FDT bindings don't really fit what we need for qemu. Obviously full qdev 
conversion is a prerequisite for device tree based configuration, and at that 
time qdev was still in its infancy.

Part of the reason for posting that patch was to demonstrate the abstraction 
layers required for the internal device model. Previous patches tended to be 
based on the pre-existing PC commandline options, which IMO is a mistake. 
Likewise if (like my implementation) you focus on embedded machines you risk 
serious problems trying to extend to server class machines.

Paul
