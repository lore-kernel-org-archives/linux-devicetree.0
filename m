From: Richard Zhao <richard.zhao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V3 4/7] cpufreq: add generic cpufreq driver
Date: Wed, 21 Dec 2011 06:16:00 +0800
Message-ID: <CAH8gqwXDaxOCOCf3y11aQQ4oz8LZSD0RabMEM8j85rD1qHN2jw@mail.gmail.com>
References: <1324264903-15395-1-git-send-email-richard.zhao@linaro.org>
	<1324264903-15395-5-git-send-email-richard.zhao@linaro.org>
	<20111219100512.GC2459@totoro>
	<20111219141925.GA1789@richard-laptop>
	<20111219143913.GI2351@totoro> <4EEF519C.4090808@gmail.com>
	<20111220015934.GD15863@b20223-02.ap.freescale.net>
	<4EF0A612.2060400@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8375384777065874707=="
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <4EF0A612.2060400-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, eric.miao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, cpufreq-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, davej-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============8375384777065874707==
Content-Type: multipart/alternative; boundary=f46d043be19a808abf04b48d69cd

--f46d043be19a808abf04b48d69cd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=E5=9C=A8 2011-12-20 =E4=B8=8B=E5=8D=8811:13=EF=BC=8C"Rob Herring" <robherr=
ing2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
>
> On 12/19/2011 07:59 PM, Richard Zhao wrote:
> > On Mon, Dec 19, 2011 at 09:00:44AM -0600, Rob Herring wrote:
> >> On 12/19/2011 08:39 AM, Jamie Iles wrote:
> >>> On Mon, Dec 19, 2011 at 10:19:29PM +0800, Richard Zhao wrote:
> >>>> On Mon, Dec 19, 2011 at 10:05:12AM +0000, Jamie Iles wrote:
> >>>>> Hi Richard,
> >>>>>
> >>>>> On Mon, Dec 19, 2011 at 11:21:40AM +0800, Richard Zhao wrote:
> >>>>>> It support single core and multi-core ARM SoCs. But currently it
assume
> >>>>>> all cores share the same frequency and voltage.
> >>>>>>
> >>>>>> Signed-off-by: Richard Zhao <richard.zhao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>>>>> ---
> >>>>>>  .../devicetree/bindings/cpufreq/generic-cpufreq    |    7 +
> >>>>>>  drivers/cpufreq/Kconfig                            |    8 +
> >>>>>>  drivers/cpufreq/Makefile                           |    2 +
> >>>>>>  drivers/cpufreq/generic-cpufreq.c                  |  251
++++++++++++++++++++
> >>>>>>  4 files changed, 268 insertions(+), 0 deletions(-)
> >>>>>>  create mode 100644
Documentation/devicetree/bindings/cpufreq/generic-cpufreq
> >>>>>>  create mode 100644 drivers/cpufreq/generic-cpufreq.c
> >>>>>>
> >>>>>> diff --git
a/Documentation/devicetree/bindings/cpufreq/generic-cpufreq
b/Documentation/devicetree/bindings/cpufreq/generic-cpufreq
> >>>>>> new file mode 100644
> >>>>>> index 0000000..15dd780
> >>>>>> --- /dev/null
> >>>>>> +++ b/Documentation/devicetree/bindings/cpufreq/generic-cpufreq
> >>>>>> @@ -0,0 +1,7 @@
> >>>>>> +Generic cpufreq driver
> >>>>>> +
> >>>>>> +Required properties in /cpus/cpu@0:
> >>>>>> +- compatible : "generic-cpufreq"
> >>>>>
> >>>>> I'm not convinced this is the best way to do this.  By requiring a
> >>>>> generic-cpufreq compatible string we're encoding Linux driver
> >>>>> information into the hardware description.  The only way I can see
to
> >>>>> avoid this is to provide a generic_clk_cpufreq_init() function that
> >>>>> platforms can call in their machine init code to use the driver.
> >>
> >> Agreed on the compatible string.
> > Assume you reject to use compatible string.
> >> It's putting Linux specifics into DT.
> >>
> >> You could flip this around and have the module make a call into the
> >> kernel to determine whether to initialize or not. Then platforms could
> >> set a flag to indicate this.
> > Could you make it more clear? kernel global variable, macro, or
function?
>
> Any of those. Of course, direct access to variables across modules is
> discouraged, so it would probably be a function that checks a variable.
why not use function pointer? arch that don't use this driver do not have
to set it. if use function, everyone should define it.
>
> > - Following your idea, I think, we can add in driver/cpufreq/cpufreq.c:
> > int (*clk_reg_cpufreq_get_op_table) (struct op_table *tbl, int *size);
> > SoC code set the callback. If it's NULL, driver will exit. We can get
rid
> > of DT. It'll make cpufreq core dirty, but it's the only file built-in.
>
> But aren't you getting the operating points from the DT? Then you don't
> want to put this code into each platform.
the variable is mainly used to check whether some platform want  to use
this driver. getting ride of dt is side affect.
>
> >
> > - Drop module support. SoC call generic_clk_cpufreq_init as Jamie said.
> >
> >>
> >>>> It'll prevent the driver from being a kernel module.
> >>>
> >>> Hmm, that's not very nice either!  I guess you _could_ add an
> >>> of_machine_is_compatible() check against a list of compatible machine=
s
> >>> in the driver but that feels a little gross.  Hopefully Rob or Grant
> >>> have a good alternative!
> >>>
> >>
> >> What does cpufreq core do if multiple drivers are registered?
> > current cpufreq core only support one cpufreq_driver. Others will fail
> > except the first time.
>
> Then whoever gets there first wins. Make your driver register late and
> if someone doesn't want to use it they can register a custom driver
earlier.
this driver did
>
> Rob
>
> >> Perhaps a
> >> ranking is needed and this would only get enabled if there are no othe=
r
> >> drivers and other conditions like having the clock "cpu" present are
met.
> > We'd better keep cpufreq core simple. For this driver, register
cpufreq_driver
> > is the last thing after checking all conditions.
> >
> >>
> >> Rob
> >>
> >>>> Hi Grant & Rob,
> >>>>
> >>>> Could you comment?
> >>>>
> >>>>>
> >>>>>> +- cpu-freqs : cpu frequency points it support
> >>>>>> +- cpu-volts : cpu voltages required by the frequency point at the
same index
> >>>>>> +- trans-latency :  transition_latency
> >>>>>> diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
> >>>>>> index e24a2a1..216eecd 100644
> >>>>>> --- a/drivers/cpufreq/Kconfig
> >>>>>> +++ b/drivers/cpufreq/Kconfig
> >>>>>> @@ -179,6 +179,14 @@ config CPU_FREQ_GOV_CONSERVATIVE
> >>>>>>
> >>>>>>            If in doubt, say N.
> >>>>>>
> >>>>>> +config GENERIC_CPUFREQ_DRIVER
> >>>>>> +        bool "Generic cpufreq driver using
clock/regulator/devicetree"
> >>>>>> +        help
> >>>>>> +          This adds generic CPUFreq driver. It assumes all
> >>>>>> +          cores of the CPU share the same clock and voltage.
> >>>>>> +
> >>>>>> +          If in doubt, say N.
> >>>>>
> >>>>> I think this needs dependencies on HAVE_CLK, OF and REGULATOR.
> >>>> right, Thanks. I can not check clk before generic clock framework
> >>>> come in.
> >>>> Added:
> >>>>    depends on OF && REGULATOR
> >>>>    select CPU_FREQ_TABLE
> >>>
> >>> You can still use HAVE_CLK.  That symbol has been around for ages and
> >>> any platform implementing the clk API should select it so it's fine t=
o
> >>> depend on it even before there is a generic struct clk.
> > You are right. Thanks.
> >
> > Richard
> >>>
> >>> Jamie
> >>
> >> _______________________________________________
> >> linux-arm-kernel mailing list
> >> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> >> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> >>
> >
>

