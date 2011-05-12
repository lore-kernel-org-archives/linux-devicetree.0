From: Thomas De Schampheleire <patrickdepinguin+devicetree-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5] uio/pdrv_genirq: Add OF support
Date: Thu, 12 May 2011 15:56:37 +0200
Message-ID: <BANLkTi=GxtWP1OKL5OshD-3n-CAe19G36Q@mail.gmail.com>
References: <1304577644-4024-1-git-send-email-monstr@monstr.eu>
	<20110506004748.GB2790@local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7602181680051439727=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110506004748.GB2790@local>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "Hans J. Koch" <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============7602181680051439727==
Content-Type: multipart/alternative; boundary=0015175cdfe4ce62e104a3148eb9

--0015175cdfe4ce62e104a3148eb9
Content-Type: text/plain; charset=ISO-8859-1

Hi,

On Fri, May 6, 2011 at 2:47 AM, Hans J. Koch <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org> wrote:

> On Thu, May 05, 2011 at 08:40:44AM +0200, Michal Simek wrote:
>
> I think we've got it.
>
> Thanks,
> Hans
>
> > Adding OF binding to genirq.
> > Version string is setup to the "devicetree".
> >
> > Compatible string is not setup for now but you can add your
> > custom compatible string to uio_of_genirq_match structure.
> >
> > For example with "vendor,device" compatible string:
> > static const struct of_device_id __devinitconst uio_of_genirq_match[] = {
> >       { .compatible = "vendor,device", },
> >       { /* empty for now */ },
> > };
> >
> > Signed-off-by: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
>
> Signed-off-by: Hans J. Koch <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>
>
> > CC: Hans J. Koch <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>
> > CC: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > CC: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
> > CC: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> > CC: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >
>

Sorry for adding to this discussion so late...

I fail to see how a device described in the device tree can be bound to this
generic driver, as the match table is empty. I read in the description:


> Compatible string is not setup for now but you can add your
> custom compatible string to uio_of_genirq_match structure.
>
> For example with "vendor,device" compatible string:
> static const struct of_device_id __devinitconst uio_of_genirq_match[] = {
>       { .compatible = "vendor,device", },
>       { /* empty for now */ },
> };

So, this would mean that for a given project, you need to modify the sources
of the *generic* driver ?

Thanks for clarifying,
Thomas

--0015175cdfe4ce62e104a3148eb9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<br><br><div class=3D"gmail_quote">On Fri, May 6, 2011 at 2:47 AM, Hans =
J. Koch <span dir=3D"ltr">&lt;<a href=3D"mailto:hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org">hjk@hansj=
koch.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
On Thu, May 05, 2011 at 08:40:44AM +0200, Michal Simek wrote:<br>
<br>
I think we&#39;ve got it.<br>
<br>
Thanks,<br>
Hans<br>
<div class=3D"im"><br>
&gt; Adding OF binding to genirq.<br>
&gt; Version string is setup to the &quot;devicetree&quot;.<br>
&gt;<br>
&gt; Compatible string is not setup for now but you can add your<br>
&gt; custom compatible string to uio_of_genirq_match structure.<br>
&gt;<br>
&gt; For example with &quot;vendor,device&quot; compatible string:<br>
&gt; static const struct of_device_id __devinitconst uio_of_genirq_match[] =
=3D {<br>
&gt; =A0 =A0 =A0 { .compatible =3D &quot;vendor,device&quot;, },<br>
&gt; =A0 =A0 =A0 { /* empty for now */ },<br>
&gt; };<br>
&gt;<br>
&gt; Signed-off-by: Michal Simek &lt;<a href=3D"mailto:monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org">mo=
nstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org</a>&gt;<br>
<br>
</div>Signed-off-by: Hans J. Koch &lt;<a href=3D"mailto:hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org">h=
jk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org</a>&gt;<br>
<div><div></div><div class=3D"h5"><br>
&gt; CC: Hans J. Koch &lt;<a href=3D"mailto:hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org">hjk@hansjkoch=
.de</a>&gt;<br>
&gt; CC: Arnd Bergmann &lt;<a href=3D"mailto:arnd-r2nGTMty4D4@public.gmane.org">arnd-r2nGTMty4D4@public.gmane.org</=
a>&gt;<br>
&gt; CC: John Williams &lt;<a href=3D"mailto:john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org">j=
ohn.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org</a>&gt;<br>
&gt; CC: Grant Likely &lt;<a href=3D"mailto:grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org">gran=
t.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org</a>&gt;<br>
&gt; CC: Wolfram Sang &lt;<a href=3D"mailto:w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org">w.sang@p=
engutronix.de</a>&gt;<br>
&gt;<br></div></div></blockquote><div><br>Sorry for adding to this discussi=
on so late...<br><br>I fail to see how a
 device described in the device tree can be bound to this generic=20
driver, as the match table is empty. I read in the description:<div class=
=3D"im"><br>
<br>&gt; Compatible string is not setup for now but you can add your<br>
&gt; custom compatible string to uio_of_genirq_match structure.<br>
&gt;<br>
&gt; For example with &quot;vendor,device&quot; compatible string:<br>
&gt; static const struct of_device_id __devinitconst uio_of_genirq_match[] =
=3D {<br>
&gt; =A0 =A0 =A0 { .compatible =3D &quot;vendor,device&quot;, },<br>
&gt; =A0 =A0 =A0 { /* empty for now */ },<br>
&gt; };<br><br></div>So, this would mean that for a given project, you need=
 to modify the sources of the *generic* driver ?<br><br>Thanks for clarifyi=
ng, <br>Thomas<br><br></div></div>

--0015175cdfe4ce62e104a3148eb9--

--===============7602181680051439727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7602181680051439727==--
