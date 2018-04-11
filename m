From: =?UTF-8?B?TXlsw6huZQ==?= Josserand <mylene.josserand@bootlin.com>
Subject: Re: [PATCH v5 07/13] ARM: smp: Add initialization of CNTVOFF
Date: Wed, 11 Apr 2018 09:44:46 +0200
Message-ID: <20180411094446.468c7f99@dell-desktop.home>
References: <20180403061836.3926-1-mylene.josserand@bootlin.com>
        <20180403061836.3926-8-mylene.josserand@bootlin.com>
        <06308f46-ce7c-ddeb-ebca-abd1153138ba@arm.com>
        <20180404155909.148085f7@dell-desktop.home>
        <86vad7qc21.wl-marc.zyngier@arm.com>
        <CAMuHMdUoUVF+WYrPG1Dx515_de_2nhGhLfn9+tJUm5jgs1uz0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUoUVF+WYrPG1Dx515_de_2nhGhLfn9+tJUm5jgs1uz0w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, quentin.schulz@bootlin.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Mon, 9 Apr 2018 10:24:41 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> On Wed, Apr 4, 2018 at 4:30 PM, Marc Zyngier <marc.zyngier@arm.com> wrote:
> > On Wed, 04 Apr 2018 14:59:09 +0100,
> > Mylčne Josserand wrote:  
> 
> [Marc: stuck in ISO-8859-1? ;-]
> 
> >> > It'd be good to take this opportunity to refactor the shmobile code.  
> >>
> >> I can do it in this series but I do not have any shmobile platforms so
> >> I will not be able to test my modifications (only compilation).
> >>
> >> If someone can test it for me (who?), it is okay for me to refactor this
> >> code :)  
> >
> > I guess you could Cc the shmobile folks (Geert Uytterhoeven, Simon
> > Horman), and get them to review/test the changes.  
> 
> Correct. I can test on a remote R-Car E2 ALT board that needs it.

Great, thank you!

I will add you in CC in my next version, then.

Best regards,

Mylène

-- 
Mylène Josserand, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
