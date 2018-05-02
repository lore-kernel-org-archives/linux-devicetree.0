From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 1/2] regulator: dt-bindings: add QCOM RPMh regulator bindings
Date: Wed, 2 May 2018 09:37:15 -0700
Message-ID: <CAD=FV=UDUKg58xe+3C5QUbFwFkO8d3c_tzxmfPDzdv1KXZ3W9g@mail.gmail.com>
References: <cover.1523673467.git.collinsd@codeaurora.org> <39b676d2ba7dac2436196cc5a090c6f151498dc8.1523673467.git.collinsd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <39b676d2ba7dac2436196cc5a090c6f151498dc8.1523673467.git.collinsd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Collins <collinsd@codeaurora.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Apr 13, 2018 at 7:50 PM, David Collins <collinsd@codeaurora.org> wrote:
> +- vdd_l26-supply
> +- vdd_lvs1_lvs2-supply
> +- vdd_lvs1_lvs2-supply
> +       Usage:      optional (PM8998 only)
> +       Value type: <phandle>
> +       Definition: phandle of the parent supply regulator of one or more of the
> +                   regulators for this PMIC.

One small additional nit here is that "vdd_lvs1_lvs2-supply" is listed twice.

Also on the schematics (and in the PM8998 datasheet) I have this is
"VIN_LVS_1_2".  It seems like you should be consistent here and call
this "vin-lvs-1-2-supply".

-Doug
