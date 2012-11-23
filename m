From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V2 2/2] mfd: stmpe: Extend DT support in stmpe driver
Date: Fri, 23 Nov 2012 09:36:33 +0000
Message-ID: <20121123093633.GD17471@gmail.com>
References: <f1d508c64a01dfd492a1ab1fda28af4b7647d8ab.1353560936.git.viresh.kumar@linaro.org>
 <b81641051dad9660b72b0028d001e5620d901160.1353560936.git.viresh.kumar@linaro.org>
 <20121122112451.GE4328@gmail.com>
 <CAKohpo=EWFNddjMNwHO4u4-bi1AQ4cvsJ4DfFOgaFv3oVfheZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKohpo=EWFNddjMNwHO4u4-bi1AQ4cvsJ4DfFOgaFv3oVfheZg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: sameo@linux.intel.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, Vipul Kumar Samar <vipulkumar.samar@st.com>
List-Id: devicetree@vger.kernel.org

On Fri, 23 Nov 2012, Viresh Kumar wrote:

> On 22 November 2012 16:54, Lee Jones <lee.jones@linaro.org> wrote:
> >> diff --git a/Documentation/devicetree/bindings/mfd/stmpe.txt b/Doc=
umentation/devicetree/bindings/mfd/stmpe.txt
> >>       stmpe1601: stmpe1601@40 {
>=20
> >> +             id =3D <0>;
> >
> > Don't do this. Device IDs are Linux specific.
>=20
> Hi Lee,
>=20
> This is id of the mfd device that we need to pass to mfd_add_device()
> and is used in following:

MFD devices are Linux specific, whereas DT is cross-platform. Thus
you can't put it in the DTS(I) files.

> 	pdev =3D platform_device_alloc(cell->name, id + cell->id);
>=20
> This is required when we have multiple instances of MFD device presen=
t
> on board. How do you want me to handle this ?

There are lots of examples of this already. I have to leave something
to the imagination, or I'll be requesting a cut of your salary. :D

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
