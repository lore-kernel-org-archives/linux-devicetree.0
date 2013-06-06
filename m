From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [Arm-netbook] getting allwinner SoC support upstream (was Re: Uploading linux (3.9.4-1))
Date: Thu, 06 Jun 2013 12:02:06 +0200
Message-ID: <3628961.Gph977QOV0@flatron>
References: <CAPweEDx3mAy40BZrzrKPRbvg7vKMj7KevDQ3m_v4p6Yo50eSGg@mail.gmail.com> <1733666.lHUBcfUXq9@flatron> <20130606112723.71ddd70c@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130606112723.71ddd70c@skate>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss <devicetree-discuss@ozlabs.org>, Stephen Warren <swarren@wwwdotorg.org>, "luke.leighton" <luke.leighton@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, debian-arm@lists.debian.org, "jonsmirl@gmail.com" <jonsmirl@gmail.com>, Linux on small ARM machines <arm-netbook@lists.phcomp.co.uk>, debian-kernel@lists.debian.org, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Hi Thomas,

On Thursday 06 of June 2013 11:27:23 Thomas Petazzoni wrote:
> Dear Tomasz Figa,
> 
> On Thu, 06 Jun 2013 02:01:14 +0200, Tomasz Figa wrote:
> > I don't see any other solution here than moving all the Allwinner
> > code to DT (as it has been suggested in this thread several times
> > already), as this is the only hardware description method supported
> > by ARM Linux.
> 
> Have you noticed that it is already the case in mainline? My colleague
> Maxime Ripard (Cc'ed) is the maintainer of the mainline Allwinner sunxi
> effort. It already supports a number of boards, has a pinctrl driver, a
> GPIO driver, serial port is working, network is working, I2C is
> working.
> 
> All in mainline, completely Device Tree based.
> 
> So isn't this entire discussion completely moot? The mainline support
> for sunxi has already started since 6 months or so, and has been Device
> Tree based from day one.

Sure, I've been observing the development of sunxi support since it 
started.

This is the reason why any remaining Allwinner drivers must be converted 
to use DT instead of this proprietary stuff as well, if they want to 
upstream any of them.

Best regards,
Tomasz
