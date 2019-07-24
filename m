From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: bus: imx-weim: document optional burst
 clock mode
Date: Wed, 24 Jul 2019 14:48:22 -0600
Message-ID: <20190724204822.GA17166@bogus>
References: <20190712204316.16783-1-TheSven73@gmail.com>
 <20190712204316.16783-2-TheSven73@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190712204316.16783-2-TheSven73@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Fri, 12 Jul 2019 16:43:16 -0400, Sven Van Asbroeck wrote:
> An optional devicetree property was added to the imx-weim driver,
> which if present instructs it to operate in burst clock mode.
> Update the dt-bindings to reflect this.
> 
> Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
> ---
>  Documentation/devicetree/bindings/bus/imx-weim.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
