From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx6q: add support for the Utilite Pro
Date: Mon, 23 May 2016 20:20:35 -0300
Message-ID: <CAOMZO5CMjaxxR-_i9O1U_r_LxW0L61Rg8uySaThVPD2w2xgafg@mail.gmail.com>
References: <1463957258-4893-1-git-send-email-christopher.spinrath@rwth-aachen.de>
 <c4ab0387041f42ada68296141befe332@rwthex-s1-b.rwth-ad.de>
 <20abc2f6769b4369ba87ec27274a090e@rwthex-s2-a.rwth-ad.de>
 <644530ff6bb04b5898dc33604dc7a93a@rwthex-s1-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <644530ff6bb04b5898dc33604dc7a93a@rwthex-s1-b.rwth-ad.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Christopher Spinrath <christopher.spinrath@rwth-aachen.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Christopher,

On Mon, May 23, 2016 at 8:08 PM, Christopher Spinrath
<christopher.spinrath@rwth-aachen.de> wrote:

> I would like to but I'm not sure if I'm allowed to. As I stated in the
> license header some nodes are copied (and cleaned up) from the vendor
> kernel/devicetree. They are licensed GPL-v2 only. So I don't know, can I
> add the X11 license?

Maybe you could contact the original author anc check?

>> Better to avoid 0x80000000. Replace it with the real iomux value
>> instead so that you don't need to rely on the bootloader
>> configuration.
> hmm, I don't know how to determine this value. The device documentation
> I have does not say anything about it and the vendor kernel uses
> 0x80000000...

The default value of register IOMUXC_SW_PAD_CTL_PAD_ENET_TX_DATA1 is
0x1b0b0, so you can use this value.

Another thing I forgot to comment: instead of putting this pin inside
the hog group you could put it inside the gpio-keys node.
