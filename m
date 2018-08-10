From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v9 2/2] regulator: add QCOM RPMh regulator driver
Date: Fri, 10 Aug 2018 13:07:14 -0700
Message-ID: <CAD=FV=V54aOCTLk3J_0=DL0XHJ-Tc77zKzURTwz5PJsioK73+A@mail.gmail.com>
References: <cover.1531531808.git.collinsd@codeaurora.org> <acfc014f3ae3d7feea30be6beaec3e64d96a2723.1531531808.git.collinsd@codeaurora.org>
 <20180810162920.GG20971@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180810162920.GG20971@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: David Collins <collinsd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Aug 10, 2018 at 9:29 AM, Mark Brown <broonie@kernel.org> wrote:
> On Fri, Jul 13, 2018 at 06:50:59PM -0700, David Collins wrote:
>
>> +     switch (rpmh_mode) {
>
>> +     default:
>> +             mode = REGULATOR_MODE_INVALID;
>> +     }
>
> I'm not sure why the break statements are being omitted in default
> cases, but I do find myself stopping and trying to figure it out?

Hopefully <https://lore.kernel.org/lkml/20180810200531.88409-1-dianders@chromium.org/>
addresses this?

Thanks!

-Doug
