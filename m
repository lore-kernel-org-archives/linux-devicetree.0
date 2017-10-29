From: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Subject: dtx_diff: "fatal error: imx6qp.dtsi: No such file or directory"
Date: Sun, 29 Oct 2017 04:52:06 -0400 (EDT)
Message-ID: <alpine.LFD.2.21.1710290430280.4745@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Device Tree Mailing List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


  not sure why i can't dtx_diff two .dts files if they're located
outside of a kernel source tree -- the dtx_diff script certainly seems
to suggest that's possible.

  with my kernel source tree at ~/k/git, i set things up with:

  $ PATH=$PATH:~/k/git/scripts/dtc
  $ export ARCH=arm

  first test, which works just fine (comparing imx6q-sabresd.dts and
imx6qp-sabresd.dts), first "cd"ing to the top of my kernel source
git repo:

  $ cd ~/k/git
  $ dtx_diff arch/arm/boot/dts/imx6q{,p}-sabresd.dts

appears to work fine, no need to use either of -s or -S to identify
the source tree since, by default, the script assumes that's where
you're located.

  next, "cd" down to that dts directory and try the same command
again:

  $ cd arch/arm/boot/dts
  $ dtx_diff imx6q{,p}-sabresd.dts

not surprisingly, it fails:

In file included from imx6qp.dtsi:43:0,
                 from imx6qp-sabresd.dts:45:
imx6q.dtsi:11:50: error: no include path in which to search for dt-bindings/interrupt-controller/irq.h
 #include <dt-bindings/interrupt-controller/irq.h>

  but either of the following two variations works just fine, since
you're identifying the location of the source tree git repo (that you
just happen to be inside of):

  $ dtx_diff -S imx6q{,p}-sabresd.dts
  $ dtx_diff -s ~/k/git imx6q{,p}-sabresd.dts

however, if i copy those two files to /tmp and try the comparison
there, even if i identify the same kernel source directory:

  $ cp imx6q{,p}-sabresd.dts /tmp
  $ cd /tmp
  $ dtx_diff -s ~/k/git imx6q{,p}-sabresd.dts

ruh roh ...

imx6qp-sabresd.dts:45:10: fatal error: imx6qp.dtsi: No such file or
directory
 #include "imx6qp.dtsi"
          ^~~~~~~~~~~~~
compilation terminated.
imx6q-sabresd.dts:15:10: fatal error: imx6q.dtsi: No such file or
directory
 #include "imx6q.dtsi"
          ^~~~~~~~~~~~
compilation terminated.

  obviously(?), the cpp include path is not being set correctly, but
why not? i'm checking the dtx_diff script right now to see what's
going into cpp_flags, but should this not work? should i not be
allowed to compare two .dts files outside the boundaries of a kernel
source tree as long as i provide a perfectly kernel source tree for it
to use? or does one need to manually configure the header file search
path for this?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
