From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 2/4] mfd: lubbock_cplds: add lubbock IO board
Date: Sat, 28 Mar 2015 03:35:15 +0100
Message-ID: <201503280335.16280.arnd@arndb.de>
References: <20150216130549.GF14545@x1> <20150325140725.GA11499@kroah.com> <871tkbxwup.fsf@free.fr>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <871tkbxwup.fsf@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee.jones@linaro.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thursday 26 March 2015, Robert Jarzmik wrote:
> 
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> 
> > On Fri, Feb 20, 2015 at 05:02:57PM +0100, Robert Jarzmik wrote:
> >> If there is no solution, I'll fallback through arch/arm/plat-pxa, not very nice,
> >> but it has to land somewhere, I don't want lubbock to remain broken.
> >
> > drivers/platform/arm ?
> Most certainly.
> 
> I'll submit that to drivers/platform/arm/pxa, and maintain that pxa tree. As for
> drivers/platform/arm, do you want also maintainers to step up, or will you take
> the review/merge burden ?
> 

I'd much prefer not to add drivers/platform/arm, which would make it too easy
to add random stuff there. What is the problem with leaving it in mach-pxa?

	Arnd
