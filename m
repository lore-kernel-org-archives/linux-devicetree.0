From: Joshua Clayton <stillcompiling@gmail.com>
Subject: Re: [PATCH 1/2] of: add vendor prefix for UniWest
Date: Mon, 01 Feb 2016 03:54:53 -0800
Message-ID: <1558714.BL5qCUPStK@diplodocus>
References: <b11bf2208fe30b96c4d82e634e8abe04343754de.1452717014.git.stillcompiling@gmail.com> <20160201112153.GD10671@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160201112153.GD10671@tiger>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Thanks, Shawn,
On Monday, February 01, 2016 07:21:53 PM Shawn Guo wrote:
> On Wed, Jan 13, 2016 at 12:45:11PM -0800, Joshua Clayton wrote:
> > United Western Technologies Corp, known primarily as UniWest,
> > is a manufacturer of eddy current and ultrasonic testing equipment.
> > 
> > Signed-off-by: Joshua Clayton <stillcompiling@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > index 55df1d4..7dabdee 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > @@ -230,6 +230,7 @@ toradex	Toradex AG
> >  toshiba	Toshiba Corporation
> >  toumaz	Toumaz
> >  tplink	TP-LINK Technologies Co., Ltd.
> > +uniwest	United Western Technologies Corp (UniWest)
> 
> As far as I know, it should be added in alphabetical order.
There is a V2 of this patch, which is in alphabetical order and got an ack from Rob Herring
http://lkml.iu.edu/hypermail/linux/kernel/1601.1/05563.html

I have not sent a v2 of the dts, (patch 2/2) as it didn't get any review comments. Should I resend it?

> 
> Shawn
> 
> >  tronfy	Tronfy
> >  truly	Truly Semiconductors Limited
> >  upisemi	uPI Semiconductor Corp.
> 
