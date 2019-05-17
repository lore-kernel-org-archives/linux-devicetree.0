From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v12 3/4] dt-bindings: Add an entry for Purism SPC
Date: Thu, 16 May 2019 21:31:13 -0500
Message-ID: <CAL_Jsq+p_Hu5hY3XGx168iq8jo+-rD1qu8tbGfQdBXASi7H+mg@mail.gmail.com>
References: <20190514132822.27023-1-angus@akkea.ca> <20190514132822.27023-4-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190514132822.27023-4-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Cc: angus.ainslie@puri.sm, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 14, 2019 at 8:28 AM Angus Ainslie (Purism) <angus@akkea.ca> wrote:
>
> Add an entry for Purism, SPC
>
> Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)

I've converted this file to json-schema as of v5.2-rc1. See commit
8122de54602e. Sorry, but you will have to rework this patch.


Rob
