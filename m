From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 2/2] imx53.dtsi : Add DMA configuration for UART
Date: Sat, 6 Aug 2016 10:59:53 -0300
Message-ID: <CAOMZO5DAAU0jUpd2xwgTwL9Y1Bhido35fxvhQ9HGZRXbRnB2Gg@mail.gmail.com>
References: <CAOMZO5BoRsrHv-+5c9bAXO2NCya8sPqmmpy9DOfav6NvQ+VMLQ@mail.gmail.com>
 <1470306157-11181-1-git-send-email-fabien.lahoudere@collabora.co.uk>
 <1470306157-11181-2-git-send-email-fabien.lahoudere@collabora.co.uk>
 <1470307750.712399023@f361.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1470307750.712399023@f361.i.mail.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 4, 2016 at 7:49 AM, Alexander Shiyan <shc_work@mail.ru> wrote:

> Hello.
>
> UART SDMA has been tested by me for i.MX51.
> So, on my opinion, In the first part of the patch, we just need to remove is_imx6q_uart()
> check on and always let the devicetree decide about DMA usage.

Yes, agreed.
