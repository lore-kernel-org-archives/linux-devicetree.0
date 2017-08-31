From: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Subject: [PATCH] Aesthetic fixes to DTSpec 0.1, Acknowledgements and Chapter
 1
Date: Thu, 31 Aug 2017 17:50:47 -0400 (EDT)
Message-ID: <alpine.LFD.2.21.1708311747500.16833@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Some aesthetic tweaks to DTSpec 0.1, including

 * grammar fixes
 * font fixes

Signed-off-by: Robert P. J. Day <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>

---

  i'll do a chunk at a time, to avoid having a sizable submission
getting hung up on a single issue.

commit 10d4ba9bb1ad5baab5d9bff4e2dac643166f9356
Author: Robert P. J. Day <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Date:   Thu Aug 31 17:46:29 2017 -0400

    Ack and chapter 1.

diff --git a/source/acknowledgements.rst b/source/acknowledgements.rst
index 3e49046..a02e0aa 100644
--- a/source/acknowledgements.rst
+++ b/source/acknowledgements.rst
@@ -2,7 +2,7 @@

 The devicetree.org Technical Steering Committee would like to
 thank the many individuals and companies that contributed to the
-development this specification through writing, technical discussions
+development of this specification through writing, technical discussions
 and reviews.

 We want to thank the power.org Platform Architecture Technical Subcommittee who
diff --git a/source/introduction.rst b/source/introduction.rst
index 30ba3d9..d7dc2fc 100644
--- a/source/introduction.rst
+++ b/source/introduction.rst
@@ -13,10 +13,10 @@ hardware before passing control to software such as an operating system,
 bootloader, or hypervisor. Bootloaders and hypervisors can, in turn,
 load and transfer control to operating systems. Standard, consistent
 interfaces and conventions facilitate the interactions between these
-software components.  In this document the term boot program is used to
+software components.  In this document the term *boot program* is used to
 generically refer to a software component that initializes the system
 state and executes another software component referred to as a *client
-program*. Examples of a boot programs include: firmware, bootloaders, and
+program*. Examples of a boot program include: firmware, bootloaders, and
 hypervisors. Examples of a client program include: bootloaders,
 hypervisors, operating systems, and special purpose programs. A piece of
 software may be both a client program and a boot program  (e.g. a hypervisor).
@@ -101,14 +101,14 @@ IEEE 1275 specification that are omitted from the |spec| include:
 * FCode debugging
 * Operating system debugging

-What is retained from IEEE-1275 are concepts from the devicetree
+What is retained from IEEE 1275 are concepts from the devicetree
 architecture by which a boot program can describe and communicate system
 hardware information to client program, thus eliminating the need for
 the client program to have hard-coded descriptions of system hardware.

 This specification partially supersedes the |epapr| [EPAPR] specification.
-|epapr| documents how devicetree is used by the PowerISA, and covers both
-general concepts, as well as PowerISA specific bindings.
+|epapr| documents how devicetree is used by the Power ISA, and covers both
+general concepts, as well as Power ISA specific bindings.
 The text of this document was derived from |epapr|, but either removes architecture specific bindings, or moves them into an appendix.

 32-bit and 64-bit Support
@@ -141,7 +141,7 @@ Definition of Terms
    boot program
        Used to generically refer to a software component that initializes
        the system state and executes another software component referred to
-       as a client program. Examples of a boot programs include: firmware,
+       as a client program. Examples of a boot program include: firmware,
        bootloaders, and hypervisors.

    client program

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
