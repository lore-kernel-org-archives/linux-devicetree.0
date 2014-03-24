Return-Path: <boxerspam1@gmail.com>
Date: Mon, 24 Mar 2014 17:07:31 -0500
From: Eric Boxer <boxerspam1@gmail.com>
Message-ID: <AE4C451B-2C9E-4C8C-886B-B557FFA13A6D@gmail.com>
In-Reply-To: <20140324215729.32624.19272@quantum>
References: <1393870533-20845-1-git-send-email-s.nawrocki@samsung.com>
 <53187C13.3040202@st.com> <532AE239.9000800@samsung.com>
 <20140321014551.21989.57253@quantum> <532C4816.2080102@st.com>
 <20140324215729.32624.19272@quantum>
Subject: Re: [RFC PATCH v2 0/2] clk: Support for DT assigned clock
 parents and rates
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="5330aca3_2ae8944a_230"
To: Mike Turquette <mturquette@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, sw0312.kim@samsung.com, kyungmin.park@samsung.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, mark.rutland@arm.com, m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, linux@arm.linux.org.uk, Maxime Coquelin <maxime.coquelin@st.com>, t-kristo@ti.com, grant.likely@linaro.org, t.figa@samsung.com, galak@codeaurora.org, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

--5330aca3_2ae8944a_230
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've added this to my to-do list. On March 24, 2014 at 4:57:29 PM CDT, Mi=
ke Turquette <mturquette=40linaro.org> wrote:Quoting Maxime Coquelin (201=
4-03-21 07:09:26)> Hi Mike,> > On 03/21/2014 02:45 AM, Mike Turquette wro=
te:> > Quoting Sylwester Nawrocki (2014-03-20 05:42:33)> >> Hi Maxime,> >=
>> >> On 06/03/14 14:45, Maxime Coquelin wrote:> >>> Hi Sylwester,> >>>> =
>>> I like the principle of your implementation, but I have two questions=
:> >>> 1 - How can we manage PM with this solution, as the parent/rate wi=
ll be> >>> set only once at probe time=3F> >>> 2 - How to set the parent =
of a parent clock (which can be shared with> >>> other devices)=3F Same q=
uestion about the parent rates.> >>> >> Thanks for your feedback and apol=
ogies for late reply.> >>> >> IIUC your first concern is about a situatio=
n when clocks need to be> >> reconfigured upon each resume from system sl=
eep or runtime PM resume =3F> >> As I mentioned in v1 of the R=46C I was =
considering having individual> >> drivers calling explicitly the clocks s=
et up routine. Presumably this> >> would allow to resolve the power manag=
ement related issue.> >> One example I'm aware the approach as in this R=46=
C wouldn't work is> >> when a device in a SoC belongs to a power domain, =
which needs to be> >> first switched on before we can start setting up an=
d the clocks'> >> configuration get lost after the power domain switch of=
f.> >> > I like Sylwester's approach of handling this one-time setup in t=
he> > driver core.> >> > Any kind of fine grained power management should=
 not be hidden by DT,> > and by definition that logic belongs in the devi=
ce driver. It can still> > be nicely abstracted away by runtime pm=5B1=5D=
.> >> > Regards,> > Mike> >> > =5B1=5D Message-ID: > How can I access thi=
s reference=3FI was trying to provide a reference to this thread which is=
 tangentiallyrelated to this topic:http://www.spinics.net/lists/arm-kerne=
l/msg317016.htmlBut it hadn't hit any of the mail archives at the time of=
 my writing soI just copied Russell's Message-ID from his email. If you h=
ave a copy ofthat email then you can search on Message-ID's for that and =
you willfind it. :-)Regards,Mike> > Thanks,> Maxime> > >> >>> >> OTOH I s=
uspect devices for which one-time clocks setup is sufficient> >> will be =
quite common. And for these there would need to be a single> >> call to t=
he setup routine in probe() I guess, since it wouldn't be> >> possible to=
 figure out just from the DT data when the actual call> >> should be made=
.> >>> >> =46or a global clocks configuration, I thought about specifying=
 that> >> in the clocks controller node, and then to have the setup routi=
ne> >> called e.g. from of=5Fclk=5Finit(). I think that could work well e=
nough,> >> together with the patch =5B1=5D, adding clock dependencies han=
dling.> >> But then the clock frequency set up function would need to be>=
 >> modified to respect the clock parent relationships, similarly as> >> =
in patch series =5B2=5D. A just noticed =5B2=5D recently, after posting> =
>> this R=46C (adding Tero at Cc).> >>> >> --> >> Regards,> >> Sylwester>=
 >>> >> =5B1=5D http://www.spinics.net/lists/arm-kernel/msg310507.html> >=
