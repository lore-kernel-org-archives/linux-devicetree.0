From: Mounir Bsaibes <mounir.bsaibes-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [issue] Appended device trees does not work for ST-E
Date: Fri, 7 Oct 2011 09:22:52 -0500
Message-ID: <CAPQUh1SrWzZiVs8weBr8nvAG3jcKEXzcMk3TdXaE2fazyMeY5w@mail.gmail.com>
References: <CAPQUh1TeeJTXVB7=PQZS2XBi-iW=EvkP5bZ95J-fxiE5B-nOgw@mail.gmail.com>
 <CACRpkdZ_nc5B7Sy9r58U1b9dPy5Ua0NxXRq7YYkZnJEk6df7bA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9110255934184040016=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdZ_nc5B7Sy9r58U1b9dPy5Ua0NxXRq7YYkZnJEk6df7bA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Deepak Saxena <deepak.saxena-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============9110255934184040016==
Content-Type: multipart/alternative; boundary=0015174027a63195a604aeb62d01

--0015174027a63195a604aeb62d01
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 7, 2011 at 2:02 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>wrote:

> On Thu, Oct 6, 2011 at 6:35 PM, Mounir Bsaibes
> <mounir.bsaibes-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
> > issue:
> > "Appended device trees does not work for us. Still don't know why."
>
> I have fixed it now, sorry for all the fuzz, appended device
> trees *are* working for us, as of friday last week.
>
> Excellent - thank you.


> Short story: we're so stupid. (As usual.)
>
> Long story, I *think* core problem was this:
>
> In kernel 3.0 you could enable CONFIG_USE_OF
> and PROC_DEVICETREE to get a dummy device tree in
> /proc/device-tree, so you could enable it just to get the code
> compiled in.
>
> As of 3.1 rc:s if you enable CONFIG_USE_OF, the core
> DT code will start looking for a compatible node, so you
> need a .dt_compat entry in your MACHINE_START
> structure, and it has to reference a matching compat node
> in the device tree. Else it will print an error an hang.
>
> Which is fully logical, if you enable device tree, you should
> use it.
>
> The problem was further complicated that the warning
> about the missing compat node only appears in
> early_printk() context since the console is not up at this
> point, if you don't have that, the machine will hang without
> any prints and you need to figure out what happens.
>
> We enabled early printk:s but since early_printk() is
> problematic with multi-machine configurations we didn't
> see them.
>
> So we were basically hit by the ambigous prossibility to
> configure in earlyprints on machines with the UART in
> different places, which has been discussed by Will Deacon
> et al elsewhere.
>
> Maybe we should document in Kconfig:s
> CONFIG_USE_OF option that if you enable this
> for ARM your machine it won't boot unless it finds a
> compatible device tree, I don't know.
>

copying John Ztultz to handle as he see fit. John is working on kconfig,
maybe he would slip this suggestion in.


>
> Yours,
> Linus Walleij
>



-- 
Mounir Bsaibes
Project Manager

Follow Linaro.org:
facebook.com/pages/Linaro/155974581091106
http://twitter.com/#!/linaroorg
http://www.linaro.org/linaro-blog <http://www.linaro.org/linaro-blog>

--0015174027a63195a604aeb62d01
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Fri, Oct 7, 2011 at 2:02 AM, Linus Wa=
lleij <span dir=3D"ltr">&lt;<a href=3D"mailto:linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">lin=
us.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x;">
<div class=3D"im">On Thu, Oct 6, 2011 at 6:35 PM, Mounir Bsaibes<br>
&lt;<a href=3D"mailto:mounir.bsaibes-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">mounir.bsaibes-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org<=
/a>&gt; wrote:<br>
<br>
&gt; issue:<br>
&gt; &quot;Appended device trees does not work for us. Still don&#39;t know=
 why.&quot;<br>
<br>
</div>I have fixed it now, sorry for all the fuzz, appended device<br>
trees *are* working for us, as of friday last week.<br>
<br></blockquote><div>Excellent - thank you.<br>=A0<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px so=
lid rgb(204, 204, 204); padding-left: 1ex;">
Short story: we&#39;re so stupid. (As usual.)<br>
<br>
Long story, I *think* core problem was this:<br>
<br>
In kernel 3.0 you could enable CONFIG_USE_OF<br>
and PROC_DEVICETREE to get a dummy device tree in<br>
/proc/device-tree, so you could enable it just to get the code<br>
compiled in.<br>
<br>
As of 3.1 rc:s if you enable CONFIG_USE_OF, the core<br>
DT code will start looking for a compatible node, so you<br>
need a .dt_compat entry in your MACHINE_START<br>
structure, and it has to reference a matching compat node<br>
in the device tree. Else it will print an error an hang.<br>
<br>
Which is fully logical, if you enable device tree, you should<br>
use it.<br>
<br>
The problem was further complicated that the warning<br>
about the missing compat node only appears in<br>
early_printk() context since the console is not up at this<br>
point, if you don&#39;t have that, the machine will hang without<br>
any prints and you need to figure out what happens.<br>
<br>
We enabled early printk:s but since early_printk() is<br>
problematic with multi-machine configurations we didn&#39;t<br>
see them.<br>
<br>
So we were basically hit by the ambigous prossibility to<br>
configure in earlyprints on machines with the UART in<br>
different places, which has been discussed by Will Deacon<br>
et al elsewhere.<br>
<br>
Maybe we should document in Kconfig:s<br>
CONFIG_USE_OF option that if you enable this<br>
for ARM your machine it won&#39;t boot unless it finds a<br>
compatible device tree, I don&#39;t know.<br></blockquote><div>=A0</div><di=
v>copying John Ztultz to handle as he see fit. John is working on kconfig, =
maybe he would slip this suggestion in.<br>=A0<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid=
 rgb(204, 204, 204); padding-left: 1ex;">

<br>
Yours,<br>
<font color=3D"#888888">Linus Walleij<br>
</font></blockquote></div><br><br clear=3D"all"><br>-- <br><div>
Mounir Bsaibes<br>Project Manager<br><br></div>
Follow Linaro.org: <br>
<a href=3D"http://facebook.com/pages/Linaro/155974581091106" target=3D"_bla=
nk">facebook.com/pages/Linaro/155974581091106</a><br>
<a href=3D"http://twitter.com/#%21/linaroorg" target=3D"_blank">http://twit=
ter.com/#!/linaroorg</a> <br>
<a href=3D"http://www.linaro.org/linaro-blog" target=3D"_blank">http://www.=
linaro.org/linaro-blog</a><a href=3D"http://www.linaro.org/linaro-blog" tar=
get=3D"_blank"></a><br>

--0015174027a63195a604aeb62d01--

--===============9110255934184040016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============9110255934184040016==--
