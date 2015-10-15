From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH] mtd: document linux-specific partition parser DT binding
Date: Thu, 15 Oct 2015 12:22:24 -0600
Message-ID: <20151015182224.GB17519@obsidianresearch.com>
References: <1444915191-28350-1-git-send-email-linus.walleij@linaro.org>
 <20151015162210.GA4545@localhost>
 <20151015170428.GA9250@obsidianresearch.com>
 <20151015174709.GB108923@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151015174709.GB108923-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Rafa?? Mi??ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 15, 2015 at 10:47:09AM -0700, Brian Norris wrote:
> Hmm, I don't know. I wouldn't expect people should really be using
> cmdlineparts as a production solution, but I'd consider it more of a
> debugging/development option -- if I want to override the DT (which is
> sometimes a bit harder to change) or the on-flash layout (e.g.,
> RedBoot), then I can fiddle with the command line.

We don't have cmdline overrides for very much (if any?) of DT.

The DT is supposed to describe the hardware/boot environment, if
overriding the partition layout is really common, then is the DT
binding really describing the hardware at all?

The partition layout is already very border line to support in DT, it
is really very close to a software configuration which is strongly
discouraged from DT files.

I justify it as the boot loader communicating the partition scheme it
understands to the OS, so the OS can have a hope of setting up the
flash in a way the bootloader understands.

I've never used the cmdline option, so maybe I don't see the use case,
but it seems like a really weird desire to change the partitioning
away from what the bootloader supports.

> Any better nominations for names?

bcrm-part-table-43 ?

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
