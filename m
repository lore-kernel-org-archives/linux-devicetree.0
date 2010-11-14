From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 4/4] of/fdt: add kernel command line option for dtb_compat
	string
Date: Sat, 13 Nov 2010 22:26:15 -0800
Message-ID: <2573ead1-944d-4ba5-ace3-12936693d872@SG2EHSMHS006.ehs.local>
References: <cover.1289520079.git.dirk.brandewie@gmail.com>
	<855a5a11d04a7c1883675b6a77992c4af85222fd.1289520079.git.dirk.brandewie@gmail.com>
	<20101114062246.GD2355@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5776879029175674458=="
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============5776879029175674458==
Content-Class: urn:content-classes:message
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01CB83C5.14C297AA"

------_=_NextPart_001_01CB83C5.14C297AA
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> > +			initial_boot_params =3D blob;

> Blech!  I really need to get Stephen (cc'd) to respin his "of/fdt: Add
> unflatten_partial_device_tree" patch that decouples the flattree
> functions from initial_boot_params.  Having to do it this way is just
> plain ugly.

> Stephen: nudge, nudge.

If things have settled down, I'll dust them off again.
Don't know if it will happen this week: I'm called for jury duty.

Steve


This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.


------_=_NextPart_001_01CB83C5.14C297AA
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; charset=3Diso-8859-=
1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version 6.5.7655.4">=

<TITLE>RE: [PATCH 4/4] of/fdt: add kernel command line option for dtb_compa=
t string</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->
<BR>
<BR>

<P><FONT SIZE=3D2>&gt; &gt; +&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; initial_boot_params =
=3D blob;<BR>
<BR>
&gt; Blech!&nbsp; I really need to get Stephen (cc'd) to respin his &quot;o=
f/fdt: Add<BR>
&gt; unflatten_partial_device_tree&quot; patch that decouples the flattree<=
BR>
&gt; functions from initial_boot_params.&nbsp; Having to do it this way is =
just<BR>
&gt; plain ugly.<BR>
<BR>
&gt; Stephen: nudge, nudge.<BR>
<BR>
If things have settled down, I'll dust them off again.<BR>
Don't know if it will happen this week: I'm called for jury duty.<BR>
<BR>
Steve</FONT>
</P>

<br clear=3Dall> This email and any attachments are intended for the sole u=
se of the named recipient(s) and contain(s) confidential information that m=
ay be proprietary, privileged or copyrighted under applicable law. If you a=
re not the intended recipient, do not read, copy, or forward this email mes=
sage or any attachments. Delete this email message and any attachments imme=
diately.
</BODY>
</HTML>


------_=_NextPart_001_01CB83C5.14C297AA--

--===============5776879029175674458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5776879029175674458==--
