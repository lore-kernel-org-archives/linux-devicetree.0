From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 7/7] ARM: configs: aspeed_g5: Enable AST2600
Date: Tue, 27 Aug 2019 22:12:33 +0200
Message-ID: <CAK8P3a1Dgzrw7nuQR_YJYXSF7Owop2Hpd80bAL0OPhzHMHcbPg@mail.gmail.com>
References: <20190821055530.8720-1-joel@jms.id.au>
 <20190821055530.8720-8-joel@jms.id.au>
 <faf79f9d-baa1-4c8c-a35b-c5d97ad6df8b@www.fastmail.com>
 <CACPK8Xe=mq_Zuw6vsFtb=42ZodbHcizX9QwUoRzY0cDdoWr-Fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACPK8Xe=mq_Zuw6vsFtb=42ZodbHcizX9QwUoRzY0cDdoWr-Fw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joel Stanley <joel@jms.id.au>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Olof Johansson <olof@lixom.net>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 22, 2019 at 6:43 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Thu, 22 Aug 2019 at 02:07, Andrew Jeffery <andrew@aj.id.au> wrote:
> > > +CONFIG_MMC=y
> > > +CONFIG_MMC_SDHCI=y
> > > +CONFIG_MMC_SDHCI_PLTFM=y
> > > +CONFIG_MMC_SDHCI_OF_ASPEED=y
> >
> > The patches haven't yet been applied to the MMC tree, maybe we should
> > add this later?
>
> When enabling drivers in the same merge window as they go into the
> tree we will always be in this situation.
>
> If the driver doesn't make it in this merge window, or first has has
> changes, the worst that will happen is the kconfig name changes and I
> need to update it later. I think we're safe to include it as-is.

Yes, that's fine.

Please also enable all the drivers you need in multi_v7_defconfig
now, preferably as loadable modules.


      Arnd
