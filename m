From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 2/4] mfd: lubbock_cplds: add lubbock IO board
Date: Fri, 27 Mar 2015 00:47:39 +0100
Message-ID: <20150326234739.GA28519@kroah.com>
References: <20150216130549.GF14545@x1>
 <1170550770.470129293.1424093248596.JavaMail.root@zimbra1-e1.priv.proxad.net>
 <20150216162712.GR14545@x1>
 <87fva5a4i2.fsf@free.fr>
 <20150217074310.GT14545@x1>
 <alpine.LFD.2.11.1502171221300.22104@knanqh.ubzr>
 <20150218080719.GB5781@x1>
 <87a9088tam.fsf@free.fr>
 <20150325140725.GA11499@kroah.com>
 <871tkbxwup.fsf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <871tkbxwup.fsf@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nicolas.pitre@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 26, 2015 at 10:38:54PM +0100, Robert Jarzmik wrote:
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

I have enough review/merge burden to do anything with ARM, sorry.
