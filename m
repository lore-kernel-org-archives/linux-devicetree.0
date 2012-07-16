From: jagan <402jagan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [DTC] Compilation issue on Red-hat host systems
Date: Mon, 16 Jul 2012 15:29:49 +0530
Message-ID: <CALdT2jzsyC9TuXRgZxRP-zJjyfihUN_u2uXF=bSER3ARpPot3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2775912205335102705=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============2775912205335102705==
Content-Type: multipart/alternative; boundary=047d7b66f6198a56f704c4ef7dbc

--047d7b66f6198a56f704c4ef7dbc
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I am building dtc as follows
        $ git clone git://jdl.com/software/dtc.git
        $ cd dtc
        $ make
I got the below error while doing make
convert-dtsv0-lexer.lex.c:684: warning: no previous prototype for 'yylex'
make: *** [convert-dtsv0-lexer.lex.o] Error 1

Can anyone help me, I am I missing any PATH setup

Regards,
Jagan.

--047d7b66f6198a56f704c4ef7dbc
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>I am building dtc as follows=A0</div><div><div>=A0 =
=A0 =A0 =A0 $ git clone git://<a href=3D"http://jdl.com/software/dtc.git">j=
dl.com/software/dtc.git</a></div><div>=A0 =A0 =A0 =A0 $ cd dtc</div><div>=
=A0 =A0 =A0 =A0 $ make</div>
<div>I got the below error while doing make</div><div>convert-dtsv0-lexer.l=
ex.c:684: warning: no previous prototype for &#39;yylex&#39;</div><div>make=
: *** [convert-dtsv0-lexer.lex.o] Error 1</div><div>=A0</div></div><div>Can=
 anyone help me, I am I missing any PATH setup</div>
<div><br></div><div>Regards,</div><div>Jagan.</div><div><br></div>

--047d7b66f6198a56f704c4ef7dbc--

--===============2775912205335102705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2775912205335102705==--
