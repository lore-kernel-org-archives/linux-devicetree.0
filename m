From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: Re: [PATCH v5 0/3] Stingray thermal driver support
Date: Wed, 2 Jan 2019 10:02:43 +0530
Message-ID: <CABe79T7FiAiCELmgK9xUiSaW8g=Vx6mBzan7+=8zx4uZ2jh1Rw@mail.gmail.com>
References: <1539702680-3746-1-git-send-email-srinath.mannam@broadcom.com>
 <b6e02875-784f-4908-a985-5ee7e3df3ac6@gmail.com> <CABe79T4mpnbkaTCerYegmc1+uY4idOVOxCVDqHramk3fYipiCA@mail.gmail.com>
 <3c05a1f1-5041-ebb7-27e5-0a2321314b0a@broadcom.com> <1546351479.2077.1.camel@intel.com>
 <20190101160733.GB3306@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190101160733.GB3306@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Eduardo Valentin <edubezval@gmail.com>
Cc: Zhang Rui <rui.zhang@intel.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

Hi Rui, Eduardo,

Wish you very happy new year and Thank you very much for your response.

Regards,
Srinath.

On Tue, Jan 1, 2019 at 9:37 PM Eduardo Valentin <edubezval@gmail.com> wrote=
:
>
> On Tue, Jan 01, 2019 at 10:04:39PM +0800, Zhang Rui wrote:
> > On =E4=B8=80, 2018-12-31 at 14:15 -0800, Florian Fainelli wrote:
> > >
> > > On 04/12/2018 19:17, Srinath Mannam wrote:
> > > >
> > > > Hi,
> > > >
> > > > Could you please provide your feedback to this patch series?
> > > Rui or Eduardo can we get either one of you to review the thermal
> > > driver
> > > parts of this patch series? Why do we constantly have to chase people
> > > to
> > > respond in this specific subsystem?
> > >
> > Eduardo, can you please take a look at this patch series?
>
> Yup, I will take a look.
>
> >
> > thanks,
> > rui
> > > >
> > > >
> > > > Regards,
> > > > Srinath.
> > > > On Thu, Nov 8, 2018 at 3:45 AM Florian Fainelli <f.fainelli@gmail.c
> > > > om> wrote:
> > > > >
> > > > >
> > > > >
> > > > >
> > > > > On 10/16/2018 8:11 AM, Srinath Mannam wrote:
> > > > > >
> > > > > > These patches adds the stingray thermal driver and its
> > > > > > corresponding DT nodes with documentation.
> > > > > Can we get feedback from the thermal maintains whether this is
> > > > > acceptable or not?
> > > > >
> > > > > >
> > > > > >
> > > > > > Changes from v4
> > > > > >   - Addressed Rob Herring comments on DT parameters and
> > > > > >     thermal driver architecture.
> > > > > >   - Removed brcm,max-crit-temp DT parameter
> > > > > >   - Changed driver to thermal sensor registration model.
> > > > > >   - Added trip DT properties.
> > > > > >
> > > > > > Changes from v3
> > > > > >   - Addressed Daniel lezcano comments.
> > > > > >   - Elaborated commit description of thermal driver patch.
> > > > > >   - Added brcm,max-crit-temp DT parameter.
> > > > > >
> > > > > > Changes from v2:
> > > > > >   - All stingray TMON DT nodes are combine together into
> > > > > > single.
> > > > > >     Temperature registers are combined into one mem resource.
> > > > > >     brcm,tmon-mask parameter has available TMONs mask value.
> > > > > >   - All available TMONs are initialized together in single
> > > > > >     instance of driver probe call.
> > > > > >
> > > > > > Changes from v1:
> > > > > >   - Fixed auto build sparce warning.
> > > > > >
> > > > > > Pramod Kumar (3):
> > > > > >   dt-bindings: thermal: Add binding document for SR thermal
> > > > > >   thermal: broadcom: Add Stingray thermal driver
> > > > > >   arm64: dts: stingray: Add Stingray Thermal DT support.
> > > > > >
> > > > > >  .../bindings/thermal/brcm,sr-thermal.txt           | 105
> > > > > > ++++++++++++++++
> > > > > >  .../arm64/boot/dts/broadcom/stingray/stingray.dtsi |  89
> > > > > > +++++++++++++
> > > > > >  drivers/thermal/Kconfig                            |   3 +-
> > > > > >  drivers/thermal/broadcom/Kconfig                   |   9 ++
> > > > > >  drivers/thermal/broadcom/Makefile                  |   1 +
> > > > > >  drivers/thermal/broadcom/sr-thermal.c              | 138
> > > > > > +++++++++++++++++++++
> > > > > >  6 files changed, 344 insertions(+), 1 deletion(-)
> > > > > >  create mode 100644
> > > > > > Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt
> > > > > >  create mode 100644 drivers/thermal/broadcom/sr-thermal.c
> > > > > >
> > > > > --
> > > > > Florian
