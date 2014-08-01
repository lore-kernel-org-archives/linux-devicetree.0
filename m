From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 1/4] mfd: pm8xxx-spmi: add support for Qualcomm SPMI
 PMICs
Date: Fri, 1 Aug 2014 12:23:56 +0100
Message-ID: <20140801112356.GP9030@lee--X1>
References: <1406205921-7452-1-git-send-email-svarbanov@mm-sol.com>
 <1406205921-7452-2-git-send-email-svarbanov@mm-sol.com>
 <53D8182A.5050204@codeaurora.org>
 <53DA02C0.2050606@mm-sol.com>
 <53DB5061.8080403@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53DB5061.8080403@mm-sol.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, David Collins <collinsd@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Grant Likely <grant.likely@linaro.org>, Courtney Cavin <courtney.cavin@sonymobile.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Josh Cartwright <joshc@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Fri, 01 Aug 2014, Stanimir Varbanov wrote:
> On 07/31/2014 11:48 AM, Stanimir Varbanov wrote:
> > On 07/30/2014 12:54 AM, David Collins wrote:
> >> On 07/24/2014 05:45 AM, Stanimir Varbanov wrote:
> >>> From: Josh Cartwright <joshc@codeaurora.org>
> >>>
> >>> The Qualcomm SPMI PMIC chips are components used with the
> >>> Snapdragon 800 series SoC family.  This driver exists
> >>> largely as a glue mfd component, it exists to be an owner
> >>> of an SPMI regmap for children devices described in
> >>> device tree.
> >>>
> >>> Signed-off-by: Josh Cartwright <joshc@codeaurora.org>
> >>> Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
> >>> Acked-by: Lee Jones <lee.jones@linaro.org>
> >>> ---
> >>>  drivers/mfd/Kconfig       |   16 +++++++++++
> >>>  drivers/mfd/Makefile      |    1 +
> >>>  drivers/mfd/pm8xxx-spmi.c |   65 +++++++++++++++++++++++++++++++=
++++++++++++++
> >>
> >> Would it be possible to rename this driver: qcom-spmi-pmic.c?  The=
 driver
> >> will be supporting several PMICs that do not fit the pm8xxx naming=
 scheme.
> >>  One of which is even specified in the compatible list of this dri=
ver
> >> (pma8084).  There is presently downstream support for the followin=
g PMICs:
> >> PM8019, PM8110, PM8226, PM8841, PM8916, PM8941, PM8994, PMA8084, P=
MD9635,
> >> PMI8962, and PMI8994 [1].  Four of these do not fit the "PM8XXX" t=
emplate.
> >=20
> > I haven't strong opinion on the file names. The qcom prefix is the =
one
> > which annoying me. If you look at /drivers/mfd the company name pre=
fixes
> > are very few.
> >=20
> > The *compatible* strings are the important thing here. So If MFD
> > maintainer is fine with this name I'm fine too.
>=20
> Lee, are you OK with suggested names qcom-spmi-pmic and qcom-ssbi-pmi=
c?

Sounds fine to me.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
