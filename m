From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dt: imx31: fix AVIC base address
Date: Thu, 17 Nov 2016 11:44:10 -0200
Message-ID: <CAOMZO5CfqBaHaOKEgEFU5a4D8ekJX2Mpoon_3eNAOveKj+=-wA@mail.gmail.com>
References: <20161117013051.29381-1-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161117013051.29381-1-vz@mleia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 16, 2016 at 11:30 PM, Vladimir Zapolskiy <vz@mleia.com> wrote:
> From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
>
> On i.MX31 AVIC interrupt controller base address is at 0x68000000.
>
> The problem was shadowed by the AVIC driver, which takes the correct
> base address from a SoC specific header file.
>
> Fixes: d2a37b3d91f4 ("ARM i.MX31: Add devicetree support")
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

Yes, this is what the Reference Manual states, thanks.

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
