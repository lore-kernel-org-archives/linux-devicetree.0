From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v5 2/6] ARM: s3c64xx: Skip legacy EINT setup if pinctrl-s3c64xx driver is present
Date: Wed, 17 Apr 2013 00:31:50 +0200
Message-ID: <4730257.2Cvjq41NtX@flatron>
References: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com> <1366060483-20342-3-git-send-email-tomasz.figa@gmail.com> <20130416162642.GN26958@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <20130416162642.GN26958@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 16 of April 2013 17:26:43 Mark Brown wrote:
> On Mon, Apr 15, 2013 at 11:14:39PM +0200, Tomasz Figa wrote:
> > +	* This gpio driver includes support for device tree support and
> > there
> > +	* are platforms using it. In order to maintain compatibility with
> > those +	* platforms, and to allow non-dt Exynos4210 platforms to 
use
> > this +	* gpiolib support, a check is added to find out if there 
is a
> > active
> Cut'n'paste error here.

<blushed>

Thanks for catching this.

Best regards,
Tomasz
