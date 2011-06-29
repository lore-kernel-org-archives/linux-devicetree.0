From: Manjunatha GK <manjugk-l0cyMroinI0@public.gmane.org>
Subject: Re: Converting i2c-omap driver to use device tree
Date: Wed, 29 Jun 2011 10:23:25 +0530
Message-ID: <BANLkTimDM6XYf3X=eRhZUDUij1TkhQGBnQ@mail.gmail.com>
References: <BANLkTin0zaE6M=0+9bq6sCvCVO_PJqYseA@mail.gmail.com>
	<BANLkTi=DmNC6BbwDU+4smFvbc+LzFLiiOA@mail.gmail.com>
	<BANLkTi==YKS854=YDGG44BRy_km31LqifQ@mail.gmail.com>
	<20110626081202.GB24241@ponder.secretlab.ca>
	<BANLkTimJU1ecxAroZMdWDdcAg6icH1mXyA@mail.gmail.com>
	<BANLkTinNVzgGhEXSfQf+WpSMtoUDN-5Jag@mail.gmail.com>
	<20110628193854.GA26182@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6921072534210603608=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110628193854.GA26182-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
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
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org\"" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============6921072534210603608==
Content-Type: multipart/alternative; boundary=20cf30266eda90a4e204a6d29093

--20cf30266eda90a4e204a6d29093
Content-Type: text/plain; charset=ISO-8859-1

On 29 June 2011 01:08, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
[...]

> > >
> > > Any specific reason for missing entries in device node structures?
> > >
> > > Since you explored other ARM boards, is this interrupts field used and
> > > tested?
>
> What tree do you have your work based on top of?


git://git.secretlab.ca/git/linux-2.6.git
branch: devicetree/test

Do you have the irq_domain patch applied?

If so, then the problem is most likely that an
> irq_domain has not been registered for the OMAP interrupt controller
> (which is not surprising since the gic has not been converted to use
> irq_domain yet).  There are patches that have been posted to the list
> to do so, but they are not finished yet.

ok.


> In the mean time you can use
> irq_domain_generate_simple() to create an irq_domain registration for
> the OMAP that will get you past this step.
>
> Search the devicetree/test branch for irq_domain_generate_simple() to
> see how to use it.
>
> I realized this hence used

node = of_find_matching_node_by_address(NULL, omap_dt_gic_match,
                                                OMAP44XX_GIC_DIST_BASE);
        if (node)
                irq_domain_add_simple(node, 0);

which resolved the irq issue.

Thanks for the info.

-Manjunath

--20cf30266eda90a4e204a6d29093
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On 29 June 2011 01:08, Grant Likely <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org">grant.likely=
@secretlab.ca</a>&gt;</span> wrote:<br><div>[...] <br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px sol=
id rgb(204, 204, 204); padding-left: 1ex;">
<div><div class=3D"h5">
&gt; &gt;<br>
&gt; &gt; Any specific reason for missing entries in device node structures=
?<br>
&gt; &gt;<br>
&gt; &gt; Since you explored other ARM boards, is this interrupts field use=
d and<br>
&gt; &gt; tested?<br>
<br>
</div></div>What tree do you have your work based on top of? =A0</blockquot=
e><div>=A0</div>git://<a href=3D"http://git.secretlab.ca/git/linux-2.6.git"=
>git.secretlab.ca/git/linux-2.6.git</a><br>branch: devicetree/test<br><br><=
blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; border=
-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
Do you have the irq_domain patch applied? =A0 </blockquote><div></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; border-lef=
t: 1px solid rgb(204, 204, 204); padding-left: 1ex;">If so, then the proble=
m is most likely that an<br>

irq_domain has not been registered for the OMAP interrupt controller<br>
(which is not surprising since the gic has not been converted to use<br>
irq_domain yet). =A0There are patches that have been posted to the list<br>
to do so, but they are not finished yet. =A0</blockquote><div>ok.<br>=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; bo=
rder-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">In the mean ti=
me you can use<br>

irq_domain_generate_simple() to create an irq_domain registration for<br>
the OMAP that will get you past this step.<br>
<br>
Search the devicetree/test branch for irq_domain_generate_simple() to<br>
see how to use it.<br>
<br></blockquote><div>I realized this hence used =A0=A0=A0=A0=A0=A0=A0 <br>=
<br>node =3D of_find_matching_node_by_address(NULL, omap_dt_gic_match,<br>=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OMAP44XX=
_GIC_DIST_BASE);<br>=A0=A0=A0=A0=A0=A0=A0 if (node)<br>
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 irq_domain_add_simple(node, 0=
);<br><br>which resolved the irq issue.<br><br>Thanks for the info.<br>
</div></div><br>-Manjunath<br>

--20cf30266eda90a4e204a6d29093--

--===============6921072534210603608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6921072534210603608==--
