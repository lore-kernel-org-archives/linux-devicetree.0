From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 11/12] ARM: dts: add support for Vybrid running on
 Cortex-M4
Date: Wed, 17 Dec 2014 11:57:06 +0100
Message-ID: <2673866.7fjSqeaHyh@wuerfel>
References: <1417565531-4507-1-git-send-email-stefan@agner.ch>
 <2994970.DCfUQgtmcD@wuerfel> <b090cb361e81d2f1be5d21d1a07e9340@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <b090cb361e81d2f1be5d21d1a07e9340@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Agner <stefan@agner.ch>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, jason@lakedaemon.net, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, kernel@pengutronix.de, u.kleine-koenig@pengutronix.de, olof@lixom.net, galak@codeaurora.org, tglx@linutronix.de, shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tuesday 16 December 2014 23:19:08 Stefan Agner wrote:
> On 2014-12-03 12:03, Arnd Bergmann wrote:
> > On Wednesday 03 December 2014 01:12:10 Stefan Agner wrote:

> Just started looking in that a bit deeper and some question arose:
> Afaik, earlycon need to be supported by the uart driver. The fsl_lpuart,
> which is used for Vybrid's uart, does not support earlycon yet. However,
> earlyprink already works (see ./arch/arm/include/debug/vf.S). I
> understand that earlycon has the advantage of being able to be used on
> multiplatform. But earlyprintk is working really early (e.g. before
> locating the FDT), and it proved helpful for me when I started working
> on that Cortex-M4 stuff. Should earlycon replace earlyprintk completely?

earlyprintk will stay around for debugging early boot problems, but
with working earlycon support, there should no longer be a reason to
enable it by default.

> Maybe, on Vybrid, since it would be a good platform for automated !MMU
> testing, it would be nice to have earlycon which can be enabled in any
> case and would provide output even something blows up quite early... But
> I guess I would add earlycon support as part of a new patchset and just
> drop earlyprintk here for now.

Yes, I think that would be good.

> > 64 hash table entries sounds extremely small, doesn't that impact
> > performance? If you have 50MB of actual RAM available, I don't think
> > you need that.
> 
> Agreed. I copied that from EFM32 which is under much more memory
> pressure...

Ok.
	
	Arnd
