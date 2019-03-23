From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ARCH: Use the correct style for SPDX License Identifier
Date: Sat, 23 Mar 2019 21:59:37 +0100
Message-ID: <20190323205937.wkrqmjfk4jycejdo@pengutronix.de>
References: <20190323132808.GA10547@nishad>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190323132808.GA10547@nishad>
Sender: linux-kernel-owner@vger.kernel.org
To: Nishad Kamdar <nishadkamdar@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello,

On Sat, Mar 23, 2019 at 06:58:14PM +0530, Nishad Kamdar wrote:
> This patch corrects the SPDX License Identifier style
> in the Hardware Architecture subsystem.
> 
> Changes made by using a script provided by Joe Perches here:
> https://lkml.org/lkml/2019/2/7/46
> and making some manual changes.

Adding a note here that for C header files
Documentation/process/license-rules.rst mandates C-like comments
(opposed to C source files where C++ style should be used) would be a
good idea I think.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
