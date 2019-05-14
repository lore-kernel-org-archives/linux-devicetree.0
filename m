From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/2] of/fdt: Remove dead code and mark functions with __init
Date: Tue, 14 May 2019 13:21:51 -0700
Message-ID: <155786531142.14659.11567557677090725305@swboyd.mtv.corp.google.com>
References: <20190509215538.93346-1-swboyd@chromium.org> <CAL_JsqKS5KgNpVvunhax+M4+NceP9uy_V=2cYk54kg5eOfxXwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKS5KgNpVvunhax+M4+NceP9uy_V=2cYk54kg5eOfxXwA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>
List-Id: devicetree@vger.kernel.org

Quoting Rob Herring (2019-05-14 10:06:48)
> On Thu, May 9, 2019 at 4:55 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > diff --git a/Documentation/devicetree/bindings/common-properties.txt b/=
Documentation/devicetree/bindings/common-properties.txt
> > index a3448bfa1c82..1c50d8700ab5 100644
> > --- a/Documentation/devicetree/bindings/common-properties.txt
> > +++ b/Documentation/devicetree/bindings/common-properties.txt
> > @@ -25,8 +25,8 @@ Optional properties:
> >  If a binding supports these properties, then the binding should also
> >  specify the default behavior if none of these properties are present.
> >  In such cases, little-endian is the preferred default, but it is not
> > -a requirement.  The of_device_is_big_endian() and of_fdt_is_big_endian=
()
> > -helper functions do assume that little-endian is the default, because
> > +a requirement.  The of_device_is_big_endian()
>=20
> Hum, we shouldn't have kernel functions in binding docs. Can you
> reword to remove both functions.
>=20

Ok. I'll resend with this sentence cleaned up more.
