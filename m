From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH v3] Add TI CDCE925 I2C controlled clock synthesizer
 driver
Date: Tue, 02 Jun 2015 11:07:14 +0200
Message-ID: <1433236034.2361.90.camel@x220>
References: <1433153623-29205-1-git-send-email-mike.looijmans@topic.nl>
	 <1433231444.2361.75.camel@x220> <556D6CB4.30900@topic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <556D6CB4.30900@topic.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-clk@vger.kernel.org, sboyd@codeaurora.org, mturquette@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2015-06-02 at 10:43 +0200, Mike Looijmans wrote:
> Out of curiousity, I did try a compile on the x86 host, but couldn't select 
> the driver because it depends on CONFIG_OF, so I just compiled if for the ARM 
> target to verify that it still compiles in kernel 4.1. How did you manage to 
> compile the driver on the x86?

With this hack:
    make drivers/clk/clk-cdce925.o

(I thought this is documented somewhere, but I can't actually find the
documentation. I guess it's just a feature of make.)

It bypasses much of the build infrastructure, but comes in handy when
you quickly want to know whether something can actually be build. Eg,
you see some code and wonder "how can this build?"

(Sometimes this requires setting CFLAGS on the make command line, or
adding things like CONFIG_WHATEVER=y to the command line to get sane
results, for some value of sane. By that time I usually give up.)

Downside is, of course, that you can build things outside of the
supported configurations. So it's best to state clearly that one built
something using this hack. I sinned against that rule, but apparently
got lucky, because this driver is not 32 bits only!

Thanks,


Paul Bolle
