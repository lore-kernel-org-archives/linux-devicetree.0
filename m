From: "Rowand, Frank" <Frank.Rowand@sonymobile.com>
Subject: Invitation and RFC: Linux Plumbers Device Tree track proposed
Date: Sat, 11 Apr 2015 21:20:33 +0200
Message-ID: <8251B150E4DF5041A62C3EA9F0AB2E0603A53FE1082E@SELDMBX99.corpusers.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-embedded-owner@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "devicetree-compiler@vger.kernel.org" <devicetree-compiler@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "celinux-dev@lists.celinuxforum.org" <celinux-dev@lists.celinuxforum.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

In recent years there have been proposed tools to aid in the creation of valid
device trees and in debugging device tree issues.  An example of this is the
various approaches proposed (with source code provided) to validate device tree
source against valid bindings.  As of today, device tree related tools,
techniques, and debugging infrastructure have not progressed very far.  I have
submitted a device tree related proposal for the Linux Plumbers 2015 conference
to spur action and innovation in such tools, techniques, and debugging
infrastructure.

The current title of the track is "Device Tree Tools, Validation, and
Troubleshooting".  The proposal is located at

   http://wiki.linuxplumbersconf.org/2015:device_tree_tools_validation_and_trouble_shooting

I am looking for several things at the moment:

   1) Suggestions of additional topics to be discussed.

   2) Emails or other messages expressing an interest in attending the
      device tree track.

   3) Commitments to attend the device tree track (the conference committee
      is looking at attendee interest and commitments as part of the process
      of accepting the device tree track).

   4) Identifying additional people who should attend the device tree track.

The desired outcome of the device tree track is to encourage the future
development of tools, process, etc to make device tree related development,
test, review and system administration more efficient, faster, easier, more
robust, and to improve troubleshooting and debugging facilities.  Some
examples of areas of interest could include:
   - make it easier to create correct device tree source files
   - support for debugging incorrect device tree source files
   - create a kernel that correctly boots one or more specific device trees
     (eg a kernel configured to include the proper drivers and subsystems)
   - create drivers that properly work for a device tree binding definition
   - create drivers that support detecting errors in the related node(s) in
     a device tree

The wiki page lists additional areas of interest.

Thanks,

Frank Rowand
Sony Mobile Communications
