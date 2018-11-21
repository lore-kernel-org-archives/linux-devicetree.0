From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Add and enable
 CAN,FD device nodes
Date: Wed, 21 Nov 2018 11:20:46 +0100
Message-ID: <20181121102046.vbimumaycuj225op@verge.net.au>
References: <20181118173424.4807-1-marek.vasut+renesas@gmail.com>
 <20181118230313.GB2553@kunai>
 <63e27a31-d599-4672-87b9-48b0f542313d@gmail.com>
 <20181119105508.GC932@kunai>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181119105508.GC932@kunai>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Marc Kleine-Budde <mkl@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 19, 2018 at 11:55:08AM +0100, Wolfram Sang wrote:
> 
> > > Same here, what was tested?
> > 
> > I connected the CN10 to Peak CANFD, brought both interfaces up at
> > 125kBd/250kBd for FD
> > $ ip link set canX up type can bitrate 125000 dbitrate 250000 fd on
> > 
> > And ran on either side:
> > $ cangen -m canX
> > and
> > $ candump -t d -dex canX
> > This should give a good mix of CAN messages.
> 
> Perfect, thanks!

Thanks, applied for v4.21.
