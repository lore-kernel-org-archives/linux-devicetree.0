From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V2 1/2] mfd: stmpe: Use devm_*() routines
Date: Fri, 23 Nov 2012 09:42:03 +0000
Message-ID: <20121123094203.GG17471@gmail.com>
References: <f1d508c64a01dfd492a1ab1fda28af4b7647d8ab.1353560936.git.viresh.kumar@linaro.org>
 <20121122102710.GD4328@gmail.com>
 <CAKohpo=gctcd5+bZ8xeJn-Cx3=+=+uxaCzEoZhFmp+XaJSpf9Q@mail.gmail.com>
 <20121123094044.GF17471@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121123094044.GF17471@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: sameo@linux.intel.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com
List-Id: devicetree@vger.kernel.org

On Fri, 23 Nov 2012, Lee Jones wrote:

> On Thu, 22 Nov 2012, Viresh Kumar wrote:
>=20
> > On 22 November 2012 15:57, Lee Jones <lee.jones@linaro.org> wrote:
> > > On Thu, 22 Nov 2012, Viresh Kumar wrote:
> > >
> > >> This patch frees stmpe driver from tension of freeing resources =
:)
> > >> devm_* derivatives of multiple routines are used while allocatin=
g resources,
> > >> which would be freed automatically by kernel.
> > >>
> > >> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> >=20
> > > Acked-by: Lee Jones <lee.jones@linaro.org>
> >=20
> > Hi Sameo,
> >=20
> > Please apply this patch only from this series. I will not resend it=
 in
> > V3 of my set.
>=20
> That's not how it works.
>=20
> Apply my Acked-by yourself and re-send the patch-set as a whole.

Sorry, you have another option. Break it away from the patch-set,
apply my Acked-by, then resubmit as a single patch.

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
