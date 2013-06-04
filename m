From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2] mfd: DT bindings for the palmas family MFD
Date: Tue, 4 Jun 2013 13:14:34 +0100
Message-ID: <20130604121434.GN3370@gmail.com>
References: <1370335309-6319-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1370335309-6319-1-git-send-email-j-keerthy@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: J Keerthy <j-keerthy@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, swarren@wwwdotorg.org, broonie@opensource.wolfsonmicro.com, rob.herring@calxeda.com, rob@landley.net, sameo@linux.intel.com, wim@iguana.be, lgirdwood@gmail.com, gg@slimlogic.co.uk, t-kristo@ti.com, Ian Lartey <ian@slimlogic.co.uk>
List-Id: devicetree@vger.kernel.org

On Tue, 04 Jun 2013, J Keerthy wrote:

> From: Graeme Gregory <gg@slimlogic.co.uk>
>=20
> Add the various binding files for the palmas family of chips. There i=
s a
> top level MFD binding then a seperate binding for regulators IP block=
s on chips.
>=20
> Signed-off-by: Graeme Gregory <gg@slimlogic.co.uk>
> Signed-off-by: J Keerthy <j-keerthy@ti.com>
> Signed-off-by: Ian Lartey <ian@slimlogic.co.uk>
> ---
> Changes from v1:
> * Corrected ti,ldo6_vibrator property ---> ti,ldo6-vibrator
> * Added the irq.h header file inclusion for defining type of interrup=
t
>=20
>  Documentation/devicetree/bindings/mfd/palmas.txt   |   49 ++++++++++=
+++++
>  .../devicetree/bindings/regulator/palmas-pmic.txt  |   65 ++++++++++=
++++++++++
>  2 files changed, 114 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/palmas.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/palma=
s-pmic.txt

Is there a driver to go with this patch, or was the documentation an
afterthought in this case? If the latter is true I'd be happy to apply
this patch with an Ack from Stephen or one of the other previous
reviewers.

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
