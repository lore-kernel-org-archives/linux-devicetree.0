From: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Subject: Re: Invitation and RFC: Linux Plumbers Device Tree
 track proposed
Date: Sat, 11 Apr 2015 19:05:26 -0500
Message-ID: <CAOS_Y6Qmt2KTRu6urPs-Y1e2Xv1QPNTaQHH4_N8Kk8XU7n+ecQ@mail.gmail.com>
References: <8251B150E4DF5041A62C3EA9F0AB2E0603A53FE1082E@SELDMBX99.corpusers.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <celinux-dev-bounces-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org>
In-Reply-To: <8251B150E4DF5041A62C3EA9F0AB2E0603A53FE1082E-6yWnlZQfN9JoBVljSLT0Ysm4BeyDBExM@public.gmane.org>
List-Unsubscribe: <https://lists.celinuxforum.org/mailman/options/celinux-dev>,
	<mailto:celinux-dev-request-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.celinuxforum.org/pipermail/celinux-dev/>
List-Post: <mailto:celinux-dev-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org>
List-Help: <mailto:celinux-dev-request-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org?subject=help>
List-Subscribe: <https://lists.celinuxforum.org/mailman/listinfo/celinux-dev>,
	<mailto:celinux-dev-request-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org?subject=subscribe>
Sender: celinux-dev-bounces-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org
Errors-To: celinux-dev-bounces-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org
To: "Rowand, Frank" <Frank.Rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "celinux-dev-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org" <celinux-dev-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org>, "linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 11, 2015 at 2:20 PM, Rowand, Frank
<Frank.Rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org> wrote:
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
>
> I am looking for several things at the moment:
>
>    1) Suggestions of additional topics to be discussed.
>
>    2) Emails or other messages expressing an interest in attending the
>       device tree track.
>
>    3) Commitments to attend the device tree track (the conference committee
>       is looking at attendee interest and commitments as part of the process
>       of accepting the device tree track).
>
>    4) Identifying additional people who should attend the device tree track.
>
> The desired outcome of the device tree track is to encourage the future
> development of tools, process, etc to make device tree related development,
> test, review and system administration more efficient, faster, easier, more
> robust, and to improve troubleshooting and debugging facilities.  Some
> examples of areas of interest could include:
>    - make it easier to create correct device tree source files
>    - support for debugging incorrect device tree source files
>    - create a kernel that correctly boots one or more specific device trees
>      (eg a kernel configured to include the proper drivers and subsystems)
>    - create drivers that properly work for a device tree binding definition
>    - create drivers that support detecting errors in the related node(s) in
>      a device tree
>
> The wiki page lists additional areas of interest.

Is there a device tree porting HOWTO anywhere? If I have a board
that's using explicit C initialization, and I want to convert it over
to device tree, step by step what do I do?

If I'm writing a new board support, what device tree bits do I need to
get a shell prompt on a serial port running out of initramfs?
(Physical memory, interrupt controller, timer to drive the scheduler,
serial chip...)

There's a bunch of device tree reference material out there, but no
tutorial material at all, that I can find...

Rob
