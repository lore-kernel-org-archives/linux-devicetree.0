From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH V6 2/2] mailbox: introduce ARM SMC based mailbox
Date: Wed, 18 Sep 2019 09:22:54 -0500
Message-ID: <CABb+yY3irsE0U-bex4G60Lwpewea6=pE1vSzi72Z+5DafmC8Xg@mail.gmail.com>
References: <1568626884-5189-1-git-send-email-peng.fan@nxp.com>
 <1568626884-5189-3-git-send-email-peng.fan@nxp.com> <20190917183856.2342beed@donnerap.cambridge.arm.com>
 <AM0PR04MB44813D62FF7E6762BB17460E888E0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <20190918110037.4edefb2f@donnerap.cambridge.arm.com> <CABb+yY2G8s9gV8Pu+f__8-bubjCJsVQrQikbVMZXmpTwSMBxiQ@mail.gmail.com>
 <20190918145832.0bb72e16@donnerap.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190918145832.0bb72e16@donnerap.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andre Przywara <andre.przywara@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 18, 2019 at 8:58 AM Andre Przywara <andre.przywara@arm.com> wrote:
>

> > > Also there is mbox_chan_txdone() with which a controller driver can signal TX completion explicitly.
> > >
> > No. Controller can use that only if it has specified txdone_irq, which
> > is not the case here.
>
> I see. So does the framework handle the case where both txdone_poll and txdone_irq are false?
>
Of course. If there is no IRQ or POLL mechanism for controller to
detect tx-done, the only way left is for client driver to know by some
'ack' response (if any). The client should call mbox_client_txdone()

Thanks