--f46d043be19a808abf04b48d69cd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p><br>
=E5=9C=A8 2011-12-20 =E4=B8=8B=E5=8D=8811:13=EF=BC=8C&quot;Rob Herring&quot=
; &lt;<a href=3D"mailto:robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt=
;=E5=86=99=E9=81=93=EF=BC=9A<br>
&gt;<br>
&gt; On 12/19/2011 07:59 PM, Richard Zhao wrote:<br>
&gt; &gt; On Mon, Dec 19, 2011 at 09:00:44AM -0600, Rob Herring wrote:<br>
&gt; &gt;&gt; On 12/19/2011 08:39 AM, Jamie Iles wrote:<br>
&gt; &gt;&gt;&gt; On Mon, Dec 19, 2011 at 10:19:29PM +0800, Richard Zhao wr=
ote:<br>
&gt; &gt;&gt;&gt;&gt; On Mon, Dec 19, 2011 at 10:05:12AM +0000, Jamie Iles =
wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt; Hi Richard,<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; On Mon, Dec 19, 2011 at 11:21:40AM +0800, Richard=
 Zhao wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; It support single core and multi-core ARM SoC=
s. But currently it assume<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; all cores share the same frequency and voltag=
e.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Richard Zhao &lt;<a href=3D"ma=
ilto:richard.zhao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">richard.zhao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; ---<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; =C2=A0.../devicetree/bindings/cpufreq/generic=
-cpufreq =C2=A0 =C2=A0| =C2=A0 =C2=A07 +<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; =C2=A0drivers/cpufreq/Kconfig =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A08 +<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; =C2=A0drivers/cpufreq/Makefile =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; =C2=A0drivers/cpufreq/generic-cpufreq.c =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0251 ++++=
++++++++++++++++<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; =C2=A04 files changed, 268 insertions(+), 0 d=
eletions(-)<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; =C2=A0create mode 100644 Documentation/device=
tree/bindings/cpufreq/generic-cpufreq<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; =C2=A0create mode 100644 drivers/cpufreq/gene=
ric-cpufreq.c<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; diff --git a/Documentation/devicetree/binding=
s/cpufreq/generic-cpufreq b/Documentation/devicetree/bindings/cpufreq/gener=
ic-cpufreq<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; new file mode 100644<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; index 0000000..15dd780<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; --- /dev/null<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; +++ b/Documentation/devicetree/bindings/cpufr=
eq/generic-cpufreq<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; @@ -0,0 +1,7 @@<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; +Generic cpufreq driver<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; +Required properties in /cpus/cpu@0:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; +- compatible : &quot;generic-cpufreq&quot;<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; I&#39;m not convinced this is the best way to do =
this. =C2=A0By requiring a<br>
&gt; &gt;&gt;&gt;&gt;&gt; generic-cpufreq compatible string we&#39;re encod=
ing Linux driver<br>
&gt; &gt;&gt;&gt;&gt;&gt; information into the hardware description. =C2=A0=
The only way I can see to<br>
&gt; &gt;&gt;&gt;&gt;&gt; avoid this is to provide a generic_clk_cpufreq_in=
it() function that<br>
&gt; &gt;&gt;&gt;&gt;&gt; platforms can call in their machine init code to =
use the driver.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Agreed on the compatible string.<br>
&gt; &gt; Assume you reject to use compatible string.<br>
&gt; &gt;&gt; It&#39;s putting Linux specifics into DT.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; You could flip this around and have the module make a call in=
to the<br>
&gt; &gt;&gt; kernel to determine whether to initialize or not. Then platfo=
rms could<br>
&gt; &gt;&gt; set a flag to indicate this.<br>
&gt; &gt; Could you make it more clear? kernel global variable, macro, or f=
unction?<br>
&gt;<br>
&gt; Any of those. Of course, direct access to variables across modules is<=
br>
&gt; discouraged, so it would probably be a function that checks a variable=
.<br>
why not use function pointer? arch that don&#39;t use this driver do not ha=
ve=C2=A0 to set it. if use function, everyone should define it.<br>
&gt;<br>
&gt; &gt; - Following your idea, I think, we can add in driver/cpufreq/cpuf=
req.c:<br>
&gt; &gt; int (*clk_reg_cpufreq_get_op_table) (struct op_table *tbl, int *s=
ize);<br>
&gt; &gt; SoC code set the callback. If it&#39;s NULL, driver will exit. We=
 can get rid<br>
