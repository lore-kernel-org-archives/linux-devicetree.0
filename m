Return-Path: <peter.griffin@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1444118413.3579.46.camel@intel.com>
References: <1441980871-24475-1-git-send-email-peter.griffin@linaro.org>
	<1441980871-24475-4-git-send-email-peter.griffin@linaro.org>
	<1444118413.3579.46.camel@intel.com>
Date: Tue, 13 Oct 2015 11:41:39 +0100
Message-ID: <CADrjBPoCJGRpErG4wOi2mzcPsQYs+0hi+D-9Q5b-4m5BiXGKVg@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] dmaengine: st_fdma: Add STMicroelectronics FDMA
 driver header file
From: Peter Griffin <peter.griffin@linaro.org>
Content-Type: multipart/alternative; boundary=047d7b33d318471c9d0521fa17b7
To: "Koul, Vinod" <vinod.koul@intel.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "patrice.chotard@st.com" <patrice.chotard@st.com>, "maxime.coquelin@st.com" <maxime.coquelin@st.com>, "srinivas.kandagatla@gmail.com" <srinivas.kandagatla@gmail.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "ludovic.barre@st.com" <ludovic.barre@st.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--047d7b33d318471c9d0521fa17b7
Content-Type: text/plain; charset=UTF-8

Hi,

On 8 October 2015 at 16:43, Koul, Vinod <vinod.koul@intel.com> wrote:

> On Fri, 2015-09-11 at 15:14 +0100, Peter Griffin wrote:
>
> > +#define FDMA_ID_OFST         0x00000
> > +#define FDMA_VER_OFST                0x00004
> > > +
> > +#define FDMA_EN_OFST         0x00008
>
> Why cant these be BIT() to maintain consistency?
>

These are actually register offsets. I'm only using the BIT
macro for bitfields within the registers e.g. FDMA_EN_RUN

regards,

Peter.

--047d7b33d318471c9d0521fa17b7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">On 8 October 2015 at 16:43, Koul, Vinod <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:vinod.koul@intel.com" target=3D"_blank">vinod.koul@intel.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><s=
pan class=3D"">On Fri, 2015-09-11 at 15:14 +0100, Peter Griffin wrote:<br>
<br>
&gt; +#define FDMA_ID_OFST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00000<br>
&gt; +#define FDMA_VER_OFST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x00004<br>
&gt; &gt; +<br>
&gt; +#define FDMA_EN_OFST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00008<br>
<br>
</span>Why cant these be BIT() to maintain consistency?<br></blockquote><di=
v><br></div><div>These are actually register offsets. I&#39;m only using th=
e BIT<br></div><div>macro for bitfields within the registers e.g. FDMA_EN_R=
UN<br><br></div><div>regards,<br><br></div><div>Peter.<br></div></div></div=
></div>

--047d7b33d318471c9d0521fa17b7--
