From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v6 2/3] arm64: allwinner: axp803: Add drivevbus regulator
Date: Tue, 24 Apr 2018 20:28:09 +0800
Message-ID: <CAGb2v64g55zNevUaEPziKu9aG2CFGEkE=trUhwcJy2oV9Jdcag@mail.gmail.com>
References: <20180423063239.3988-1-jagan@amarulasolutions.com> <20180423063239.3988-2-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180423063239.3988-2-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Mark Brown <broonie@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 23, 2018 at 2:32 PM, Jagan Teki <jagan@amarulasolutions.com> wrote:
> Add reg_drivevbus regualtor for boards which are using
> external regulator to drive the OTG VBus through N_VBUSEN
> PMIC pin.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Applied with subject prefix changed to "arm64: dts: allwinner: ...".
