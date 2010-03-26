From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: RFC: new device tree binding review process idea
Date: Thu, 25 Mar 2010 23:13:36 -0600
Message-ID: <fa686aa41003252213w3f403d42pea3c8c88adbf5832@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7sXa4x6EXUF0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all.  I've been thinking for quite a while now about setting up a
wiki for documenting new device tree bindings.  I've finally got
around to setting something up to give it a try and making a first cut
at a peer-review process for new bindings.  I'd like to get some
feedback on what I've set up so far.  Please take a look and let me
know what you think.  The draft review process page is here:

http://fdt.secretlab.ca/Review_Process

I'm also pasting the page contents below to make it easy to review.

g.

----

Device tree 'bindings' document how individual devices are described
in the device tree.  For any given device, the binding says what
properties and nodes a device driver needs to use the device.

This page documents the process for writing and reviewing new
bindings.  New bindings are written for new devices that cannot be
handled by existing bindings.

== Creating a new draft binding ==
* New draft bindings shall be written in plain-text format using the
Mediawiki markup language, ideally as a new page in this wiki.
** Authors aren't required to use the wiki for editing their binding,
but when the new binding is approved they either need to add it to the
wiki themselves, or ask a reviewer to add it for them.
* Page titles for bindings shall be in the form
"Compatible=<compatible value>" which matches the distinguishing
compatible property value used by the binding.
* Binding documents may include Mediawiki Category: tags to group
binding into Vendor and Bus type categories.
* Post new binding text to the
[mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org] mailing list and ask for review.
** Include a link to the wiki page if possible.
* Respond to comments and post updated drafts.

New bindings will be flagged as "unreviewed" on the wiki.

== Modifying an existing binding ==
* Same as for creating new bindings except the diff between the old
and new versions

By default, modifications to approved bindings will not be displayed
until the changes are approved.  The last 'stable' version will be
displayed instead.  The 'draft' tab at the top of the page can be used
to show the modified version.

== Reviewing a binding ==
* Review comments on new and modified bindings can be posted by anyone
on the devicetree-discuss mailing list.
* Authors and reviews should work toward a consensus on the binding.
* When consensus is reached, ask one of the device tree binding
maintainers mark the binding as 'approved'.
* '''(TBD: who are the maintainers going to be?  How does someone
contact the maintainers)'''

== Approval ==
* Binding maintainers have permission to mark bindings as approved in this wiki.

== Notes ==
=== Persistence of bindings ===
* In general, once a binding is approved it cannot be either removed
or changed in an incompatible way.  It can only be deprecated.
** Reason is that changing a binding once device drivers are actually
using it could result in newer OS versions not working with older
device trees.

=== Notes for driver and operating system authors ===
* Bindings shall be documented, reviewed and approved '''before''' any
'official' release of device drivers that use the binding.
** The definition of 'official release' is subject to interpretation
of course, but the principle is that bindings need to be peer-reviewed
to catch problems before committing to use them in an official
release.  Once a binding is used 'in the wild' it becomes difficult to
change.
** For example, in the Linux case code using new bindings will not be
merged into Linus' tree before the binding is reviewed.


-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
