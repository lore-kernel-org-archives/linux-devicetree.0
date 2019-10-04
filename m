From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] .gitattributes: Use 'dts' diff driver for dts files
Date: Fri, 04 Oct 2019 16:50:35 -0700
Message-ID: <5d97dacc.1c69fb81.b5612.3794@mx.google.com>
References: <20191004212311.141538-1-swboyd@chromium.org> <256a1ad3-6a0c-b4bd-e12c-9ab35db2939a@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <256a1ad3-6a0c-b4bd-e12c-9ab35db2939a@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Randy Dunlap (2019-10-04 15:08:08)
> On 10/4/19 2:23 PM, Stephen Boyd wrote:
> >=20
> > diff --git a/.gitattributes b/.gitattributes
> > index 89c411b5ce6b..4b32eaa9571e 100644
> > --- a/.gitattributes
> > +++ b/.gitattributes
> > @@ -1,2 +1,4 @@
> >  *.c   diff=3Dcpp
> >  *.h   diff=3Dcpp
> > +*.dtsi diff=3Ddts
> > +*.dts  diff=3Ddts
> >=20
>=20
> Hm, I have a "cpp" installed but not a "dts".
> Where would I find this "dts" so that I can install it?
>=20

It's not released yet but it is staged to be in the next release[1]. You
can probably build git from source and try it out if you're interested.

[1] https://git.kernel.org/pub/scm/git/git.git/commit/?id=3Dd49c2c3466d2c8c=
b0b3d0a43e6b406b07078fdb1
