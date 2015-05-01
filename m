From: Matt Porter <mporter@konsulko.com>
Subject: Re: Invitation and RFC: Linux Plumbers Device Tree track proposed
Date: Fri, 1 May 2015 09:32:29 -0400
Message-ID: <20150501133229.GF4789@beef>
References: <8251B150E4DF5041A62C3EA9F0AB2E0603A53FE1082E@SELDMBX99.corpusers.net>
 <CAL_JsqL0FdvKtGTxFNYxtrGWkm3z-1m0v9dHwYezCtkFOW6EgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqL0FdvKtGTxFNYxtrGWkm3z-1m0v9dHwYezCtkFOW6EgQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: "Rowand, Frank" <Frank.Rowand@sonymobile.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "devicetree-compiler@vger.kernel.org" <devicetree-compiler@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "celinux-dev@lists.celinuxforum.org" <celinux-dev@lists.celinuxforum.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jon Loeliger <jdl@jdl.com>, Arnd Bergmann <arnd@arndb.de>, Gaurav Minocha <gaurav.minocha.os@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 14, 2015 at 10:36:15AM -0500, Rob Herring wrote:
> On Sat, Apr 11, 2015 at 2:20 PM, Rowand, Frank
> <Frank.Rowand@sonymobile.com> wrote:
> > In recent years there have been proposed tools to aid in the creation of valid
> > device trees and in debugging device tree issues.  An example of this is the
> > various approaches proposed (with source code provided) to validate device tree
> > source against valid bindings.  As of today, device tree related tools,
> > techniques, and debugging infrastructure have not progressed very far.  I have
> > submitted a device tree related proposal for the Linux Plumbers 2015 conference
> > to spur action and innovation in such tools, techniques, and debugging
> > infrastructure.
> >
> > The current title of the track is "Device Tree Tools, Validation, and
> > Troubleshooting".  The proposal is located at
> >
> >    http://wiki.linuxplumbersconf.org/2015:device_tree_tools_validation_and_trouble_shooting
> >
> > I am looking for several things at the moment:
> >
> >    1) Suggestions of additional topics to be discussed.
> 
> A few things on my list:
> 
> - Supported and not supported overlay usecases
> - Tools for overlays - I think overlays has created new challenges in
> validation and a need for new tools. How to test an overlay applies?
> Generating a dtb from dts + overlay dts. Generating an overlay from a
> diff of old and new dts (overlay as a way to update old dtbs)
> - Shrinking the binding review fire hose. How to improve binding
> documentation structure and review.
> - Standardizing Android dtb handling. Appended DTB for arm64? Not
> liked by upstream, but already in use.

- Clean up of existing hardware-specific bindings to conform to the
  generic bindings, working dts files in the kernel tree, and bring
  consistency to the documentation style/syntax.

> >    2) Emails or other messages expressing an interest in attending the
> >       device tree track.
> >
> >    3) Commitments to attend the device tree track (the conference committee
> >       is looking at attendee interest and commitments as part of the process
> >       of accepting the device tree track).
> 
> I plan to attend. I'm probably attending some of the Android mini conf
> too, so I'll have to split my time.
> 
> >    4) Identifying additional people who should attend the device tree track.
> 
> Arnd Bergmann
> Matt Porter
> Jon Loeliger
> Gaurav Minocha

I also plan to attend. I have an interest in most of the topics already
mentioned as well as the topic I added above.

-Matt
