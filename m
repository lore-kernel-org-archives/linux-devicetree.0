From: =?UTF-8?B?TXlsw6huZQ==?= Josserand <mylene.josserand@bootlin.com>
Subject: Re: [PATCH v6 11/11] ARM: shmobile: Convert file to use cntvoff
Date: Wed, 18 Apr 2018 12:03:27 +0200
Message-ID: <20180418120327.0f707abf@dell-desktop.home>
References: <20180416215032.5023-1-mylene.josserand@bootlin.com>
        <20180416215032.5023-12-mylene.josserand@bootlin.com>
        <CAMuHMdU9soQuNMC59Y2AQdTmXbWBz-P3EFfZ6NYGKukJVukKgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdU9soQuNMC59Y2AQdTmXbWBz-P3EFfZ6NYGKukJVukKgg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, quentin.schulz@bootlin.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Wed, 18 Apr 2018 11:36:27 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Mylène,
> 
> On Mon, Apr 16, 2018 at 11:50 PM, Mylène Josserand
> <mylene.josserand@bootlin.com> wrote:
> > Now that a common function is available for CNTVOFF's
> > initialization, let's convert shmobile-apmu code to use
> > this function.  
> 
> Thanks for your patch, works fine on Renesas ALT with R-Car E2,
> which suffers from lack of CNTVOFF initialization.

Great to know that it works on this board.

> 
> > Signed-off-by: Mylène Josserand <mylene.josserand@bootlin.com>  
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

Thank you again for testing it :)

Best regards,

-- 
Mylène Josserand, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
