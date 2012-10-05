From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 05/14] media: add a V4L2 OF parser
Date: Fri, 5 Oct 2012 19:45:14 +0100
Message-ID: <20121005184514.GF4360@opensource.wolfsonmicro.com>
References: <1348754853-28619-1-git-send-email-g.liakhovetski@gmx.de>
 <Pine.LNX.4.64.1210021142210.15778@axis700.grange>
 <506ABE40.9070504@samsung.com>
 <201210051241.52205.hverkuil@xs4all.nl>
 <Pine.LNX.4.64.1210051250210.13761@axis700.grange>
 <506F2763.6050808@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <506F2763.6050808@gmail.com>
Sender: linux-media-owner@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Hans Verkuil <hverkuil@xs4all.nl>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-media@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, linux-sh@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Arnd Bergmann <arnd@arndb.de>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 05, 2012 at 08:30:59PM +0200, Sylwester Nawrocki wrote:

> The deferred probing was introduced in Linux to resolve resource 
> inter-dependencies in case of FDT based booting AFAIK.

It's completely unrelated to FDT, it's a general issue.  There's no sane
way to use hacks like link ordering to resolve boot time dependencies -
start getting things like regulators connected to I2C or SPI controllers
which may also use GPIOs for some signals and may be parents for other
regulators and mapping out the dependency graph becomes unreasonably
complicated.  Deferred probing is designed to solve this problem by
working things out dynamically at runtime.
