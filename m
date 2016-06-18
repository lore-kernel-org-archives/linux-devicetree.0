From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 1/2] media: Driver for Toshiba et8ek8 5MP sensor
Date: Sat, 18 Jun 2016 18:04:23 +0200
Message-ID: <20160618160423.GB16792@amd>
References: <1465659593-16858-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1465659593-16858-2-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <20160618152259.GC8392@amd>
 <201606181737.33116@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201606181737.33116@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, sakari.ailus@iki.fi, sre@kernel.org, linux-media@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mchehab@osg.samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi!

> > > +	.reglist = {
> > > +		{ .ptr = &mode1_poweron_mode2_16vga_2592x1968_12_07fps },
> > > +		{ .ptr = &mode1_16vga_2592x1968_13_12fps_dpcm10_8 },
> > > +		{ .ptr = &mode3_4vga_1296x984_29_99fps_dpcm10_8 },
> > > +		{ .ptr = &mode4_svga_864x656_29_88fps },
> > > +		{ .ptr = &mode5_vga_648x492_29_93fps },
> > > +		{ .ptr = &mode2_16vga_2592x1968_3_99fps },
> > > +		{ .ptr = &mode_648x492_5fps },
> > > +		{ .ptr = &mode3_4vga_1296x984_5fps },
> > > +		{ .ptr = &mode_4vga_1296x984_25fps_dpcm10_8 },
> > > +		{ .ptr = 0 }
> > > +	}
> > > +};
> > 
> > I'd say .ptr = NULL.
> > 
> 
> Anyway, this code was generated from configuration ini files and perl 
> script available from: https://gitorious.org/omap3camera/camera-firmware
> 
> Originally in Maemo above C structure is compiled into binary file and 
> via request_firmware() loaded from userspace to kernel driver.
> 
> For me this sounds like a big overkill, so I included above reglist code 
> direcly into et8ek8 kernel driver to avoid request_firmware() and 
> separate userspace storage...

Yep, that makes sense, thanks for explanation. I guess that means that
we should put a comment on top of the file explaining what is going
on.

Best regards,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
