From: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Subject: Re: [Celinux-dev] Invitation and RFC: Linux Plumbers Device Tree
 track proposed
Date: Fri, 01 May 2015 16:22:08 -0500
Message-ID: <5543EE80.5060109@landley.net>
References: <8251B150E4DF5041A62C3EA9F0AB2E0603A53FE1082E@SELDMBX99.corpusers.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8251B150E4DF5041A62C3EA9F0AB2E0603A53FE1082E-6yWnlZQfN9JoBVljSLT0Ysm4BeyDBExM@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Rowand, Frank" <Frank.Rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "celinux-dev-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org" <celinux-dev-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/11/2015 02:20 PM, Rowand, Frank wrote:
> In recent years there have been proposed tools to aid in the creation of valid
> device trees and in debugging device tree issues.  An example of this is the
> various approaches proposed (with source code provided) to validate device tree
> source against valid bindings.  As of today, device tree related tools,
> techniques, and debugging infrastructure have not progressed very far.  I have
> submitted a device tree related proposal for the Linux Plumbers 2015 conference
> to spur action and innovation in such tools, techniques, and debugging
> infrastructure.
> 
> The current title of the track is "Device Tree Tools, Validation, and
> Troubleshooting".  The proposal is located at
> 
>    http://wiki.linuxplumbersconf.org/2015:device_tree_tools_validation_and_trouble_shooting

Want I want to do is:

1) Download an archive of device tree files describing a bunch of
boards. (Both dts and corresponding dtb files, with maybe a .txt telling
me about the board and the -append line qemu needs to give it any
board-specific kernel command line stuff like "console=myserialport".)

2) Feed one of the dtb files to qemu to instantiate a bunch of devices.

3) Feed the same file to a generic-ish linux kernel to bind to those
devices. (Or have qemu do this for me.)

Every year or so I sit down to figure out how to do this, spent fifteen
minutes head scratching, and wander away again.

The archive in 1) should have subdirectories for architectures, with the
same name as the corresponding kernel arch directory. It would be nice
if there was some sort of dts_defconfig that built a vmlinux that
statically linked in all the drivers with a device tree binding. It
would be _really_ nice if qemu's vmlinux loader actually worked on all
the hardware targets.

In theory, this should be easy. In practice, I've never made it work.

Rob
