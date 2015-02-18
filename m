Return-Path: <sneeker.yeh@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20150218143345.GC3651@saruman.tx.rr.com>
References: <1424151697-2084-1-git-send-email-Sneeker.Yeh@tw.fujitsu.com>
	<1424151697-2084-2-git-send-email-Sneeker.Yeh@tw.fujitsu.com>
	<54E451B1.8020401@intel.com>
	<20150218143345.GC3651@saruman.tx.rr.com>
Date: Wed, 18 Feb 2015 22:39:53 +0800
Message-ID: <CAJ1gpc3CT8RBZaXDbFz67mG5RcKOEfoxLjh8PEMq1Cme1QW1Vg@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] xhci: add a quirk for device disconnection errata
 for Synopsis Designware USB3 core
From: Sneeker Yeh <sneeker.yeh@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c0987cdc3239050f5dcaa2
To: Felipe Balbi <balbi@ti.com>
Cc: Kumar Gala <galak@codeaurora.org>, linux-usb@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sneeker Yeh <Sneeker.Yeh@tw.fujitsu.com>, Andy Green <andy.green@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Huang Rui <ray.huang@amd.com>, Jassi Brar <jaswinder.singh@linaro.org>, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>
List-ID: <devicetree@vger.kernel.org>

--001a11c0987cdc3239050f5dcaa2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
2015/2/18 =E4=B8=8B=E5=8D=8810:34 =E6=96=BC "Felipe Balbi" <balbi@ti.com> =
=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, Feb 18, 2015 at 10:47:45AM +0200, Mathias Nyman wrote:
> > Hi
> >
> > This looks correct, but if you are still going to make a new series
fixing
> > Felipe's comments then the following tiny nitpicks could be fixed as
well.
> >
> > Otherwise
> >
> > Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> >
> > Felipe, Do you want to take this series through your tree?
>
> I can, no issues :-)
>
> > On 17.02.2015 07:41, Sneeker Yeh wrote:
> > >
> > > +static void xhci_try_to_clear_csc(struct usb_hcd *hcd, int
dev_port_num)
> >
> > Either add a function description explaining something like "Late
> > clearing of connect status.
> > Some quirky hardware will suspend the controller when CSC bit is
> > cleared and leave URBs unhandled"
> >
> > Or change the function name to something like
> > xhci_late_csc_clear_quirk() or xhci_deferred_csc_clear_quirk()
>
> I have a feeling xhci_late_csc_clear_quirk() is a better name, much more
> descriptive than xhci_try_to_clear_csc() :-)

Hmm, I'll use this one, ^^
Thanks for comment it.

Much appreciate,
Sneeker

>
> --
> balbi

--001a11c0987cdc3239050f5dcaa2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi,<br>
2015/2/18 =E4=B8=8B=E5=8D=8810:34 =E6=96=BC &quot;Felipe Balbi&quot; &lt;<a=
 href=3D"mailto:balbi@ti.com">balbi@ti.com</a>&gt; =E5=AF=AB=E9=81=93=EF=BC=
=9A<br>
&gt;<br>
&gt; On Wed, Feb 18, 2015 at 10:47:45AM +0200, Mathias Nyman wrote:<br>
&gt; &gt; Hi<br>
&gt; &gt;<br>
&gt; &gt; This looks correct, but if you are still going to make a new seri=
es fixing<br>
&gt; &gt; Felipe&#39;s comments then the following tiny nitpicks could be f=
ixed as well.<br>
&gt; &gt;<br>
&gt; &gt; Otherwise<br>
&gt; &gt;<br>
&gt; &gt; Acked-by: Mathias Nyman &lt;<a href=3D"mailto:mathias.nyman@linux=
.intel.com">mathias.nyman@linux.intel.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Felipe, Do you want to take this series through your tree?<br>
&gt;<br>
&gt; I can, no issues :-)<br>
&gt;<br>
&gt; &gt; On 17.02.2015 07:41, Sneeker Yeh wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +static void xhci_try_to_clear_csc(struct usb_hcd *hcd, int =
dev_port_num)<br>
&gt; &gt;<br>
&gt; &gt; Either add a function description explaining something like &quot=
;Late<br>
&gt; &gt; clearing of connect status.<br>
&gt; &gt; Some quirky hardware will suspend the controller when CSC bit is<=
br>
&gt; &gt; cleared and leave URBs unhandled&quot;<br>
&gt; &gt;<br>
&gt; &gt; Or change the function name to something like<br>
&gt; &gt; xhci_late_csc_clear_quirk() or xhci_deferred_csc_clear_quirk()<br=
>
&gt;<br>
&gt; I have a feeling xhci_late_csc_clear_quirk() is a better name, much mo=
re<br>
&gt; descriptive than xhci_try_to_clear_csc() :-)</p>
<p dir=3D"ltr">Hmm, I&#39;ll use this one, ^^<br>
Thanks for comment it.</p>
<p dir=3D"ltr">Much appreciate,<br>
Sneeker</p>
<p dir=3D"ltr">&gt;<br>
&gt; --<br>
&gt; balbi<br>
</p>

--001a11c0987cdc3239050f5dcaa2--
