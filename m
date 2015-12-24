From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH] ARM64: dts: add LS1043a-QDS board support
Date: Wed, 23 Dec 2015 23:40:15 -0600
Message-ID: <1450935615.18314.125.camel@freescale.com>
References: <1450935037-42930-1-git-send-email-Zhiqiang.Hou@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1450935037-42930-1-git-send-email-Zhiqiang.Hou@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Zhiqiang Hou <Zhiqiang.Hou@freescale.com>, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will.deacon@arm.com
Cc: Mingkai.Hu@freescale.com, Shaohui.Xie@freescale.com
List-Id: devicetree@vger.kernel.org

On Thu, 2015-12-24 at 13:30 +0800, Zhiqiang Hou wrote:
> +/dts-v1/;
> +/include/ "fsl-ls1043a.dtsi"
> +
> +/ {
> +	model = "LS1043A QDS Board";
> +

compatible?

-Scott
