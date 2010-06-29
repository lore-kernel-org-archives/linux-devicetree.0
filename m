From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] of/fdt: Add unflatten_partial_device_tree
Date: Mon, 28 Jun 2010 21:50:58 -0700
Message-ID: <7d85d675-2028-4942-a819-c97d2295ea3b@SG2EHSMHS007.ehs.local>
References: <1277747279-9236-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1277747279-9236-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<aa5152a0-4931-479a-bc89-78ac4922c7f1@SG2EHSMHS006.ehs.local>
	<AANLkTilXgArDaFjv0RiTMeQBdU3bma4sTtLLbwN8lI4O@mail.gmail.com>
	<20100629012207.GG13509@yookeroo>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1204927162893342916=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============1204927162893342916==
Content-Class: urn:content-classes:message
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01CB1746.AA520F2F"

------_=_NextPart_001_01CB1746.AA520F2F
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


>> Another question is what to do with the unflattened tree once it is
>> unflattened.  Some of the existing code expects the node to be part of
>> the global tree.  Those could either be refactored, or the new partial
>> tree could be grafted into the global tree.  Grafting will have the
>> least impact, but it probably isn't a good idea in the long term.
>> Grafting together unrelated trees seems messy to me.
>
>I think I must have missed an earlier discussion.  What's the use case
>for multiple fdt blobs?

Basically, we are building systems which have an FPGA sitting on a PCIe.  T=
he
FPGA contains an internal bus with lots of devices.  From the structural po=
int
of view, it seems to make sense to describe the connectivity of this subsys=
tem
with a device tree: albeit a slightly strange one with no processor: just a=
 pcie<->plb
bridge and a number of devices.  Since this subsystem is, in fact, architec=
ture independent
(you could physically plug it into a PCIe slot on a system with any process=
or architecture)
it is a bit of a poster case for generalizing more of the device tree infra=
structure.
In particular, we are most interested in doing this in X86 systems.

Which leads me back to the first question: My approach so far is that the d=
evice
tree fragment is completely independent of any toplevel device tree, for th=
e simple
reason that on X86, there *isn't* a toplevel device tree...   The devices t=
hat get generated
are in the regular device structure, which is similar to the way pci bridge=
s and pcimcia
drivers work.

Steve



This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.


------_=_NextPart_001_01CB1746.AA520F2F
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; charset=3Diso-8859-=
1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version 6.5.7655.4">=

<TITLE>RE: [PATCH] of/fdt: Add unflatten_partial_device_tree</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->
<BR>

<P><FONT SIZE=3D2>&gt;&gt; Another question is what to do with the unflatte=
ned tree once it is<BR>
&gt;&gt; unflattened.&nbsp; Some of the existing code expects the node to b=
e part of<BR>
&gt;&gt; the global tree.&nbsp; Those could either be refactored, or the ne=
w partial<BR>
&gt;&gt; tree could be grafted into the global tree.&nbsp; Grafting will ha=
ve the<BR>
&gt;&gt; least impact, but it probably isn't a good idea in the long term.<=
BR>
&gt;&gt; Grafting together unrelated trees seems messy to me.<BR>
&gt;<BR>
&gt;I think I must have missed an earlier discussion.&nbsp; What's the use =
case<BR>
&gt;for multiple fdt blobs?<BR>
<BR>
Basically, we are building systems which have an FPGA sitting on a PCIe.&nb=
sp; The<BR>
FPGA contains an internal bus with lots of devices.&nbsp; From the structur=
al point<BR>
of view, it seems to make sense to describe the connectivity of this subsys=
tem<BR>
with a device tree: albeit a slightly strange one with no processor: just a=
 pcie&lt;-&gt;plb<BR>
bridge and a number of devices.&nbsp; Since this subsystem is, in fact, arc=
hitecture independent<BR>
(you could physically plug it into a PCIe slot on a system with any process=
or architecture)<BR>
it is a bit of a poster case for generalizing more of the device tree infra=
structure.<BR>
In particular, we are most interested in doing this in X86 systems.<BR>
<BR>
Which leads me back to the first question: My approach so far is that the d=
evice<BR>
tree fragment is completely independent of any toplevel device tree, for th=
e simple<BR>
reason that on X86, there *isn't* a toplevel device tree...&nbsp;&nbsp; The=
 devices that get generated<BR>
are in the regular device structure, which is similar to the way pci bridge=
s and pcimcia<BR>
drivers work.<BR>
<BR>
Steve<BR>
<BR>
</FONT>
</P>

<br clear=3Dall> This email and any attachments are intended for the sole u=
se of the named recipient(s) and contain(s) confidential information that m=
ay be proprietary, privileged or copyrighted under applicable law. If you a=
re not the intended recipient, do not read, copy, or forward this email mes=
sage or any attachments. Delete this email message and any attachments imme=
diately.
</BODY>
</HTML>


------_=_NextPart_001_01CB1746.AA520F2F--

--===============1204927162893342916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1204927162893342916==--
