From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/4] remoteproc: dt: Provide bindings for ST's Remote
 Processor Controller driver
Date: Tue, 1 Sep 2015 11:41:45 +0100
Message-ID: <20150901104145.GS4796@x1>
References: <1440757911-9120-1-git-send-email-lee.jones@linaro.org>
 <1440757911-9120-3-git-send-email-lee.jones@linaro.org>
 <CAL_JsqLuF2iAJhzjDh5CL-RgYk+H+N+D05wsWqUT01zvq9SOxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLuF2iAJhzjDh5CL-RgYk+H+N+D05wsWqUT01zvq9SOxA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, kernel@stlinux.com, Nathan Lynch <Nathan_Lynch@mentor.com>, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

On Mon, 31 Aug 2015, Rob Herring wrote:

> On Fri, Aug 28, 2015 at 5:31 AM, Lee Jones <lee.jones@linaro.org> wro=
te:
> > Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  .../devicetree/bindings/remoteproc/st-rproc.txt    | 35 ++++++++++=
++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/remoteproc/st=
-rproc.txt
> >
> > diff --git a/Documentation/devicetree/bindings/remoteproc/st-rproc.=
txt b/Documentation/devicetree/bindings/remoteproc/st-rproc.txt
> > new file mode 100644
> > index 0000000..fbd7d78
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/remoteproc/st-rproc.txt
> > @@ -0,0 +1,35 @@
> > +STMicroelectronics Remote Processor
>=20
> "remote processor" is what STM datasheets call them? This seems like
> Linux naming is leaking in here.

That's what this directory is called and the other binding within it.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
