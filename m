From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH v4 2/2] soc: Add driver for Freescale Vybrid Platform
Date: Wed, 27 May 2015 18:46:47 +0200
Message-ID: <1432745207.27695.282.camel@x220>
References: <cover.1432637313.git.maitysanchayan@gmail.com>
	 <7df753efff77a96da285f0571f1316512787e83c.1432637313.git.maitysanchayan@gmail.com>
	 <1432711910.27695.223.camel@x220>
	 <20150527130727.GA3374@Sanchayan-Arch.toradex.int>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150527130727.GA3374@Sanchayan-Arch.toradex.int>
Sender: linux-kernel-owner@vger.kernel.org
To: maitysanchayan@gmail.com
Cc: arnd@arndb.de, shawn.guo@linaro.org, kernel@pengutronix.de, stefan@agner.ch, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 2015-05-27 at 18:37 +0530, maitysanchayan@gmail.com wrote:
> > > +module_platform_driver(vf610_soc_driver);
> > 
> > (The series starting at https://lkml.org/lkml/2015/5/10/131 would allow
> > to use builtin_platform_driver() for built-in only code.)
> 
> Thanks for bringing this to my attention. I am subscribed to the mailing
> list however this skipped me.

> However that series has not been merged yet, so I can't use builtin_*
> yet?

Correct.

If that series get merged, which is not certain at all, you might
consider changing this. Probably no one will notice if you don't.


Paul Bolle
