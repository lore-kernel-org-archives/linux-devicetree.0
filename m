From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 0/2] Add QCOM video clock controller driver
Date: Tue, 08 May 2018 13:15:07 -0700
Message-ID: <152581050735.138124.795656319855957213@swboyd.mtv.corp.google.com>
References: <1525350925-16006-1-git-send-email-anischal@codeaurora.org>
 <152545146453.138124.2471609033510400995@swboyd.mtv.corp.google.com>
 <09ac2bd5eab25cfc70a1c5dc7b0f90ed@codeaurora.org>
 <20180507171121.GA22656@rob-hp-laptop>
 <8ac8a361a7dc69cce1e7498f1473bad8@codeaurora.org>
 <CAL_JsqL3wz_Y0Qp7Z8-JjkFGegKLFOUscJgGp+XO-Lm52iN2Vg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqL3wz_Y0Qp7Z8-JjkFGegKLFOUscJgGp+XO-Lm52iN2Vg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Nischal <anischal@codeaurora.org>, Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>, Taniya Das <tdas@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, linux-clk-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Rob Herring (2018-05-08 05:48:07)
> On Mon, May 7, 2018 at 11:53 PM, Amit Nischal <anischal@codeaurora.org> w=
rote:
> > On 2018-05-07 22:41, Rob Herring wrote:
> >>
> >> On Mon, May 07, 2018 at 04:16:53PM +0530, Amit Nischal wrote:
> >>>
> >>> On 2018-05-04 22:01, Stephen Boyd wrote:
> >>> > Quoting Amit Nischal (2018-05-03 05:35:23)
> >>> > > Changes in v1:
> >>> > >    https://lkml.org/lkml/2018/4/24/545
> >>> > > Addressed below review comments given by Rob
> >>> > > - Change the compatible property as per '<vendor>,<soc>-<block>'
> >>> > > format.
> >>> > > - Add header definitions for resets and power-domain cells.
> >>> >
> >>> > You didn't add any reset definitions though?
> >>>
> >>> We haven't added the reset definitions for videocc as there is no
> >>> video reset client.
> >>
> >>
> >> So? You don't know what resets there are?
> >>
> >
> > We know the resets, but video driver doesn't do any block resets
> > prior to accessing the video subsystem so that's the reason we do
> > not want to expose the resets in videocc driver.
> =

> Bindings don't have to match what drivers currently use but should be
> complete as possible.

Right. Please add the #defines in the header file for the resets. You
can leave them out of the driver if you really want to, but typically we
still add them and then rely on not touching them if they shouldn't be
used.
