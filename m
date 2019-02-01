Return-Path: <SRS0=YqHV=QI=gmail.com=cwchoi00@kernel.org>
MIME-Version: 1.0
References: <20190122090232.29194-1-k.konieczny@partner.samsung.com>
 <CGME20190122090251eucas1p122f1c6d47f3cb60febeadda88ada3a76@eucas1p1.samsung.com>
 <20190122090232.29194-5-k.konieczny@partner.samsung.com> <fd39fd40-f452-f763-c9ab-d717c80967cd@samsung.com>
 <ad3926f7-8884-9f2b-85d7-8a50a028d075@samsung.com>
In-Reply-To: <ad3926f7-8884-9f2b-85d7-8a50a028d075@samsung.com>
Reply-To: cwchoi00@gmail.com
From: Chanwoo Choi <cwchoi00@gmail.com>
Date: Fri, 1 Feb 2019 20:12:26 +0900
Message-ID: <CAGTfZH3kwutFi4tVFrH2dOrL7Lr8nVb1O49YYfoNt+A1HV4fww@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] dt-bindings: clk: exynos5433: add imem clock
Content-Type: multipart/alternative; boundary="0000000000007860210580d33883"
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kamil Konieczny <k.konieczny@partner.samsung.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <devicetree@vger.kernel.org>

--0000000000007860210580d33883
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2019=EB=85=84 2=EC=9B=94 1=EC=9D=BC (=EA=B8=88) 19:59=EC=97=90 Sylwester Na=
wrocki <s.nawrocki@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

> On 1/31/19 13:30, Chanwoo Choi wrote:
> >> diff --git a/include/dt-bindings/clock/exynos5433.h
> b/include/dt-bindings/clock/exynos5433.h
> >> index 87bb2b017143..52652aaabc06 100644
> >> --- a/include/dt-bindings/clock/exynos5433.h
> >> +++ b/include/dt-bindings/clock/exynos5433.h
> >> @@ -1406,4 +1406,10 @@
> >>
> >>  #define CAM1_NR_CLK                                 113
> >>
> >> +/* CMU_IMEM */
> >> +#define CLK_ACLK_SLIMSSS            2
> >> +#define CLK_PCLK_SLIMSSS            35
> >> +
> >> +#define IMEM_NR_CLK                 52
> >> +
> >>  #endif /* _DT_BINDINGS_CLOCK_EXYNOS5433_H */
> >>
> > If you define that IMEM_NR_CLK is 52, clock driver allocates
> > the memory for 52 clocks. It cause the memory waste.
> > IMO, you better to change it as following:
> >
> > #define CLK_ACLK_SLIMSSS              1
> > #define CLK_PCLK_SLIMSSS              2
> >
> > #define IMEM_NR_CLK                   3
>
> Let's keep the clock ID enumeration as is, so sorting is per clock
> type as for all other CMUs in this header file. I.e. first all ACLK
> then all PCLK clocks in case remaining clock ID get added in future.
> I'm going to adjust IMEM_NR_CLK to 36, as is not a part of DT ABI
> definition and for now it will allow us to save some memory. Although
> I think the memory saving is negligible, we have already similar gaps
> in the clock ID enumeration.
>
> I'm going to apply the patch with IMEM_NR_CLK changed 36, assuming
> that Rob's Reviewed-by still stands, if not please let me know.
>
> --
> Thanks,
> Sylwester
>

OK.

Acked-by:  Chanwoo Choi <cw00.choi@samsung.com>

Regards,
Chanwoo Choi

>

--0000000000007860210580d33883
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
2019=EB=85=84 2=EC=9B=94 1=EC=9D=BC (=EA=B8=88) 19:59=EC=97=90 Sylwester Na=
wrocki &lt;<a href=3D"mailto:s.nawrocki@samsung.com">s.nawrocki@samsung.com=
</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On 1/31/19 13:30, Chanwoo Choi wrote:<br>
&gt;&gt; diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-b=
indings/clock/exynos5433.h<br>
&gt;&gt; index 87bb2b017143..52652aaabc06 100644<br>
&gt;&gt; --- a/include/dt-bindings/clock/exynos5433.h<br>
&gt;&gt; +++ b/include/dt-bindings/clock/exynos5433.h<br>
&gt;&gt; @@ -1406,4 +1406,10 @@<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 #define CAM1_NR_CLK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0113<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; +/* CMU_IMEM */<br>
&gt;&gt; +#define CLK_ACLK_SLIMSSS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 2<br>
&gt;&gt; +#define CLK_PCLK_SLIMSSS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 35<br>
&gt;&gt; +<br>
&gt;&gt; +#define IMEM_NR_CLK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A052<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 #endif /* _DT_BINDINGS_CLOCK_EXYNOS5433_H */<br>
&gt;&gt;<br>
&gt; If you define that IMEM_NR_CLK is 52, clock driver allocates<br>
&gt; the memory for 52 clocks. It cause the memory waste.<br>
&gt; IMO, you better to change it as following:<br>
&gt; <br>
&gt; #define CLK_ACLK_SLIMSSS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 1<br>
&gt; #define CLK_PCLK_SLIMSSS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 2<br>
&gt; <br>
&gt; #define IMEM_NR_CLK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A03<br>
<br>
Let&#39;s keep the clock ID enumeration as is, so sorting is per clock<br>
type as for all other CMUs in this header file. I.e. first all ACLK<br>
then all PCLK clocks in case remaining clock ID get added in future. <br>
I&#39;m going to adjust IMEM_NR_CLK to 36, as is not a part of DT ABI <br>
definition and for now it will allow us to save some memory. Although<br>
I think the memory saving is negligible, we have already similar gaps <br>
in the clock ID enumeration.<br>
<br>
I&#39;m going to apply the patch with IMEM_NR_CLK changed 36, assuming<br>
that Rob&#39;s Reviewed-by still stands, if not please let me know.<br><br>
-- <br>
Thanks,<br>
Sylwester<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">OK.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Acke=
d-by:=C2=A0 Chanwoo Choi &lt;<a href=3D"mailto:cw00.choi@samsung.com">cw00.=
choi@samsung.com</a>&gt;</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Regards,</div><div dir=3D"auto">Chanwoo Choi</div><div dir=3D"auto"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000007860210580d33883--
