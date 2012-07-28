From: jagan <402jagan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [DTC] Compilation issue on Red-hat host systems
Date: Sat, 28 Jul 2012 15:03:50 +0530
Message-ID: <CALdT2jw_m=uR8T=uE8BiptLG40_6K=5FsRWs4maR0u=4vUEyCA@mail.gmail.com>
References: <CALdT2jzsyC9TuXRgZxRP-zJjyfihUN_u2uXF=bSER3ARpPot3Q@mail.gmail.com>
 <20120719032633.GC8100@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2691402393067714920=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120719032633.GC8100-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============2691402393067714920==
Content-Type: multipart/alternative; boundary=047d7b622096b72be904c5e086f6

--047d7b622096b72be904c5e086f6
Content-Type: text/plain; charset=ISO-8859-1

My flex version on system is flex version 2.5.4
I tried by  -Wstrict-prototypes  form Makefile, But still I got the same
error.

Do I need to upgrade my flex.

Regards,
Jagan.

On Thu, Jul 19, 2012 at 8:56 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>wrote:

> On Mon, Jul 16, 2012 at 03:29:49PM +0530, jagan wrote:
> > Hi,
> >
> > I am building dtc as follows
> >         $ git clone git://jdl.com/software/dtc.git
> >         $ cd dtc
> >         $ make
> > I got the below error while doing make
> > convert-dtsv0-lexer.lex.c:684: warning: no previous prototype for 'yylex'
> > make: *** [convert-dtsv0-lexer.lex.o] Error 1
> >
> > Can anyone help me, I am I missing any PATH setup
>
> It's almost certainly an issue with the particular version of flex
> generating code which triggers warnings we have enabled.  What does
> "flex --version" say.  As a workaround you can remove
> -Wstrict-prototypes from 'WARNINGS' in the Makefile.
>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_
> _other_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson
>

--047d7b622096b72be904c5e086f6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

My flex version on system is=A0flex version 2.5.4<div>I tried by=A0
-Wstrict-prototypes=A0 form Makefile, But still I got the same error.</div>=
<div><br></div><div>Do I need to upgrade my flex.</div><div><br></div><div>=
Regards,</div><div>Jagan.<br><br><div class=3D"gmail_quote">On Thu, Jul 19,=
 2012 at 8:56 AM, David Gibson <span dir=3D"ltr">&lt;<a href=3D"mailto:davi=
d@gibson.dropbear.id.au" target=3D"_blank">david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org</a>&=
gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On M=
on, Jul 16, 2012 at 03:29:49PM +0530, jagan wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; I am building dtc as follows<br>
&gt; =A0 =A0 =A0 =A0 $ git clone git://<a href=3D"http://jdl.com/software/d=
tc.git" target=3D"_blank">jdl.com/software/dtc.git</a><br>
&gt; =A0 =A0 =A0 =A0 $ cd dtc<br>
&gt; =A0 =A0 =A0 =A0 $ make<br>
&gt; I got the below error while doing make<br>
&gt; convert-dtsv0-lexer.lex.c:684: warning: no previous prototype for &#39=
;yylex&#39;<br>
&gt; make: *** [convert-dtsv0-lexer.lex.o] Error 1<br>
&gt;<br>
&gt; Can anyone help me, I am I missing any PATH setup<br>
<br>
</div></div>It&#39;s almost certainly an issue with the particular version =
of flex<br>
generating code which triggers warnings we have enabled. =A0What does<br>
&quot;flex --version&quot; say. =A0As a workaround you can remove<br>
-Wstrict-prototypes from &#39;WARNINGS&#39; in the Makefile.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
David Gibson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| I&#39;ll have my musi=
c baroque, and my code<br>
david AT <a href=3D"http://gibson.dropbear.id.au" target=3D"_blank">gibson.=
dropbear.id.au</a> =A0| minimalist, thank you. =A0NOT _the_ _other_<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | _way_ _ar=
ound_!<br>
<a href=3D"http://www.ozlabs.org/~dgibson" target=3D"_blank">http://www.ozl=
abs.org/~dgibson</a><br>
</font></span></blockquote></div><br></div>

--047d7b622096b72be904c5e086f6--

--===============2691402393067714920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2691402393067714920==--
