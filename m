From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 3/4] ARM: dts: imx27: use lable to override osc26m clock
 setting
Date: Fri, 4 May 2018 12:34:29 -0300
Message-ID: <CAOMZO5D1Dc9hh-o81fvy8PKNx_m8gdR9yW2w5Xumse1VFHFLTQ@mail.gmail.com>
References: <1525395446-1953-1-git-send-email-shawnguo@kernel.org>
 <1525395446-1953-4-git-send-email-shawnguo@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1525395446-1953-4-git-send-email-shawnguo@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

On Thu, May 3, 2018 at 9:57 PM, Shawn Guo <shawnguo@kernel.org> wrote:
> Instead of copying the whole node hierarchy, let's define a label for
> clock osc26m in soc dtsi and use it for overriding clock-frequency.
>
> Signed-off-by: Shawn Guo <shawnguo@kernel.org>

In the Subject: s/lable/label

Other than that the series looks good.