&gt; &gt; of DT. It&#39;ll make cpufreq core dirty, but it&#39;s the only f=
ile built-in.<br>
&gt;<br>
&gt; But aren&#39;t you getting the operating points from the DT? Then you =
don&#39;t<br>
&gt; want to put this code into each platform.<br>
the variable is mainly used to check whether some platform want=C2=A0 to us=
e this driver. getting ride of dt is side affect.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; - Drop module support. SoC call generic_clk_cpufreq_init as Jamie=
 said.<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; It&#39;ll prevent the driver from being a kernel modu=
le.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Hmm, that&#39;s not very nice either! =C2=A0I guess you _=
could_ add an<br>
&gt; &gt;&gt;&gt; of_machine_is_compatible() check against a list of compat=
ible machines<br>
&gt; &gt;&gt;&gt; in the driver but that feels a little gross. =C2=A0Hopefu=
lly Rob or Grant<br>
&gt; &gt;&gt;&gt; have a good alternative!<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; What does cpufreq core do if multiple drivers are registered?=
<br>
&gt; &gt; current cpufreq core only support one cpufreq_driver. Others will=
 fail<br>
&gt; &gt; except the first time.<br>
&gt;<br>
&gt; Then whoever gets there first wins. Make your driver register late and=
<br>
&gt; if someone doesn&#39;t want to use it they can register a custom drive=
r earlier.<br>
this driver did<br>
&gt;<br>
&gt; Rob<br>
&gt;<br>
&gt; &gt;&gt; Perhaps a<br>
&gt; &gt;&gt; ranking is needed and this would only get enabled if there ar=
e no other<br>
&gt; &gt;&gt; drivers and other conditions like having the clock &quot;cpu&=
quot; present are met.<br>
&gt; &gt; We&#39;d better keep cpufreq core simple. For this driver, regist=
er cpufreq_driver<br>
&gt; &gt; is the last thing after checking all conditions.<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Rob<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Hi Grant &amp; Rob,<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Could you comment?<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; +- cpu-freqs : cpu frequency points it suppor=
t<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; +- cpu-volts : cpu voltages required by the f=
requency point at the same index<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; +- trans-latency : =C2=A0transition_latency<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; diff --git a/drivers/cpufreq/Kconfig b/driver=
s/cpufreq/Kconfig<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; index e24a2a1..216eecd 100644<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; --- a/drivers/cpufreq/Kconfig<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; +++ b/drivers/cpufreq/Kconfig<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; @@ -179,6 +179,14 @@ config CPU_FREQ_GOV_CONS=
ERVATIVE<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If i=
n doubt, say N.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; +config GENERIC_CPUFREQ_DRIVER<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Gener=
ic cpufreq driver using clock/regulator/devicetree&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This adds=
 generic CPUFreq driver. It assumes all<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cores of =
