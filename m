From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH v3 0/3] Qualcomm Resource Power Manager driver
Date: Tue, 17 Jun 2014 10:07:57 -0700
Message-ID: <7hvbrzbh1u.fsf@paris.lan>
References: <1402944372-31901-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1402944372-31901-1-git-send-email-bjorn.andersson@sonymobile.com>
	(Bjorn Andersson's message of "Mon, 16 Jun 2014 11:46:09 -0700")
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Josh Cartwright <joshc@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, Paul Walmsley <paul@pwsan.com>
List-Id: devicetree@vger.kernel.org

+Paul Walmsley

Bjorn Andersson <bjorn.andersson@sonymobile.com> writes:

> This series adds a regulator driver for the Resource Power Manager found in
> Qualcomm 8660, 8960 and 8064 based devices.
>
> The RPM driver exposes resources to its child devices, that can be accessed to
> implement drivers for the regulators, clocks and bus frequency control that's
> owned by the RPM in these devices.
>
> Changes since v2:
>   - Fix copy-paste error in dt binding
>   - Correct incomplete move from mfd to soc
>   - Correct const mistake in regulator driver
>
> Changes since v1:
>   - Moved rpm driver to drivers/soc

I'm not sure I follow the motivation for having this under drivers/soc?

In fact, my (possibly incorrect) understanding of this Resource Power
Manager is that it's actually to manage communication/control of
resources that are actually handled off the SoC by a microcontroller.

I added Paul W. to Cc so he can correct me, but I think this is a ways
off from the goal of what drivers/soc was for.

Kevin
