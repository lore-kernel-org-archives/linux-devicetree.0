From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 1/5] mfd: add bcm590xx pmu DT binding
Date: Wed, 12 Mar 2014 16:36:33 +0000
Message-ID: <20140312163633.GC22450@lee--X1>
References: <1394633237-16837-1-git-send-email-mporter@linaro.org>
 <1394633237-16837-2-git-send-email-mporter@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1394633237-16837-2-git-send-email-mporter@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matt Porter <mporter@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Christian Daudt <bcm@fixthebug.org>, Devicetree List <devicetree@vger.kernel.org>, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> Add a DT binding for the BCM590xx PMUs. The binding inherits from
> the generic regulator bindings.
>=20
> Signed-off-by: Matt Porter <mporter@linaro.org>
> Reviewed-by: Tim Kryger <tim.kryger@linaro.org>
> Reviewed-by: Markus Mayer <markus.mayer@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/bcm590xx.txt | 37 ++++++++++++=
++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/bcm590xx.tx=
t

Applied with Mark's Ack.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
