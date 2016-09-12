From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCHv3 0/3] Devicetree bindings for Ion
Date: Mon, 12 Sep 2016 12:22:39 +0200
Message-ID: <20160912102239.GA5034@kroah.com>
References: <1472601869-19469-1-git-send-email-labbott@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1472601869-19469-1-git-send-email-labbott@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laura Abbott <labbott@redhat.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, Andrew Andrianov <andrew@ncrmnt.org>, arve@android.com, Riley Andrews <riandrews@android.com>, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Tom Gall <tom.gall@linaro.org>, romlem@google.com, linux-kernel@vger.kernel.org, Colin Cross <ccross@google.com>, Bryan Huntsman <bryanh@codeaurora.org>, John Stultz <john.stultz@linaro.org>, Chen Feng <puck.chen@hisilicon.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 30, 2016 at 05:04:26PM -0700, Laura Abbott wrote:
> Hi,
> 
> This is a long overdue resend and slight update from the last version[1] of
> Ion devicetree bindings.
> 
> The goal here is to keep the Ion bindings minimalist. I experimented with
> dropping all but a dummy devicetree node and just matching on the machine
> name in the platform file. This ends up being a nightmare for the DMA (i.e. CMA)
> heap type. That heap requires a device structure to do its allocation and
> setting up a device structure properly isn't pretty. I have other ideas for
> working with that heap if this gets NAKed.
> 
> I've thought about the idea of a devicetree overlay for specifying more
> platform configuration but that a) requires Android actually load the overlay
> at the right time in the framework and b) opens up an entirely new can of
> worms.
> 
> In conclusion, if we assume that Ion platform support is something anyone
> actually wants, this is still the least bad and intrusive idea I've come up
> with. There exists hisilicon Ion code but it came in without being fully acked.
> I've converted it over as an example of how it might look.
> 
> As always, feedback appreciated.

Give a total lack of feeback, I've now applied these patches :)

thanks,

greg k-h
