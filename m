From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V5 2/2] mfd: stmpe: Update DT support in stmpe driver
Date: Fri, 30 Nov 2012 19:14:09 +0530
Message-ID: <CAKohpomsvLVk_uAy_JCYdh+m4Xid_D2oRwB-uO7OH_SgffX8_Q@mail.gmail.com>
References: <2dcd7cb4c4022fa24b5328974e4226f5aaf89419.1354199865.git.viresh.kumar@linaro.org>
 <121653def4e985b0c1b59045637dd4518f97e73a.1354199865.git.viresh.kumar@linaro.org>
 <20121130105731.GN3176@sortiz-mobl>
 <20121130124518.GF26023@gmail.com>
 <CAKohpomNFmLwf-Gs_mmXV0ULU87-FWCxVGUTfrEM-m6NNt3nPw@mail.gmail.com>
 <20121130132036.GA23648@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4235248934484842741=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121130132036.GA23648-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shiraz.hashim-qxv4g6HH51o@public.gmane.org, rabin.vincent-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============4235248934484842741==
Content-Type: multipart/alternative; boundary=bcaec5554fd21bb56604cfb69839

--bcaec5554fd21bb56604cfb69839
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Nov 30, 2012 6:50 PM, "Lee Jones" <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
> On Fri, 30 Nov 2012, Viresh Kumar wrote:
>
> > On 30 November 2012 18:15, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > > The patch doesn't apply for me - does it for you?
> > >
> > > Viresh, what's it based on?
> >
> > Because this was applied 2 days back by Samuel, and i didn't
> > fetch it again yesterday:
> >
> > commit 20d5c7defc228cdaeff3ce3442f3a4e86af293c1
> > Author: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> > Date:   Mon Nov 12 09:20:49 2012 -0800
> >
> > Its a simple conflict to fix, as this is the only place of conflict.
>
> Eh? You don't know what my tree is based on. ;)
>
> What does this patch apply on top of? Which -rc?

Mfd/for-next

> --
> Lee Jones
> Linaro ST-Ericsson Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog

--bcaec5554fd21bb56604cfb69839
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p><br>
On Nov 30, 2012 6:50 PM, &quot;Lee Jones&quot; &lt;<a href=3D"mailto:lee.jo=
nes-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, 30 Nov 2012, Viresh Kumar wrote:<br>
&gt;<br>
&gt; &gt; On 30 November 2012 18:15, Lee Jones &lt;<a href=3D"mailto:lee.jo=
nes-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt; wrote:<br>
&gt; &gt; &gt; The patch doesn&#39;t apply for me - does it for you?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Viresh, what&#39;s it based on?<br>
&gt; &gt;<br>
&gt; &gt; Because this was applied 2 days back by Samuel, and i didn&#39;t<=
br>
&gt; &gt; fetch it again yesterday:<br>
&gt; &gt;<br>
&gt; &gt; commit 20d5c7defc228cdaeff3ce3442f3a4e86af293c1<br>
&gt; &gt; Author: Randy Dunlap &lt;<a href=3D"mailto:rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org"=
>rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org</a>&gt;<br>
&gt; &gt; Date: =C2=A0 Mon Nov 12 09:20:49 2012 -0800<br>
&gt; &gt;<br>
&gt; &gt; Its a simple conflict to fix, as this is the only place of confli=
ct.<br>
&gt;<br>
&gt; Eh? You don&#39;t know what my tree is based on. ;)<br>
&gt;<br>
&gt; What does this patch apply on top of? Which -rc?</p>
<p>Mfd/for-next</p>
<p>&gt; --<br>
&gt; Lee Jones<br>
&gt; Linaro ST-Ericsson Landing Team Lead<br>
&gt; Linaro.org =E2=94=82 Open source software for ARM SoCs<br>
&gt; Follow Linaro: Facebook | Twitter | Blog<br>
</p>

--bcaec5554fd21bb56604cfb69839--

--===============4235248934484842741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4235248934484842741==--
