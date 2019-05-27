From: Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6sx-udoo-neo: enable i2c-2 and i2c-4 for
 onboard sensors
Date: Mon, 27 May 2019 18:05:59 +0100
Message-ID: <CALeDE9OKkeMnM2paDmDRK0j5=ESujEk6M_n33PMYUy2WrBf5Ow@mail.gmail.com>
References: <20180713171151.24699-1-pbrobinson@gmail.com>
 <CAOMZO5B+1atjr3Ur7EGMJSEbqT8zqWdKZWNHrkyCGvgGM4nJFg@mail.gmail.com>
 <CALeDE9N5AnQba5LirHegWgz2_3Rr6cCT_ttTUtg38OdvdegpFA@mail.gmail.com>
 <CAOMZO5BDEnFU__1iSuVpmRKx4SK5F+WFNho-ujTSCobQy-vzSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5BDEnFU__1iSuVpmRKx4SK5F+WFNho-ujTSCobQy-vzSw@mail.gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

> > Enabling it to turn around and then disable it again seemed counter
>
> Other option would be to put i2c4 with status = "disabled" in the common file
> and enable i2c4 on the two dts files that suport it.

I've (finally) revisited this again and also got bluetooth working,
will send a new series out shortly.

Peter

> > intuitive to me hence the way I did, the WiFi in done that way even
> > though it's not on all boards and I would imagine it would cause
> > errors on the devices where there isn't wifi although I don't have
> > those model(s) to verify.
>
> If the Wifi is not present, then it will not be probed, so it would
> not cause problems.
