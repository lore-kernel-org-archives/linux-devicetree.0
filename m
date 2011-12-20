From: Richard Zhao <richard.zhao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V3 4/7] cpufreq: add generic cpufreq driver
Date: Wed, 21 Dec 2011 05:57:51 +0800
Message-ID: <CAH8gqwWfDD5_d04rg93a4dmFfymtw_kXEH1Uhze_tDN1knUgUA@mail.gmail.com>
References: <1324264903-15395-1-git-send-email-richard.zhao@linaro.org>
	<4EEF519C.4090808@gmail.com>
	<20111220015934.GD15863@b20223-02.ap.freescale.net>
	<201112201521.37747.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3688559450507059403=="
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <201112201521.37747.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, eric.miao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org, cpufreq-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, davej-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============3688559450507059403==
Content-Type: multipart/alternative; boundary=f46d043be19a9bd83004b48d28e7

--f46d043be19a9bd83004b48d28e7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=E5=9C=A8 2011-12-20 =E4=B8=8B=E5=8D=8811:22=EF=BC=8C"Arnd Bergmann" <arnd@=
arndb.de>=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tuesday 20 December 2011, Richard Zhao wrote:
> > > >>>> +Generic cpufreq driver
> > > >>>> +
> > > >>>> +Required properties in /cpus/cpu@0:
> > > >>>> +- compatible : "generic-cpufreq"
> > > >>>
> > > >>> I'm not convinced this is the best way to do this.  By requiring =
a
> > > >>> generic-cpufreq compatible string we're encoding Linux driver
> > > >>> information into the hardware description.  The only way I can
see to
> > > >>> avoid this is to provide a generic_clk_cpufreq_init() function
that
> > > >>> platforms can call in their machine init code to use the driver.
> > >
> > > Agreed on the compatible string.
> > Assume you reject to use compatible string.
> > > It's putting Linux specifics into DT.
> > >
> > > You could flip this around and have the module make a call into the
> > > kernel to determine whether to initialize or not. Then platforms coul=
d
> > > set a flag to indicate this.
> > Could you make it more clear? kernel global variable, macro, or
function?
> >
> > - Following your idea, I think, we can add in driver/cpufreq/cpufreq.c:
> > int (*clk_reg_cpufreq_get_op_table) (struct op_table *tbl, int *size);
> > SoC code set the callback. If it's NULL, driver will exit. We can get
rid
> > of DT. It'll make cpufreq core dirty, but it's the only file built-in.
> >
> > - Drop module support. SoC call generic_clk_cpufreq_init as Jamie said.
>
> I think you don't actually need a "compatible" property here, as long as
we
> ensure that the "cpu-freqs", "cpu-volts" and "trans-latency" properties
are
> present in the cpu node if and only if the machine works with this driver
> (why else would you put them there?).
It is more easy for me.
Rob, agree?

Richard
>
> CPUs are special in the device trees in a number of ways, so I think we
> can treat this as a logical extension. This way, you can still make the
> generic cpufreq driver a loadable module. You don't get module autoloadin=
g
> with this structure, but that is already the case because the cpu nodes
> in the device tree are not translated into linux devices.
>
>        Arnd

--f46d043be19a9bd83004b48d28e7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p><br>
=E5=9C=A8 2011-12-20 =E4=B8=8B=E5=8D=8811:22=EF=BC=8C&quot;Arnd Bergmann&qu=
ot; &lt;<a href=3D"mailto:arnd-r2nGTMty4D4@public.gmane.org">arnd-r2nGTMty4D4@public.gmane.org</a>&gt;=E5=86=99=E9=
=81=93=EF=BC=9A<br>
&gt;<br>
&gt; On Tuesday 20 December 2011, Richard Zhao wrote:<br>
&gt; &gt; &gt; &gt;&gt;&gt;&gt; +Generic cpufreq driver<br>
&gt; &gt; &gt; &gt;&gt;&gt;&gt; +<br>
&gt; &gt; &gt; &gt;&gt;&gt;&gt; +Required properties in /cpus/cpu@0:<br>
&gt; &gt; &gt; &gt;&gt;&gt;&gt; +- compatible : &quot;generic-cpufreq&quot;=
<br>
&gt; &gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt;&gt; I&#39;m not convinced this is the best way to d=
o this. =C2=A0By requiring a<br>
&gt; &gt; &gt; &gt;&gt;&gt; generic-cpufreq compatible string we&#39;re enc=
oding Linux driver<br>
&gt; &gt; &gt; &gt;&gt;&gt; information into the hardware description. =C2=
=A0The only way I can see to<br>
&gt; &gt; &gt; &gt;&gt;&gt; avoid this is to provide a generic_clk_cpufreq_=
init() function that<br>
&gt; &gt; &gt; &gt;&gt;&gt; platforms can call in their machine init code t=
o use the driver.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Agreed on the compatible string.<br>
&gt; &gt; Assume you reject to use compatible string.<br>
&gt; &gt; &gt; It&#39;s putting Linux specifics into DT.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; You could flip this around and have the module make a call i=
nto the<br>
&gt; &gt; &gt; kernel to determine whether to initialize or not. Then platf=
orms could<br>
&gt; &gt; &gt; set a flag to indicate this.<br>
&gt; &gt; Could you make it more clear? kernel global variable, macro, or f=
unction?<br>
&gt; &gt;<br>
&gt; &gt; - Following your idea, I think, we can add in driver/cpufreq/cpuf=
req.c:<br>
&gt; &gt; int (*clk_reg_cpufreq_get_op_table) (struct op_table *tbl, int *s=
ize);<br>
&gt; &gt; SoC code set the callback. If it&#39;s NULL, driver will exit. We=
 can get rid<br>
&gt; &gt; of DT. It&#39;ll make cpufreq core dirty, but it&#39;s the only f=
ile built-in.<br>
&gt; &gt;<br>
&gt; &gt; - Drop module support. SoC call generic_clk_cpufreq_init as Jamie=
 said.<br>
&gt;<br>
&gt; I think you don&#39;t actually need a &quot;compatible&quot; property =
here, as long as we<br>
&gt; ensure that the &quot;cpu-freqs&quot;, &quot;cpu-volts&quot; and &quot=
;trans-latency&quot; properties are<br>
&gt; present in the cpu node if and only if the machine works with this dri=
ver<br>
&gt; (why else would you put them there?).<br>
It is more easy for me. <br>
Rob, agree?</p>
<p>Richard<br>
&gt;<br>
&gt; CPUs are special in the device trees in a number of ways, so I think w=
e<br>
&gt; can treat this as a logical extension. This way, you can still make th=
e<br>
&gt; generic cpufreq driver a loadable module. You don&#39;t get module aut=
oloading<br>
&gt; with this structure, but that is already the case because the cpu node=
s<br>
&gt; in the device tree are not translated into linux devices.<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0Arnd<br>
</p>

--f46d043be19a9bd83004b48d28e7--


--===============3688559450507059403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linaro-dev mailing list
linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
http://lists.linaro.org/mailman/listinfo/linaro-dev

--===============3688559450507059403==--
