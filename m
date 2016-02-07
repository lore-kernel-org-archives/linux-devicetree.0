From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/1 v2] imx6q-wandboard-revb1.dts: use unique machine name
Date: Sun, 7 Feb 2016 13:19:55 -0200
Message-ID: <CAOMZO5CuCqWbZakc3POzPTYVOb_7zZ3VO807W+Q1M1fhtzUpYw@mail.gmail.com>
References: <1454758226-4561-1-git-send-email-xypron.glpk@gmx.de>
 <1454760419-4822-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1454760419-4822-1-git-send-email-xypron.glpk@gmx.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, George Joseph <george.joseph@fairview5.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, Feb 6, 2016 at 10:06 AM, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> Downstream packages like Debian flash-kernel use
> /proc/device-tree/model
> to determine which dtb file to install.
>
> Hence each dts in the Linux kernel should provide a unique model identifier.
>
> https://lkml.org/lkml/2014/7/8/579 created the new file
> imx6q-wandboard-revb1.dts but used the same model identifier
> as in imx6q-wandboard.dts.
>
> This patch provides a unique model identifier for revision B1 of
> the Wandboard Quad.
>
> v2:
>         correct name of referenced Debian package
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
