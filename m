From: Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH v1] ARM: dts: nitrogen6x: add USB host 1 support
Date: Wed, 24 Feb 2016 09:33:59 +0000
Message-ID: <HE1PR04MB14503F844CF2C8E898DB03DE8BA50@HE1PR04MB1450.eurprd04.prod.outlook.com>
References: <1456171421-10044-1-git-send-email-ps.report@gmx.net>
 <56CB7438.5030102@boundarydevices.com>
 <CAOMZO5BoPtUfL6PVzqLkZvwvn4=zNTTYgR1u4TOe4268cu+WLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5BoPtUfL6PVzqLkZvwvn4=zNTTYgR1u4TOe4268cu+WLg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>, Troy Kisky <troy.kisky@boundarydevices.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Eric Nelson <eric.nelson@boundarydevices.com>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Peter Seiderer <ps.report@gmx.net>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

 
> 
> On Mon, Feb 22, 2016 at 5:48 PM, Troy Kisky
> <troy.kisky@boundarydevices.com> wrote:
> 
> > I'm ok with this patch, but a more correct fix would be to add a
> > reset-gpios to usbh1 instead, as this is a reset pin for a usb hub. So
> > if nobody else has a problem,
> 
> The problem is that such solution does not exist today.
> 
> Peter Chen has been working on it lately.

Yes, I will cc you when I send new patch.

Peter
