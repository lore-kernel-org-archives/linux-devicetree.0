From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 1/3] irqchip: vf610-mscm: add support for MSCM interrupt
 router
Date: Tue, 16 Dec 2014 14:04:42 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1412161404010.17382@nanos>
References: <1418594998-2361-1-git-send-email-stefan@agner.ch>
 <1418594998-2361-2-git-send-email-stefan@agner.ch> <548EB0FD.3030206@arm.com>
 <41a603b345dbee4f2507e80ea0f8bb96@agner.ch> <5490094D.6090300@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5490094D.6090300@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <Mark.Rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "arnd@arndb.de" <arnd@arndb.de>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stefan Agner <stefan@agner.ch>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 16 Dec 2014, Marc Zyngier wrote:
> On 15/12/14 20:58, Stefan Agner wrote:
> > The same line adjustment will break the 80 character border... But I
> > agree, it's ugly the way it is now. Will put them in the same line.
> 
> Never mind what checkpatch says. Readability trumps it anytime.

If you want to obey checkpatch then move that stuff into a seperate
inline function.

Thanks,

	tglx
