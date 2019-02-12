From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH 0/4] Add new device nodes for Spreadtrum SC9860 platform
Date: Tue, 12 Feb 2019 16:40:10 +0800
Message-ID: <CAMz4kuJdPts31Ak-H=VAivvoqqPtxO5M1RdqrNPwTLT5d1h_7w@mail.gmail.com>
References: <cover.1548052878.git.baolin.wang@linaro.org> <CAK8P3a3UROFLTtEcNXKtMUN283UQ6auQUOXCR=6e3BdLu5K8Nw@mail.gmail.com>
 <CAMz4kuLotnNom9kx2EmdfVEb+gvWfEbxoh6+hiqk87EjmtYJwA@mail.gmail.com> <20190201130519.GH20797@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201130519.GH20797@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Olof Johansson <olof@lixom.net>, Orson Zhai <orsonzhai@gmail.com>, Lyra Zhang <zhang.lyra@gmail.com>, DTML <devicetree@vger.kernel.org>, arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

Sorry for late reply.

On Fri, 1 Feb 2019 at 21:05, Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Feb 01, 2019 at 08:05:30PM +0800, Baolin Wang wrote:
>
> > On Spreadtrum platform, we use one mfd driver [1] to populate the
> > SC27XX series PMICs including SC2731, SC2721, SC2720 and SC2730. So we
> > use sc27xx to be compatible with different PMICs' devices, otherwise
> > it will be difficult to define the mfd cell arrays in mfd driver. Do
> > you have any good suggestion? Thanks.
>
> You can just list all the individual device names in the of_match_table
> for the MFD and then it can bind to any of them.  You can always map
> them onto the same behaviour in the MFD driver if they are identical
> from a software point of view.

If I understood correctly, as you suggested, we should add new
mfd_cell groups to list all different PMICs' device names. Something
like:

static const struct mfd_cell sprd_pmic_sc2731_devs[] = {
{
.name = "sc27xx-wdt",
.of_compatible = "sprd,sc2731-wdt",
}, {
.name = "sc27xx-rtc",
.of_compatible = "sprd,sc2731-rtc",
}, {
.name = "sc27xx-charger",
.of_compatible = "sprd,sc2731-charger",
},  {
.name = "sc27xx-fast-chg",
.of_compatible = "sprd,sc2731-fast-chg",
}, {
.name = "sc27xx-typec",
.of_compatible = "sprd,sc2731-typec",
}, {
.name = "sc27xx-eic",
.of_compatible = "sprd,sc2731-eic",
},

.......

};

static const struct mfd_cell sprd_pmic_sc2730_devs[] = {
{
.name = "sc27xx-wdt",
.of_compatible = "sprd,sc2730-wdt",
}, {
.name = "sc27xx-rtc",
.of_compatible = "sprd,sc2730-rtc",
}, {
.name = "sc27xx-charger",
.of_compatible = "sprd,sc2730-charger",
},  {
.name = "sc27xx-fast-chg",
.of_compatible = "sprd,sc2730-fast-chg",
}, {
.name = "sc27xx-typec",
.of_compatible = "sprd,sc2730-typec",
}, {
.name = "sc27xx-eic",
.of_compatible = "sprd,sc2730-eic",
},

.......

};

......

But from my point, they are just some meaningless duplication, and
will waste lots of code there.

-- 
Baolin Wang
Best Regards
