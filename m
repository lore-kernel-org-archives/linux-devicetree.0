From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Subject: Re: [PATCH 2/2] powerpc: Update of_remove_property() call sites to
 remove null checking
Date: Fri, 6 May 2016 11:01:26 +1000
Message-ID: <572BECE6.1080303@gmail.com>
References: <1461821695-19204-1-git-send-email-sjitindarsingh@gmail.com>
 <1461821695-19204-2-git-send-email-sjitindarsingh@gmail.com>
 <57292702.5070507@linux.vnet.ibm.com>
 <1462431031.12473.3.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5987397910449098736=="
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1462431031.12473.3.camel@ellerman.id.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: grant.likely@linaro.org, paulus@samba.org, robh+dt@kernel.org, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--===============5987397910449098736==
Content-Type: multipart/alternative;
 boundary="------------050905060000030904040301"

This is a multi-part message in MIME format.
--------------050905060000030904040301
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 05/05/16 16:50, Michael Ellerman wrote:
> On Tue, 2016-05-03 at 15:32 -0700, Tyrel Datwyler wrote: >> On 04/27/20=
16 10:34 PM, Suraj Jitindar Singh wrote: >>> diff --git a/arch/powerpc/pl=
atforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c >>=
> index ceb18d3..a560a98 100644 >>> --- a/arch/powerpc/platforms/pseries/=
mobility.c >>> +++ b/arch/powerpc/platforms/pseries/mobility.c >>> @@ -19=
1,8 +191,8 @@ static int update_dt_node(__be32 phandle, s32 scope) >>>   =
               break; >>>  >>>              case 0x80000000: >>> -       =
         prop =3D of_find_property(dn, prop_name, NULL); >>> -           =
     of_remove_property(dn, prop); >>> +                of_remove_propert=
y(dn, of_find_property(dn, >>> +                            prop_name, NU=
LL)); >>>                  prop =3D NULL; >>>                  break; >>>=
 >> >> You haven't removed a NULL check here, as suggested by the changel=
og, >> but instead made a cosmetic change to the code that still leaves b=
ehind >> a now unnecessary "prop =3D NULL;" to bit rot. > > Yeah I think =
you're right. Though it's not
very clear how prop is used in that > function. > > Please one of you sen=
d me an incremental to remove the prop =3D NULL; > > cheers >

I didn't delete the prop =3D NULL; initially as I didn't fully understand=

how it was used in the rest of the function and the effect of deleting
it.


--------------050905060000030904040301
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dutf-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <br>
    <br>
    On 05/05/16 16:50, Michael Ellerman wrote:<br>
    <span style=3D"white-space: pre;">&gt; On Tue, 2016-05-03 at 15:32 -0=
700, Tyrel Datwyler wrote:
&gt;&gt; On 04/27/2016 10:34 PM, Suraj Jitindar Singh wrote:
&gt;&gt;&gt; diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arc=
h/powerpc/platforms/pseries/mobility.c
&gt;&gt;&gt; index ceb18d3..a560a98 100644
&gt;&gt;&gt; --- a/arch/powerpc/platforms/pseries/mobility.c
&gt;&gt;&gt; +++ b/arch/powerpc/platforms/pseries/mobility.c
&gt;&gt;&gt; @@ -191,8 +191,8 @@ static int update_dt_node(__be32 phandle=
, s32 scope)
&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0 break;
&gt;&gt;&gt;=C2=A0=20
&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 case 0x80000000:
&gt;&gt;&gt; -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 prop =3D of_find_property(dn, prop_name, NULL);
&gt;&gt;&gt; -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 of_remove_property(dn, prop);
&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 of_remove_property(dn, of_find_property(dn,
&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
prop_name, NULL));
&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0 prop =3D NULL;
&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0 break;
&gt;&gt;&gt;
&gt;&gt;
&gt;&gt; You haven't removed a NULL check here, as suggested by the chang=
elog,
&gt;&gt; but instead made a cosmetic change to the code that still leaves=
 behind
&gt;&gt; a now unnecessary "prop =3D NULL;" to bit rot.
&gt;
&gt; Yeah I think you're right. Though it's not very clear how prop is us=
ed in that
&gt; function.
&gt;
&gt; Please one of you send me an incremental to remove the prop =3D NULL=
;
&gt;
&gt; cheers
&gt;</span><br>
    <br>
    I didn't delete the prop =3D NULL; initially as I didn't fully
    understand<br>
    how it was used in the rest of the function and the effect of
    deleting<br>
    it.<br>
    <br>
  </body>
</html>

--------------050905060000030904040301--

--===============5987397910449098736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXhwcGMt
ZGV2IG1haWxpbmcgbGlzdApMaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwpodHRwczovL2xp
c3RzLm96bGFicy5vcmcvbGlzdGluZm8vbGludXhwcGMtZGV2

--===============5987397910449098736==--
