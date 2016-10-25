From: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: Re: [PATCH 3/5] ARM: dts: imx6qdl-sabrelite: add missing USB PHY
 reset control
Date: Tue, 25 Oct 2016 23:53:40 +0200
Message-ID: <CAAMH-yu1oC8qaAtVwSxJxKxSmXMzMJkUeu4cUu3OB2yhDV8GBg@mail.gmail.com>
References: <20161025211955.5345-1-gary.bisson@boundarydevices.com>
 <20161025211955.5345-4-gary.bisson@boundarydevices.com>
 <CAOMZO5Aok5w=Di0hZpr7E6PZr6rJ1Xg-xkWcB+u=7xKCT5uWvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5Aok5w=Di0hZpr7E6PZr6rJ1Xg-xkWcB+u=7xKCT5uWvA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Peter Chen <peter.chen@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

On Tue, Oct 25, 2016 at 11:28 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Gary,
>
> On Tue, Oct 25, 2016 at 7:19 PM, Gary Bisson
> <gary.bisson@boundarydevices.com> wrote:
>> Declared as a regulator since the driver doesn't have a reset-gpios
>> property for this.
>
> Peter Chen is working on adding USB reset-gpio property this. Please
> check his series:
> https://www.spinics.net/lists/arm-kernel/msg536105.html

Thanks, I wasn't aware of this series. Indeed if this power sequence
code gets upstream soon I guess we can drop both patches about the USB
PHY reset.

Note that our Nitrogen6_MAX is using the regulator approach, it will
need to be updated once Peter's series gets merged.

Regards,
Gary
