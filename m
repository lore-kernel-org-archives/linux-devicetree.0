From: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Subject: Re: Device tree FSL description for Microblaze
Date: Wed, 13 Jul 2011 01:48:14 +1000
Message-ID: <CACPZLaWP=9_1K+0KdSekRa=H387SkNQFrz+6e4m=aXstT0xHfQ@mail.gmail.com>
References: <4DDCE793.9080709@monstr.eu> <4E1BEA17.6020004@monstr.eu>
	<CACxGe6tVGa4H8-Bep89-wNQzR11bFeJ6dS3S18sYN=g0_1r+tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5118220316635599119=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACxGe6tVGa4H8-Bep89-wNQzR11bFeJ6dS3S18sYN=g0_1r+tw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============5118220316635599119==
Content-Type: multipart/alternative; boundary=0015175cb6b87e432204a7e13bb0

--0015175cb6b87e432204a7e13bb0
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 13, 2011 at 1:12 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>wrote:

> On Tue, Jul 12, 2011 at 3:30 PM, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:
> > Any comments on this?
>
> Sorry I didn't comment, but this is the first I've seen it.  I missed
> it the first time around.
>
> It's hard to provide any useful comments on this.  I have no idea what
> FSL devices are.
>

FSL is a point-to-point FIFO bus architecture.  MicroBlaze has native ports
on the CPU that allow direct connection to up to 16 master / slave pairs of
these buses.

It's equivalent in some senses to the AXI streaming protocol - indeed newer
MicroBlaze versions can talk AXI stream, and it will also have a role in the
Zynq architecture.

FSL / AXI stream is a bit wierd from a device tree point of view - they are
point to point, unidirectional buses - FIFOs basically.  Completely
different from your standard shared SoC bus.

We are looking for a good way to express this topology in the device tree.
It is important to get this right - FSL and AXI stream will be an
increasingly important way of connecting coprocessors and devices within
Xilinx MicroBlaze and Zynq systems.  We'd like to get consensus now rather
than finding opposition 6-12 months from now when we try to push stuff that
we've already shipped.

Thanks,

John
-- 
John Williams, PhD, B. Eng, B. IT
PetaLogix - Linux Solutions for a Reconfigurable World
w: www.petalogix.com  p: +61-7-30090663  f: +61-7-30090663

--0015175cb6b87e432204a7e13bb0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Wed, Jul 13, 2011 at 1:12 AM, Grant L=
ikely <span dir=3D"ltr">&lt;<a href=3D"mailto:grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org">gr=
ant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex;">

On Tue, Jul 12, 2011 at 3:30 PM, Michal Simek &lt;<a href=3D"mailto:monstr@=
monstr.eu">monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org</a>&gt; wrote:<br>
&gt; Any comments on this?<br>
<br>
Sorry I didn&#39;t comment, but this is the first I&#39;ve seen it. =A0I mi=
ssed<br>
it the first time around.<br>
<br>
It&#39;s hard to provide any useful comments on this. =A0I have no idea wha=
t<br>
FSL devices are.<br></blockquote><div><br>FSL is a point-to-point FIFO bus =
architecture.=A0 MicroBlaze has native ports on the CPU that allow direct c=
onnection to up to 16 master / slave pairs of these buses.<br><br>It&#39;s =
equivalent in some senses to the AXI streaming protocol - indeed newer Micr=
oBlaze versions can talk AXI stream, and it will also have a role in the Zy=
nq architecture.<br>

<br>FSL / AXI stream is a bit wierd from a device tree point of view - they=
 are point to point, unidirectional buses - FIFOs basically.=A0 Completely =
different from your standard shared SoC bus.=A0 <br><br>We are looking for =
a good way to express this topology in the device tree. It is important to =
get this right - FSL and AXI stream will be an increasingly important way o=
f connecting coprocessors and devices within Xilinx MicroBlaze and Zynq sys=
tems.=A0 We&#39;d like to get consensus now rather than finding opposition =
6-12 months from now when we try to push stuff that we&#39;ve already shipp=
ed.<br>

<br>Thanks,<br><br>John<br></div></div>-- <br>John Williams, PhD, B. Eng, B=
. IT<br>PetaLogix - Linux Solutions for a Reconfigurable World<br>w: <a hre=
f=3D"http://www.petalogix.com" target=3D"_blank">www.petalogix.com</a>=A0=
=A0p: +61-7-30090663=A0 f: +61-7-30090663<br>



--0015175cb6b87e432204a7e13bb0--

--===============5118220316635599119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5118220316635599119==--
