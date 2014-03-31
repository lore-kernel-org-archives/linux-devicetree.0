From: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCHv3 1/2] mtd: gpmi: make blockmark swapping optional
Date: Mon, 31 Mar 2014 10:06:59 +0800
Message-ID: <20140331020657.GA32650@localhost>
References: <1395235406-13449-1-git-send-email-y>
 <1396002907-17750-1-git-send-email-LW@KARO-electronics.de>
 <1396002907-17750-2-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1396002907-17750-2-git-send-email-LW@KARO-electronics.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Boris BREZILLON <b.brezillon.dev@gmail.com>, linux-doc@vger.kernel.org, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-mtd@lists.infradead.org, Michael Grzeschik <m.grzeschik@pengutronix.de>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Jingoo Han <jg1.han@samsung.com>, Shawn Guo <shawn.guo@freescale.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Michael Opdenacker <michael.opdenacker@free-electrons.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Fabio Estevam <fabio.estevam@freescale.com>, Brian Norris <computersforpeace@gmail.c>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 28, 2014 at 11:35:06AM +0100, Lothar Wa=DFmann wrote:
> +  - fsl,no-blockmark-swap: Don't swap the bad block marker from the OOB
> +                       area with the byte in the data area but rely on t=
he
> +                       flash based BBT for identifying bad blocks.
> +                       NOTE: this is only valid in conjunction with
> +                             'nand-on-flash-bbt'.
> +                       WARNING: on i.MX28 blockmark swapping cannot be
> +                       disabled for the BootROM in the FCB. Thus,
> +                       partitions written from Linux with this feature
> +                       turned on may not be accessible by the BootROM
> +                       code.

Thanks for adding this warning.

Acked-by: Huang Shijie <b32955@freescale.com>


thanks
Huang Shijie