> =5B2=5D http://www.spinics.net/lists/linux-omap/msg103069.html--To unsu=
bscribe from this list: send the line =22unsubscribe linux-kernel=22 inth=
e body of a message to majordomo=40vger.kernel.orgMore majordomo info at =
http://vger.kernel.org/majordomo-info.htmlPlease read the =46AQ at http:/=
/www.tux.org/lkml/     
--5330aca3_2ae8944a_230
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><body><div>I've added this to my to-do list.</div><br/><br/><div><d=
iv class=3D=22quote=22>On March 24, 2014 at 4:57:29 PM CDT, Mike Turquett=
e &lt;mturquette=40linaro.org&gt; wrote:<br/><blockquote type=3D=22cite=22=
 style=3D=22border-left-style:solid;border-width:1px;margin-left:0px;padd=
ing-left:10px;=22>Quoting Maxime Coquelin (2014-03-21 07:09:26)<br />> Hi=
 Mike,<br />> <br />> On 03/21/2014 02:45 AM, Mike Turquette wrote:<br />=
> > Quoting Sylwester Nawrocki (2014-03-20 05:42:33)<br />> >> Hi Maxime,=
<br />> >><br />> >> On 06/03/14 14:45, Maxime Coquelin wrote:<br />> >>>=
 Hi Sylwester,<br />> >>><br />> >>>        I like the principle of your =
implementation, but I have two questions:<br />> >>>        1 - How can w=
e manage PM with this solution, as the parent/rate will be<br />> >>> set=
 only once at probe time=3F<br />> >>>        2 - How to set the parent o=
f a parent clock (which can be shared with<br />> >>> other devices)=3F S=
ame question about the parent rates.<br />> >><br />> >> Thanks for your =
feedback and apologies for late reply.<br />> >><br />> >> IIUC your firs=
t concern is about a situation when clocks need to be<br />> >> reconfigu=
red upon each resume from system sleep or runtime PM resume =3F<br />> >>=
 As I mentioned in v1 of the R=46C I was considering having individual<br=
 />> >> drivers calling explicitly the clocks set up routine. Presumably =
this<br />> >> would allow to resolve the power management related issue.=
<br />> >> One example I'm aware the approach as in this R=46C wouldn't w=
ork is<br />> >> when a device in a SoC belongs to a power domain, which =
needs to be<br />> >> first switched on before we can start setting up an=
d the clocks'<br />> >> configuration get lost after the power domain swi=
tch off.<br />> ><br />> > I like Sylwester's approach of handling this o=
ne-time setup in the<br />> > driver core.<br />> ><br />> > Any kind of =
fine grained power management should not be hidden by DT,<br />> > and by=
 definition that logic belongs in the device driver. It can still<br />> =
> be nicely abstracted away by runtime pm=5B1=5D.<br />> ><br />> > Regar=
ds,<br />> > Mike<br />> ><br />> > =5B1=5D Message-ID: <20140320114238.G=
Q7528=40n2100.arm.linux.org.uk><br />> How can I access this reference=3F=
<br /><br />I was trying to provide a reference to this thread which is t=
angentially<br />related to this topic:<br /><br />http://www.spinics.net=
/lists/arm-kernel/msg317016.html<br /><br />But it hadn't hit any of the =
mail archives at the time of my writing so<br />I just copied Russell's M=
essage-ID from his email. If you have a copy of<br />that email then you =
can search on Message-ID's for that and you will<br />find it. :-)<br /><=
br />Regards,<br />Mike<br /><br />> <br />> Thanks,<br />> Maxime<br />>=
 <br />> ><br />> >><br />> >> OTOH I suspect devices for which one-time =
clocks setup is sufficient<br />> >> will be quite common. And for these =
there would need to be a single<br />> >> call to the setup routine in pr=
obe() I guess, since it wouldn't be<br />> >> possible to figure out just=
 from the DT data when the actual call<br />> >> should be made.<br />> >=
><br />> >> =46or a global clocks configuration, I thought about specifyi=
ng that<br />> >> in the clocks controller node, and then to have the set=
up routine<br />> >> called e.g. from of=5Fclk=5Finit(). I think that cou=
ld work well enough,<br />> >> together with the patch =5B1=5D, adding cl=
ock dependencies handling.<br />> >> But then the clock frequency set up =
function would need to be<br />> >> modified to respect the clock parent =
relationships, similarly as<br />> >> in patch series =5B2=5D. A just not=
iced =5B2=5D recently, after posting<br />> >> this R=46C (adding Tero at=
 Cc).<br />> >><br />> >> --<br />> >> Regards,<br />> >> Sylwester<br />=
> >><br />> >> =5B1=5D http://www.spinics.net/lists/arm-kernel/msg310507.=
html<br />> >> =5B2=5D http://www.spinics.net/lists/linux-omap/msg103069.=
html<br />--<br />To unsubscribe from this list: send the line =22unsubsc=
ribe linux-kernel=22 in<br />the body of a message to majordomo=40vger.ke=
rnel.org<br />More majordomo info at  http://vger.kernel.org/majordomo-in=
fo.html<br />Please read the =46AQ at  http://www.tux.org/lkml/<br /></bl=
ockquote></div></div></body></html>
--5330aca3_2ae8944a_230--
