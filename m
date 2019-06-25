Return-Path: <SRS0=qgQe=UY=gmail.com=open.sudheer@kernel.org>
MIME-Version: 1.0
References: <1561115855-4186-1-git-send-email-open.sudheer@gmail.com> <20190621131729.GA9997@kroah.com>
In-Reply-To: <20190621131729.GA9997@kroah.com>
From: sudheer v <open.sudheer@gmail.com>
Date: Tue, 25 Jun 2019 10:30:32 +0530
Message-ID: <CAE-5=DTdo4qDUPRw+Giu=bCcpqu7EdLDt5ddDvqLSgGbuqE1Fg@mail.gmail.com>
Subject: Re: [patch 0/5] *** DMA based UART driver for AST2500 ***
Content-Type: multipart/alternative; boundary="000000000000ab7baa058c1ecfee"
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, ShivahShankar Shakarnarayan rao <shivahshankar.shankarnarayanrao@aspeedtech.com>, Shiva shankar <shivahshankar@gmail.com>, Sudheer V <sudheer.veliseti@aspeedtech.com>, sudheer veliseti <sudheer.open@gmail.com>, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org
List-ID: <devicetree@vger.kernel.org>

--000000000000ab7baa058c1ecfee
Content-Type: text/plain; charset="UTF-8"

Hi Greg,
When i last submitted patches, i have not added change-logs.
and also used custom debugs instead of kernel dynamic debugs.
So i have resubmitted the patches , considering you have discarded old set.
I want to send any changes suggested  from now on wards  with versioning
V1,V2...so on.
Is this acceptable for you? or should i submit the patches again as V1 once
again.?

-Sudheer


On Fri, Jun 21, 2019 at 6:47 PM Greg KH <gregkh@linuxfoundation.org> wrote:

> On Fri, Jun 21, 2019 at 04:47:30PM +0530, sudheer.v wrote:
> > From: sudheer veliseti <sudheer.open@gmail.com>
> >
> > Hi,
> > AST2500 has dedicated Uart DMA controller which has 12 sets of
> > Tx and RX channels connected to UART controller directly.
> > Since the DMA controller have dedicated buffers and registers,
> > there would be little benifit in adding DMA framework overhead.
> > So the software for DMA controller is included within the UART driver
> itself.
> >
> > Thanks and Regards
> > Sudheer.V
>
> Is this a v2 of this patch series?
>
> You always have to version your patches and say what changed from the
> previous one, like the documentation says to do.
>
> Please fix this up and resend.
>
> thanks,
>
> greg k-h
>

--000000000000ab7baa058c1ecfee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Greg,<div>When i last submitted patches, i have not add=
ed change-logs.<br>and also used custom debugs instead of kernel dynamic de=
bugs.</div><div>So i have resubmitted the patches , considering you have di=
scarded old set.</div><div>I want to send any changes suggested=C2=A0 from =
now on wards=C2=A0 with versioning V1,V2...so on.</div><div>Is this accepta=
ble for you? or should i submit the patches again as V1 once again.?</div><=
div><br></div><div>-Sudheer</div><div><br></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 21, 2019 at 6:4=
7 PM Greg KH &lt;<a href=3D"mailto:gregkh@linuxfoundation.org">gregkh@linux=
foundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Fri, Jun 21, 2019 at 04:47:30PM +0530, sudheer.v wrote:<br=
>
&gt; From: sudheer veliseti &lt;<a href=3D"mailto:sudheer.open@gmail.com" t=
arget=3D"_blank">sudheer.open@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Hi,<br>
&gt; AST2500 has dedicated Uart DMA controller which has 12 sets of<br>
&gt; Tx and RX channels connected to UART controller directly.<br>
&gt; Since the DMA controller have dedicated buffers and registers,<br>
&gt; there would be little benifit in adding DMA framework overhead.<br>
&gt; So the software for DMA controller is included within the UART driver =
itself.<br>
&gt; <br>
&gt; Thanks and Regards<br>
&gt; Sudheer.V<br>
<br>
Is this a v2 of this patch series?<br>
<br>
You always have to version your patches and say what changed from the<br>
previous one, like the documentation says to do.<br>
<br>
Please fix this up and resend.<br>
<br>
thanks,<br>
<br>
greg k-h<br>
</blockquote></div>

--000000000000ab7baa058c1ecfee--
