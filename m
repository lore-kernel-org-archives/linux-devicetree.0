From: Christian Ruppert <christian.ruppert@abilis.com>
Subject: Re: [PATCH 1/4] Make non-linear GPIO ranges accesible from gpiolib
Date: Tue, 18 Jun 2013 11:25:17 +0200
Message-ID: <20130618092516.GC18663@ab42.lan>
References: <20130617160324.GA15853@ab42.lan>
 <1371485086-16016-1-git-send-email-christian.ruppert@abilis.com>
 <CACRpkdYZ6QXsh_7fG=B_Ci5hqm2LQe=Hbf5dyZK+tjdnVaHF4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYZ6QXsh_7fG=B_Ci5hqm2LQe=Hbf5dyZK+tjdnVaHF4A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Patrice CHOTARD <patrice.chotard@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 18, 2013 at 10:09:47AM +0200, Linus Walleij wrote:
> On Mon, Jun 17, 2013 at 6:04 PM, Christian Ruppert
> <christian.ruppert@abilis.com> wrote:
>=20
> > This patch adds the infrastructure required to register non-linear =
gpio
> > ranges through gpiolib and the standard GPIO device tree bindings.
> >
> > Signed-off-by: Christian Ruppert <christian.ruppert@abilis.com>
>=20
> >  Documentation/devicetree/bindings/gpio/gpio.txt |   44 +++++++++++=
+++++++
> >  arch/arc/boot/dts/abilis_tb100.dtsi             |   56 +++++++++++=
-----------
> >  arch/arc/boot/dts/abilis_tb101.dtsi             |   56 +++++++++++=
-----------
> >  arch/arc/boot/dts/abilis_tb10x.dtsi             |    3 +-
> >  drivers/gpio/gpiolib-of.c                       |   31 +++++++++--=
-
> >  drivers/gpio/gpiolib.c                          |   47 +++++++++++=
++++++++
> >  drivers/pinctrl/core.c                          |   23 +++++++++
> >  include/asm-generic/gpio.h                      |   10 ++++
> >  include/linux/gpio.h                            |    9 ++++
> >  include/linux/pinctrl/pinctrl.h                 |    3 +
> >  10 files changed, 216 insertions(+), 66 deletions(-)
>=20
> Can you please split this patch in two?
>=20
> One altering drivers/* include/* and the Documentation/*
>=20
> And a separate patch to alter all the abilis trees?
>=20
> I do not maintain bisectability across device trees
> to the rest of the kernel, as these trees are supposed
> to be moved out of the kernel at some point.

Hi Linus,

In the follow up the complete patch series without the device tree
modifications. I'll check their upstream separately with Vineet (ARC
platform maintainer) when everything else is applied. Tell me if you
would like to apply the device tree changes yourself nevertheless and
I'll send a patch.

Greetings,
  Christian

--=20
  Christian Ruppert              ,          <christian.ruppert@abilis.c=
om>
                                /|
  Tel: +41/(0)22 816 19-42     //|                 3, Chemin du Pr=E9-F=
leuri
                             _// | bilis Systems   CH-1228 Plan-les-Oua=
tes
