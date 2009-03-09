From: John Linn <John.Linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Documentation for device tree API
Date: Mon, 9 Mar 2009 09:10:50 -0600
Message-ID: <20090309151053.AFECD8B8055@mail224-sin.bigfish.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0879930748=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Class: urn:content-classes:message
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Brian Hill <bhill-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============0879930748==
Content-Class: urn:content-classes:message
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C9A0C9.3BAD2FA3"

------_=_NextPart_001_01C9A0C9.3BAD2FA3
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Grant and David,
 =

We have a number of customers trying to use device tree to write their
own device drivers and they are asking a lot of API type questions.
 =

We haven't found any API type explanation/examples for using device tree
other than to look at existing drivers which can be challenging.
 =

Is there some documentation that we're just missing that does exist?
 =

We realize there is the Documentation/powerpc/booting-without-of.txt
file that describes the device tree, but it doesn't explain the API.
 =

Thanks,
John
 =



This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.


------_=_NextPart_001_01C9A0C9.3BAD2FA3
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2900.3492" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D806070015-09032009><FONT face=3DArial size=3D2>Hi Grant =
and =

David,</FONT></SPAN></DIV>
<DIV><SPAN class=3D806070015-09032009><FONT face=3DArial =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D806070015-09032009><FONT face=3DArial size=3D2>We have a=
 number of =

customers trying to use device tree to write their own device drivers and t=
hey =

are asking a lot of API type questions.</FONT></SPAN></DIV>
<DIV><SPAN class=3D806070015-09032009><FONT face=3DArial =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D806070015-09032009><FONT face=3DArial size=3D2>We haven'=
t found any =

API type explanation/examples for using device tree other than to look at =

existing drivers which can be challenging.</FONT></SPAN></DIV>
<DIV><SPAN class=3D806070015-09032009><FONT face=3DArial =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D806070015-09032009><FONT face=3DArial size=3D2>Is there =
some =

documentation that we're just missing that does exist?</FONT></SPAN></DIV>
<DIV><SPAN class=3D806070015-09032009><FONT face=3DArial =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D806070015-09032009><FONT face=3DArial size=3D2>We realiz=
e there is =

the Documentation/powerpc/booting-without-of.txt file that describes the de=
vice =

tree, but it doesn't explain the API.</FONT></SPAN></DIV>
<DIV><SPAN class=3D806070015-09032009><FONT face=3DArial =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D806070015-09032009><FONT face=3DArial =

size=3D2>Thanks,<BR>John</FONT></SPAN></DIV>
<DIV><SPAN class=3D806070015-09032009><FONT face=3DArial =

size=3D2></FONT></SPAN>&nbsp;</DIV><br clear=3Dall> This email and any atta=
chments are intended for the sole use of the named recipient(s) and contain=
(s) confidential information that may be proprietary, privileged or copyrig=
hted under applicable law. If you are not the intended recipient, do not re=
ad, copy, or forward this email message or any attachments. Delete this ema=
il message and any attachments immediately.
</BODY></HTML>


------_=_NextPart_001_01C9A0C9.3BAD2FA3--

--===============0879930748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
https://ozlabs.org/mailman/listinfo/devicetree-discuss

--===============0879930748==--
