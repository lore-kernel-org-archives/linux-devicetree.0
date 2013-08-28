From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: new platform for Energy Micro's EFM32 Cortex-M3 SoCs
Date: Wed, 28 Aug 2013 12:50:54 -0700
Message-ID: <20130828195054.GJ8607@quad.lixom.net>
References: <1376552964-16296-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20130815084259.GG30496@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20130815084259.GG30496@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

Sorry for the delay in responding to this. See below.

On Thu, Aug 15, 2013 at 10:42:59AM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
> =

> I forgot to mention that this patch depends on the following patches:
> =

>  - ARM: ARMv7-M: implement restart routine common to all v7-M machines
>    sent with Message-Id: 1376494305-24270-1-git-send-email-u.kleine-koeni=
g@pengutronix.de; and

Seems like you addressed Russell's comments here, so hopefully he's ok with=
 us
picking it up directly as a prereq.

>  - clk: new driver for efm32 SoC
>    sent with Message-Id: 1376510693-12491-1-git-send-email-u.kleine-koeni=
g@pengutronix.de

This can be applied directly by Mike, since the code doesn't depend on each
other (just won't be fully functional until both lands).

> So in the unlikely case you are already happy with this patch, it needs
> some coordination to go in.

I'll have a few comments, should hopefully be quick to respin.


-Olof
