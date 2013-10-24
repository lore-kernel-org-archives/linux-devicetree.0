From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
Subject: Re: [PATCHv6][ 3/7] ARM: imx{25,27} DT: Permit the selection of the
 imxfb framebuffer driver.
Date: Thu, 24 Oct 2013 10:20:11 +0200
Message-ID: <20131024102011.610e5d8b@e6520eb>
References: <1382601665-6830-1-git-send-email-denis@eukrea.com>
 <1382601665-6830-3-git-send-email-denis@eukrea.com>
 <20131024081531.GA13614@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20131024081531.GA13614@S2101-09.ap.freescale.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, Denis Carikli <denis@eukrea.com>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Shawn,

Le Thu, 24 Oct 2013 16:15:34 +0800,
Shawn Guo <shawn.guo@linaro.org> a =E9crit :
> >  config FB_IMX
> >  	tristate "Freescale i.MX1/21/25/27 LCD support"
> > -	depends on FB && IMX_HAVE_PLATFORM_IMX_FB
> > +	depends on FB && HAVE_IMX_FB
> =

> Or simply have it depend on ARCH_MXC?
> =

> 	depends on FB && ARCH_MXC
> =

but not all MXC have IMX_FB : isn't that a problem ?

Eric
