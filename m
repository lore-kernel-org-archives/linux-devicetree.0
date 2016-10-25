From: Joel Holdsworth <joel@airwebreathe.org.uk>
Subject: Re: [v2 2/2] fpga: Add support for Lattice iCE40 FPGAs
Date: Mon, 24 Oct 2016 22:51:48 -0600
Message-ID: <331cd8da-f69a-b51a-ddbd-f18ee44cac8a@airwebreathe.org.uk>
References: <1477283989-21947-1-git-send-email-joel@airwebreathe.org.uk>
 <1477283989-21947-2-git-send-email-joel@airwebreathe.org.uk>
 <alpine.DEB.2.02.1610241615280.14525@linuxheads99>
 <20161024222805.GA5754@live.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161024222805.GA5754@live.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>, atull <atull@opensource.altera.com>
Cc: ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 10/24/2016 04:28 PM, Moritz Fischer wrote:
> Hi Joel,
>
> Ha, finally someone beat me to submitting my driver,
> I had an ugly hack to bitbang the SPI since I couldn't figure
> out a good way to assert the creset after the CS.
>
> Thanks!
>

Hi Moritz - yeah I figured someone might have a driver in the works.

I think my set_cs() function is ok-ish. It's copied from spi_set_cs() in 
drivers/spi/spi.c . This function is a static internal helper, so I 
copy/pasted the function into the ice40 driver. Given that it's only 
4-lines of code, it didn't seem too bad - though I'm not exactly sure 
why spi_set_cs() isn't a public API. It seems like quite a common-place 
thing to need to do with certain devices.

However, perhaps the function is internal because the authors of the SPI 
framework foresaw how easy it would be to screw up a shared bus with 
that function. I had to take care to make sure the SPI bus was locked 
throughout.

Do you agree that it's the right thing to copy the function in? Or do 
you think it would be better to ask for spi_set_cs to be exposed publicly?

Best Regards
Joel
