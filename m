From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx50: remove non-existent USB instances
Date: Sun, 1 Jul 2018 17:09:53 +0800
Message-ID: <20180701090952.GM4348@dragon>
References: <20180624061538.10156-1-akurz@blala.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180624061538.10156-1-akurz@blala.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexander Kurz <akurz@blala.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Greg Ungerer <gerg@uclinux.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 24, 2018 at 06:15:38AM +0000, Alexander Kurz wrote:
> According to the i.MX50 Reference Manual, the SoC features one USB OTG
> and one host controller. Remove the non-existent instances from the
> DTS which probably got initially copied from the mx53 DTS.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>

Applied, thanks.
