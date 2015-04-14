From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Invitation and RFC: Linux Plumbers Device Tree track proposed
Date: Tue, 14 Apr 2015 10:36:15 -0500
Message-ID: <CAL_JsqL0FdvKtGTxFNYxtrGWkm3z-1m0v9dHwYezCtkFOW6EgQ@mail.gmail.com>
References: <8251B150E4DF5041A62C3EA9F0AB2E0603A53FE1082E@SELDMBX99.corpusers.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8251B150E4DF5041A62C3EA9F0AB2E0603A53FE1082E-6yWnlZQfN9JoBVljSLT0Ysm4BeyDBExM@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Rowand, Frank" <Frank.Rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "celinux-dev-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org" <celinux-dev-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

A few things on my list:

- Supported and not supported overlay usecases
- Tools for overlays - I think overlays has created new challenges in
validation and a need for new tools. How to test an overlay applies?
Generating a dtb from dts + overlay dts. Generating an overlay from a
diff of old and new dts (overlay as a way to update old dtbs)
- Shrinking the binding review fire hose. How to improve binding
documentation structure and review.
- Standardizing Android dtb handling. Appended DTB for arm64? Not
liked by upstream, but already in use.


>    2) Emails or other messages expressing an interest in attending the
>       device tree track.
>
>    3) Commitments to attend the device tree track (the conference committee
>       is looking at attendee interest and commitments as part of the process
>       of accepting the device tree track).

I plan to attend. I'm probably attending some of the Android mini conf
too, so I'll have to split my time.

>    4) Identifying additional people who should attend the device tree track.

Arnd Bergmann
Matt Porter
Jon Loeliger
Gaurav Minocha

Rob

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
>
> Thanks,
>
> Frank Rowand
> Sony Mobile Communications
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
