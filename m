From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: imx6 wandboard and riotboard: remove
 regulators bus node
Date: Sun, 27 May 2018 13:40:13 -0300
Message-ID: <CAOMZO5AzC1FVfwuimxnaGgsksDk6MjXpGiwwbc0Yer-fX8ZVFA@mail.gmail.com>
References: <20180526183053.14029-1-akurz@blala.de>
 <20180526183053.14029-2-akurz@blala.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180526183053.14029-2-akurz@blala.de>
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
Cc: Fabio Estevam <fabio.estevam@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Alexander,

[It would be better to split this patch in two: one for wandboard and
another one for riotboard]

On Sat, May 26, 2018 at 3:30 PM, Alexander Kurz <akurz@blala.de> wrote:

> +
> +       reg_2p5v: fixedregulator@0 {

This causes dtc warnings with W=1 as you are passing a unit address
without a corresponding reg property.

You can rewrite this as:

reg_2p5v: regulator-2p5v {

Please follow this convention in the entire series.

Thanks
