From: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Subject: Re: [PATCH] uio/pdrv_genirq: Add OF support
Date: Thu, 31 Mar 2011 23:10:21 +1000
Message-ID: <AANLkTi=sG6oVNifwLLi8jjKQXjR6kXZx43NxtFfoPumy@mail.gmail.com>
References: <1301574600-4861-1-git-send-email-monstr@monstr.eu>
	<1301574600-4861-2-git-send-email-monstr@monstr.eu>
	<20110331124925.GA2202@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0182303076030815113=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110331124925.GA2202-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: hjk-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, gregkh-l3A5Bk7waGM@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============0182303076030815113==
Content-Type: multipart/alternative; boundary=000e0cd174ee2e59d0049fc7056a

--000e0cd174ee2e59d0049fc7056a
Content-Type: text/plain; charset=ISO-8859-1

Hi Wolfram,

We discuss this again :)

On Thu, Mar 31, 2011 at 10:49 PM, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>wrote:

> On Thu, Mar 31, 2011 at 02:30:00PM +0200, Michal Simek wrote:
> > Support OF support. "generic-uio" compatible property is used.
>
> And exactly this was the issue last time (when I tried). This is a
> generic property, which is linux-specific and not describing HW. The
> agreement back then was to we probably need to add compatible-entries at
> runtime (something like new_id for USB). So the uio-of-driver could be
> matched against any device. Otherwise, we would collect a lot of
> potential entries like "vendor,special-card1". Although I wonder
> meanwhile if it is really going to be that bad; we don't have so much
> UIO-driver in tree as well. Maybe worth a try?
>

Maybe I misunderstand you, in my view it is the responsibility of <vendor>
to create their DTS files to indicate they want <special-card1> to bind to
generic-uio.

So, no great list of compat strings should grow in the driver, but rather
the user of the driver must make it happen.

Am I missing something?

Our use-case is pretty clear, in FPGA-based systems it is common to create
arbitrary devices that developers just want to control from userspace, with
simple IRQ and IO capabilities (DMA can come later :).  They don't need to
bind to other kernel APIs or subsystems, and don't want to invest in one-off
kernel drivers that simply will never go upstream.

UIO is perfect, and simply tagging the device as generic-uio in the DTS is
so simple, clean, and elegant.  Traditional embedded developers really light
up when you tell them you can write simple IRQ handlers in Linux userspace.
 They love it even more if they don't have to write a line of kernel code,
which generic-uio enables.

John
-- 
John Williams, PhD, B. Eng, B. IT
PetaLogix - Linux Solutions for a Reconfigurable World
w: www.petalogix.com  p: +61-7-30090663  f: +61-7-30090663

--000e0cd174ee2e59d0049fc7056a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,<br><br><div>We discuss this again :)</div><div><br><div class=
=3D"gmail_quote">On Thu, Mar 31, 2011 at 10:49 PM, Wolfram Sang <span dir=
=3D"ltr">&lt;<a href=3D"mailto:w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org">w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org=
</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex;"><div class=3D"im">On Thu, Mar 31, 2011 at 0=
2:30:00PM +0200, Michal Simek wrote:<br>
&gt; Support OF support. &quot;generic-uio&quot; compatible property is use=
d.<br>
<br>
</div>And exactly this was the issue last time (when I tried). This is a<br=
>
generic property, which is linux-specific and not describing HW. The<br>
agreement back then was to we probably need to add compatible-entries at<br=
>
runtime (something like new_id for USB). So the uio-of-driver could be<br>
matched against any device. Otherwise, we would collect a lot of<br>
potential entries like &quot;vendor,special-card1&quot;. Although I wonder<=
br>
meanwhile if it is really going to be that bad; we don&#39;t have so much<b=
r>
UIO-driver in tree as well. Maybe worth a try?<br></blockquote><div><br></d=
iv><div>Maybe I misunderstand you, in my view it is the responsibility of &=
lt;vendor&gt; to create their DTS files to indicate they want &lt;special-c=
ard1&gt; to bind to generic-uio.</div>

<div><br></div><div>So, no great list of compat strings should grow in the =
driver, but rather the user of the driver must make it happen.</div><div><b=
r></div><div>Am I missing something?</div><div><br></div><div>Our use-case =
is pretty clear, in FPGA-based systems it is common to create arbitrary dev=
ices that developers just want to control from userspace, with simple IRQ a=
nd IO capabilities (DMA can come later :). =A0They don&#39;t need to bind t=
o other kernel APIs or subsystems, and don&#39;t want to invest in one-off =
kernel drivers that simply will never go upstream.</div>

<div><br></div><div>UIO is perfect, and simply tagging the device as generi=
c-uio in the DTS is so simple, clean, and elegant. =A0Traditional embedded =
developers really light up when you tell them you can write simple IRQ hand=
lers in Linux userspace. =A0They love it even more if they don&#39;t have t=
o write a line of kernel code, which generic-uio enables.</div>

<div><br></div><div>John</div><div>--=A0</div></div>John Williams, PhD, B. =
Eng, B. IT<br>PetaLogix - Linux Solutions for a Reconfigurable World<br>w: =
<a href=3D"http://www.petalogix.com" target=3D"_blank">www.petalogix.com</a=
>=A0=A0p: +61-7-30090663=A0 f: +61-7-30090663<br>


</div>

--000e0cd174ee2e59d0049fc7056a--

--===============0182303076030815113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0182303076030815113==--
