From: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Wed, 27 May 2009 20:26:43 +0200
Message-ID: <87r5ya8krg.fsf@macbook.be.48ers.dk>
References: <1243408083.13460.14.camel@debian-nb>
	<fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
	<ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com>
	<20090527150527.GK6805@pengutronix.de>
	<87vdnm8sec.fsf@macbook.be.48ers.dk> <4A1D6901.2090508@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933869AbZE0S1Q@vger.kernel.org>
In-Reply-To: <4A1D6901.2090508@freescale.com> (Scott Wood's message of "Wed\, 27 May 2009 11\:23\:29 -0500")
Sender: linux-kernel-owner@vger.kernel.org
To: Scott Wood <scottwood@freescale.com>
Cc: Robert Schwebel <r.schwebel@pengutronix.de>, devicetree-discuss <devicetree-discuss@ozlabs.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk, Janboe Ye <yuan-bo.ye@motorola.com>, Timur Tabi <timur@freescale.com>, rmk@arm.linux.org.uk
List-Id: devicetree@vger.kernel.org

>>>>> "Scott" == Scott Wood <scottwood@freescale.com> writes:

Hi,

 >> Just bundle the .dtb with the kernel and they'll always be in sync. I
 >> know this isn't really in the spirit of OF, but currently imho the
 >> only realistic solution.

 Scott> That removes the ability to use the device tree to pass information
 Scott> from the bootloader, such as MAC addresses and clock frequencies.  On
 Scott> the u-boot list, you'll find people trying such hacks (which were
 Scott> rightly NACKed) as passing the information in the device's volatile
 Scott> registers (which the Linux driver must then not reset) to deal with
 Scott> ARM Linux's lack of this ability.

No, with the multi-image support U-Boot has full access to the device
tree. E.G. I adjust the flash partition list defined in the .dtb in my
board's ft_board_setup() routine.

-- 
Bye, Peter Korsgaard
