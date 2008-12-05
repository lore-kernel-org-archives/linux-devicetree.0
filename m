From: Angelo <s104259-whZMOeQn8C0@public.gmane.org>
Subject: Re: usb/eth DTS nodes for custom board based on mpc5200
Date: Fri, 5 Dec 2008 15:02:38 +0000 (GMT)
Message-ID: <537065.14124.qm@web23104.mail.ird.yahoo.com>
References: <fa686aa40812050640m4b4afe2egef638ca950cff041@mail.gmail.com>
Reply-To: s104259-whZMOeQn8C0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1840042160=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <fa686aa40812050640m4b4afe2egef638ca950cff041-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============1840042160==
Content-Type: multipart/alternative; boundary="0-1865881593-1228489358=:14124"

--0-1865881593-1228489358=:14124
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ok.

Tha main problem is that if I cross-compile kernel for ARCH=3Dppc everythin=
gs work fine.=20

>"Configuring the Ethernet pins for USB IO is just a pin routing board setu=
p task."

What should I do for this?!?!?

* I've configured the port_config in=C2=A0 lite5200_setup_cpu(void) functio=
n [arch/powerpc/platforms/52xx/lite5200.c]. I put in port_config the same v=
alue that I put with ARCH=3Dppc!

However I'm sure that my u-boot sets-up the port_config register because fa=
tls usb 0:1 / show me the content of usb-storage.

Thanks,
@ngel
--- Ven 5/12/08, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> ha scritto:
Da: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Oggetto: Re: usb/eth DTS nodes for custom board based on mpc5200
A: s104259-whZMOeQn8C0@public.gmane.org
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, "linuxppc-dev" <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Data: Venerd=C3=AC 5 dicembre 2008, 15:40

On Fri, Dec 5, 2008 at 4:22 AM, Angelo <s104259-whZMOeQn8C0@public.gmane.org> wrote:
> Hi all.
>
> I'd like to know if it's necessary to modify my DTS.
>
> On my board I have:
> * u-boot 1.2.0
> * kernel 2.6.21
> * arch=3Dpowerpc
> * dts based on lite5200b.dts
> * USB port (USB2) configured on the Ethernet port
>
> Is it necessary to combine Ethernet and usb nodes into the device tree
> source?

No.  Configuring the Ethernet pins for USB IO is just a pin routing
board setup task.  You do need to make sure U-Boot sets up the
port_config register correctly, but it doesn't impact the device tree.
 You don't need to change any of the values in the USB node.

However, if the Ethernet device is unused then you should remove the
Ethernet node from your device tree.

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
=0A=0A=0A      
--0-1865881593-1228489358=:14124
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<table cellspacing=3D"0" cellpadding=3D"0" border=3D"0" ><tr><td valign=3D"=
top" style=3D"font: inherit;">Ok.<br><br>Tha main problem is that if I cros=
s-compile kernel for ARCH=3Dppc everythings work fine. <br><br>&gt;"Configu=
ring the Ethernet pins for USB IO is just a pin routing board setup task."<=
br><br>What should I do for this?!?!?<br><br>* I've configured the port_con=
fig in&nbsp; <span style=3D"font-style: italic;">lite5200_setup_cpu(void)</=
span> function [arch/powerpc/platforms/52xx/lite5200.c]. I put in port_conf=
ig the same value that I put with ARCH=3Dppc!<br><br>However I'm sure that =
my u-boot sets-up the port_config register because <span style=3D"font-weig=
ht: bold;">fatls usb 0:1 /</span> show me the content of usb-storage.<br><b=
r>Thanks,<br>@ngel<br>--- <b>Ven 5/12/08, Grant Likely <i>&lt;grant.likely@=
secretlab.ca&gt;</i></b> ha scritto:<br><blockquote style=3D"border-left: 2=
px solid rgb(16, 16, 255); margin-left: 5px; padding-left: 5px;">Da: Grant =
Likely
 &lt;grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org&gt;<br>Oggetto: Re: usb/eth DTS nodes for cu=
stom board based on mpc5200<br>A: s104259-whZMOeQn8C0@public.gmane.org<br>Cc: devicetree-discus=
s@ozlabs.org, "linuxppc-dev" &lt;linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org&gt;<br>Data: Vener=
d=C3=AC 5 dicembre 2008, 15:40<br><br><pre>On Fri, Dec 5, 2008 at 4:22 AM, =
Angelo &lt;s104259-whZMOeQn8C0@public.gmane.org&gt; wrote:<br>&gt; Hi all.<br>&gt;<br>&gt; I'd =
like to know if it's necessary to modify my DTS.<br>&gt;<br>&gt; On my boar=
d I have:<br>&gt; * u-boot 1.2.0<br>&gt; * kernel 2.6.21<br>&gt; * arch=3Dp=
owerpc<br>&gt; * dts based on lite5200b.dts<br>&gt; * USB port (USB2) confi=
gured on the Ethernet port<br>&gt;<br>&gt; Is it necessary to combine Ether=
net and usb nodes into the device tree<br>&gt; source?<br><br>No.  Configur=
ing the Ethernet pins for USB IO is just a pin routing<br>board setup task.=
  You do need to make sure U-Boot sets up the<br>port_config register corre=
ctly, but it doesn't impact the device tree.<br> You don't need to change
 any of the values in the USB node.<br><br>However, if the Ethernet device =
is unused then you should remove the<br>Ethernet node from your device tree=
.<br><br>g.<br><br>-- <br>Grant Likely, B.Sc., P.Eng.<br>Secret Lab Technol=
ogies Ltd.<br></pre></blockquote></td></tr></table><br>=0A=0A=0A=0A      
--0-1865881593-1228489358=:14124--

--===============1840042160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
https://ozlabs.org/mailman/listinfo/devicetree-discuss

--===============1840042160==--
