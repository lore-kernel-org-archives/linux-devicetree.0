From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 2/5] arm64: dts: imx8mq: Add SAI2 node
Date: Tue, 26 Feb 2019 09:54:27 -0300
Message-ID: <CAOMZO5AzUzyr_xixDcntoNt1KNSRih_2ZRFnzQHcg6pZmHsYig@mail.gmail.com>
References: <20190226070742.30551-1-daniel.baluta@nxp.com> <20190226070742.30551-3-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190226070742.30551-3-daniel.baluta@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: "shawnguo@kernel.org" <shawnguo@kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>, "angus@akkea.ca" <angus@akkea.ca>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "baruch@tkos.co.il" <baruch@tkos.co.il>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Aisheng
List-Id: devicetree@vger.kernel.org

On Tue, Feb 26, 2019 at 4:08 AM Daniel Baluta <daniel.baluta@nxp.com> wrote:
>
> SAI2 is part of AIPS-3 memory region and it's the DAI through
> which the wm8524 codec gets its data.

Please do not mention wm8524 in a SoC dtsi file commit message.

It is the imx8mq-evk board that uses this codec and this information
is not SoC related.
