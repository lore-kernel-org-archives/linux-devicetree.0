From: =?UTF-8?B?TXlsw6huZQ==?= Josserand <mylene.josserand@bootlin.com>
Subject: Re: [PATCH v5 01/13] ARM: move cputype definitions into another
 file
Date: Tue, 3 Apr 2018 09:27:24 +0200
Message-ID: <20180403092724.607e8e37@dell-desktop.home>
References: <20180403061836.3926-1-mylene.josserand@bootlin.com>
        <20180403061836.3926-2-mylene.josserand@bootlin.com>
        <CAGb2v64GL=1UcYs1tFp-mS07vbHBao82SEhyzUrUHB++2-EKBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGb2v64GL=1UcYs1tFp-mS07vbHBao82SEhyzUrUHB++2-EKBg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@bootlin.com>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, quentin.schulz@bootlin.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Chen-Yu,

Thank you for your review!

On Tue, 3 Apr 2018 14:52:45 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

> On Tue, Apr 3, 2018 at 2:18 PM, Mylène Josserand
> <mylene.josserand@bootlin.com> wrote:
> > To add the support for SMP on sun8i-a83t, we will use some
> > definitions in an assembly file so move definitions into
> > another file to separate C functions and macro defintions.  
> 
> Instead of moving the definitions, you could guard all the C
> stuff in "#ifndef __ASSEMBLY__". AFAIK a few header files do that.

Oh, right. It is better with this check so I will use that in the next
iteration of my series.

Best regards,

Mylène

-- 
Mylène Josserand, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com


> 
> ChenYu
> 
> > Signed-off-by: Mylène Josserand <mylene.josserand@bootlin.com>
> > ---
> >  arch/arm/include/asm/cputype.h     | 94 +-----------------------------------
> >  arch/arm/include/asm/cputype_def.h | 98 ++++++++++++++++++++++++++++++++++++++  
