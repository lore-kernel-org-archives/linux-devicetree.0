From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: imx8mq: Init rates and parents configs for
 clocks
Date: Sun, 28 Jul 2019 18:24:05 +0300
Message-ID: <CAEnQRZDrTZ-KFs0fCYorpiRHJFud9twoe-B4fRjekd6DJiODhw@mail.gmail.com>
References: <1562155311-24696-1-git-send-email-abel.vesa@nxp.com>
 <CAEnQRZBK7EYVhbGpFeC79HxU=h0OcXU_SSeaMWbp+Qk=rf=14g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAEnQRZBK7EYVhbGpFeC79HxU=h0OcXU_SSeaMWbp+Qk=rf=14g@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 3, 2019 at 4:05 PM Daniel Baluta <daniel.baluta@gmail.com> wrote:
>
> On Wed, Jul 3, 2019 at 3:03 PM Abel Vesa <abel.vesa@nxp.com> wrote:
> >
> > Add the initial configuration for clocks that need default parent and rate
> > setting. This is based on the vendor tree clock provider parents and rates
> > configuration except this is doing the setup in dts rather then using clock
> > consumer API in a clock provider driver.
> >
> > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
>
> For audio related clock:
> Acked-by: Daniel Baluta <daniel.baluta@nxp.com>

Shawn,

Please ignore this patch. I've added some improvements.

New patch is:
[PATCH v4] arm64: dts: imx8mq: Init rates and parents configs for clocks
