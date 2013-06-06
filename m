From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3] mfd: DT bindings for the palmas family MFD
Date: Thu, 6 Jun 2013 08:02:10 +0100
Message-ID: <20130606070210.GR3370@gmail.com>
References: <1370496441-24620-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1370496441-24620-1-git-send-email-j-keerthy@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: J Keerthy <j-keerthy@ti.com>
Cc: linux-kernel@vger.kernel.org, grant.likely@secretlab.ca, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, swarren@wwwdotorg.org, swarren@nvidia.com, rob.herring@calxeda.com, rob@landley.net, sameo@linux.intel.com, wim@iguana.be, lgirdwood@gmail.com, gg@slimlogic.co.uk, t-kristo@ti.com, Ian Lartey <ian@slimlogic.co.uk>
List-Id: devicetree@vger.kernel.org

On Thu, 06 Jun 2013, J Keerthy wrote:

> Add the various binding files for the palmas family of chips. There i=
s a
> top level MFD binding then a seperate binding for regulators IP block=
s on chips.
>=20
> Signed-off-by: Graeme Gregory <gg@slimlogic.co.uk>
> Signed-off-by: J Keerthy <j-keerthy@ti.com>
> Signed-off-by: Ian Lartey <ian@slimlogic.co.uk>
> Reviewed-by: Stephen Warren <swarren@nvidia.com>=20
> ---
>  Documentation/devicetree/bindings/mfd/palmas.txt   |   49 ++++++++++=
+++
>  .../devicetree/bindings/regulator/palmas-pmic.txt  |   72 ++++++++++=
++++++++++
>  2 files changed, 121 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/palmas.txt
>  create mode 100644
> Documentation/devicetree/bindings/regulator/palmas-pmic.tx

Applied, thanks.

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
