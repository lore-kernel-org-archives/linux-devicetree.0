From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V2 3/3] ARM: SPEAr13xx: Pass DW DMAC platform data from DT
Date: Sat, 13 Oct 2012 14:18:04 +0530
Message-ID: <CAKohpokfei_ryGKMh4wE9D=wyRZCkddc+Da1cq+3facTHradKQ@mail.gmail.com>
References: <142ef9170a2c69657d8a05ac127a9970d7b04965.1350051925.git.viresh.kumar@linaro.org>
 <2039bc164224b0068bc078b6cd8df6218e754fce.1350051925.git.viresh.kumar@linaro.org>
 <20121012144837.GE12801@game.jcrosoft.org>
 <CAKohpo=vMchmiz70evBB5bPqt4O4DWUocd5M1o9gc8fsY_Fkiw@mail.gmail.com>
 <20121012162148.GH12801@game.jcrosoft.org>
 <CAKohpok5ZOmz9CCJbTGc=_tncxnZYEW7UMh2FcFcs0dB87JAcQ@mail.gmail.com>
 <20121013064422.GJ12801@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1686862105342535500=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20121013064422.GJ12801@game.jcrosoft.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: vinod.koul@intel.com, devicetree-discuss@lists.ozlabs.org, spear-devel@list.st.com, linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============1686862105342535500==
Content-Type: multipart/alternative; boundary=f46d0447882ddc3cc604cbecdcb9

--f46d0447882ddc3cc604cbecdcb9
Content-Type: text/plain; charset=ISO-8859-1

On Oct 13, 2012 12:16 PM, "Jean-Christophe PLAGNIOL-VILLARD" <
plagnioj@jcrosoft.com> wrote:
>
> On 22:42 Fri 12 Oct     , Viresh Kumar wrote:
> > On 12 October 2012 21:51, Jean-Christophe PLAGNIOL-VILLARD
> > <plagnioj@jcrosoft.com> wrote:
> > >> >> +     OF_DEV_AUXDATA("arasan,cf-spear1340", MCIF_CF_BASE, NULL,
"cf"),
> > >> > ?/
> > >>
> > >> Sorry. can't get it :(
> > > what is the "cf" as paltfrom data
> >
> > This is dma bus_id string, which matches with what is passed from dtb.
> so pass if via dtb too

Yes. Already passed in 13xx.dtsi.

--f46d0447882ddc3cc604cbecdcb9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p><br>
On Oct 13, 2012 12:16 PM, &quot;Jean-Christophe PLAGNIOL-VILLARD&quot; &lt;=
<a href=3D"mailto:plagnioj@jcrosoft.com">plagnioj@jcrosoft.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; On 22:42 Fri 12 Oct =A0 =A0 , Viresh Kumar wrote:<br>
&gt; &gt; On 12 October 2012 21:51, Jean-Christophe PLAGNIOL-VILLARD<br>
&gt; &gt; &lt;<a href=3D"mailto:plagnioj@jcrosoft.com">plagnioj@jcrosoft.co=
m</a>&gt; wrote:<br>
&gt; &gt; &gt;&gt; &gt;&gt; + =A0 =A0 OF_DEV_AUXDATA(&quot;arasan,cf-spear1=
340&quot;, MCIF_CF_BASE, NULL, &quot;cf&quot;),<br>
&gt; &gt; &gt;&gt; &gt; ?/<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Sorry. can&#39;t get it :(<br>
&gt; &gt; &gt; what is the &quot;cf&quot; as paltfrom data<br>
&gt; &gt;<br>
&gt; &gt; This is dma bus_id string, which matches with what is passed from=
 dtb.<br>
&gt; so pass if via dtb too</p>
<p>Yes. Already passed in 13xx.dtsi.</p>

--f46d0447882ddc3cc604cbecdcb9--


--===============1686862105342535500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1686862105342535500==--
