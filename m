From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v10 1/2] mfd: AXP20x: Add bindings documentation
Date: Sat, 7 Mar 2015 00:48:43 +0800
Message-ID: <CAGb2v65-kq=usC8Xip56p9wbs7RMUd0=sXcjcgY3Ec33bxEUaw@mail.gmail.com>
References: <1424431168-25157-1-git-send-email-wens@csie.org> <1424431168-25157-2-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424431168-25157-2-git-send-email-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Mark Brown <broonie@kernel.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Carlo Caione <carlo@caione.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 20, 2015 at 7:19 PM, Chen-Yu Tsai <wens@csie.org> wrote:
> From: Carlo Caione <carlo@caione.org>
>
> Bindings documentation for the AXP20x driver. In this file also
> sub-nodes are documented.
>
> Signed-off-by: Carlo Caione <carlo@caione.org>
> [wens@csie.org: clarify interrupt source for the axp PMIC]
> [wens@csie.org: explain dcdc-workmode in detail and trim lines to 80 chars]
> [wens@csie.org: make regulator supplies optional if using unregulated input]
> [wens@csie.org: use cubieboard2 regulator nodes as example]
> [wens@csie.org: x-powers,dcdc-workmode default changed to 'current hardware
>                 setting']
> [wens@csie.org: reorganized regulator related properties into separate
>                 section.]
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Ping?
