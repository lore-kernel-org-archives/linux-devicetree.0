From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [v2 2/2] fpga: Add support for Lattice iCE40 FPGAs
Date: Tue, 25 Oct 2016 09:48:38 -0700
Message-ID: <CAAtXAHfcfveozw_3kpXz9pA0ZSTeuo9CNs9vRq1Y+BhrNuim7A@mail.gmail.com>
References: <1477283989-21947-1-git-send-email-joel@airwebreathe.org.uk>
 <1477283989-21947-2-git-send-email-joel@airwebreathe.org.uk>
 <alpine.DEB.2.02.1610241615280.14525@linuxheads99> <20161024222805.GA5754@live.com>
 <331cd8da-f69a-b51a-ddbd-f18ee44cac8a@airwebreathe.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <331cd8da-f69a-b51a-ddbd-f18ee44cac8a@airwebreathe.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Holdsworth <joel@airwebreathe.org.uk>
Cc: atull <atull@opensource.altera.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Joel,

On Mon, Oct 24, 2016 at 9:51 PM, Joel Holdsworth
<joel@airwebreathe.org.uk> wrote:

> I think my set_cs() function is ok-ish. It's copied from spi_set_cs() in
> drivers/spi/spi.c . This function is a static internal helper, so I
> copy/pasted the function into the ice40 driver. Given that it's only 4-lines
> of code, it didn't seem too bad - though I'm not exactly sure why
> spi_set_cs() isn't a public API. It seems like quite a common-place thing to
> need to do with certain devices.
>
> However, perhaps the function is internal because the authors of the SPI
> framework foresaw how easy it would be to screw up a shared bus with that
> function. I had to take care to make sure the SPI bus was locked throughout.
>
> Do you agree that it's the right thing to copy the function in? Or do you
> think it would be better to ask for spi_set_cs to be exposed publicly?

I'd poke the SPI maintainers about what their reasoning was to make it
non-public,
and how they'd go about doing what you're trying to do.
I can imagine there might be some SPI controllers where the above
doesn't work well,
because the controller automatically handles the CS line and you don't
get control over it.

Cheers,

Moritz