the CPU share the same clock and voltage.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If in dou=
bt, say N.<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; I think this needs dependencies on HAVE_CLK, OF a=
nd REGULATOR.<br>
&gt; &gt;&gt;&gt;&gt; right, Thanks. I can not check clk before generic clo=
ck framework<br>
&gt; &gt;&gt;&gt;&gt; come in.<br>
&gt; &gt;&gt;&gt;&gt; Added:<br>
&gt; &gt;&gt;&gt;&gt; =C2=A0 =C2=A0depends on OF &amp;&amp; REGULATOR<br>
&gt; &gt;&gt;&gt;&gt; =C2=A0 =C2=A0select CPU_FREQ_TABLE<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; You can still use HAVE_CLK. =C2=A0That symbol has been ar=
ound for ages and<br>
&gt; &gt;&gt;&gt; any platform implementing the clk API should select it so=
 it&#39;s fine to<br>
&gt; &gt;&gt;&gt; depend on it even before there is a generic struct clk.<b=
r>
&gt; &gt; You are right. Thanks.<br>
&gt; &gt;<br>
&gt; &gt; Richard<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Jamie<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; _______________________________________________<br>
&gt; &gt;&gt; linux-arm-kernel mailing list<br>
&gt; &gt;&gt; <a href=3D"mailto:linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org">linux=
-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org</a><br>
&gt; &gt;&gt; <a href=3D"http://lists.infradead.org/mailman/listinfo/linux-=
arm-kernel">http://lists.infradead.org/mailman/listinfo/linux-arm-kernel</a=
><br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt;<br>
</p>

--f46d043be19a808abf04b48d69cd--


--===============8375384777065874707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linaro-dev mailing list
linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
http://lists.linaro.org/mailman/listinfo/linaro-dev

--===============8375384777065874707==--
