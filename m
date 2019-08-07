From: Oliver Graute <oliver.graute@gmail.com>
Subject: Re: [PATCH v2 10/15] arm64: dts: imx8qm: add conn ss support
Date: Wed, 7 Aug 2019 14:04:28 +0200
Message-ID: <20190807120428.GA27833@optiplex>
References: <1563290089-11085-1-git-send-email-aisheng.dong@nxp.com>
 <1563290089-11085-11-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1563290089-11085-11-git-send-email-aisheng.dong@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, dongas86@gmail.com, catalin.marinas@arm.com, will.deacon@arm.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 16/07/19, Dong Aisheng wrote:
> The CONN SS of MX8QM is mostly the same as MX8QXP except it has one more
> USB HSIC module support. So we can fully reuse the exist CONN SS dtsi.
> Add <soc>-ss-conn.dtsi with compatible string updated according to
> imx8-ss-conn.dtsi.
> +&usdhc1 {
> +	compatible = "fsl,imx8qm-usdhc", "fsl,imx7d-usdhc";
> +};
> +
> +&usdhc2 {
> +	compatible = "fsl,imx8qm-usdhc", "fsl,imx7d-usdhc";
> +};

I need to add here for my imx8qm-rom7720-a1 board:


&usdhc3 {
	compatible = "fsl,imx8qm-usdhc", "fsl,imx7d-usdhc";
};

I'll prepare a patch for that on top of yours.

Best Regards,

Oliver
