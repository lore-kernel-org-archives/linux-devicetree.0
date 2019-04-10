From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6-solox: fix cpu hang BUG
Date: Wed, 10 Apr 2019 09:14:20 -0300
Message-ID: <CAOMZO5AHTj+tGSs-1eO2D0-fqqWhh3t_UgeLm+4s==uQtw4QqA@mail.gmail.com>
References: <1554885748-51260-1-git-send-email-root@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1554885748-51260-1-git-send-email-root@localhost.localdomain>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: root <root@localhost.localdomain>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Kay-Liu <liuk@cetca.net.cn>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Kay,

On Wed, Apr 10, 2019 at 5:43 AM root <root@localhost.localdomain> wrote:
>
> From: Kay-Liu <liuk@cetca.net.cn>
>
> The imx6-solox's enet clk config would cause CPU hang in a special
> environment.The BUG was accepted by yoctoproject, they will process
> platform related code,only submit dts part here.
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13258
> Add support for it.

You did a very good job in describing the issue in the bugzilla report.

Please describe the issue and the proposed solution here in the commit log too.

It can be a summary of what you added in the bugzilla entry.

Thanks
