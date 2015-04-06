From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH v3 1/2] pinctrl: Add driver for Alphascale asm9260
 pinctrl
Date: Mon, 06 Apr 2015 11:41:05 +0200
Message-ID: <1428313265.634.112.camel@x220>
References: <1427476243.2334.12.camel@x220>
		 <1428215185-14190-1-git-send-email-linux@rempel-privat.de>
		 <1428215185-14190-2-git-send-email-linux@rempel-privat.de>
	 <1428306169.634.51.camel@x220> <55224604.8070009@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <55224604.8070009@rempel-privat.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 2015-04-06 at 10:38 +0200, Oleksij Rempel wrote:
> If you won't to say: "You have a mismatch between header and
> MODULE_LICENSE, please make sure it will match."
> You saying some thing like this: "I was right last time. Make module
> License like I saying."

No, that's not what I wrote.

> I'm confuse, what is your actual point? Do you trying to prove some thing?

My point is that there's a mismatch between the license described in the
comment at the top of this file and the ident used in the
MODULE_LICENSE() macro. In my comments on v2 I wrote:
    By the way, you probably want to use "GPL v2" as the license ident
    [...].

In this v3 I noticed the same mismatch (which was not surprising because
you already stated that "GPL" actually did match what's stated at the
comment in the top of this file). Therefor I wrote:
    So only "GPL v2" matches what's found in the comment at top of this
    file.

There now seem to be a few options:
- change either the comment at the top of this file or the license ident
used in MODULE_LICENSE() to make them actually match;
- show that I misread the comment at top of this file;
- or show that my reading of module.h is incorrect.

(Another option would be a patch that somehow merges the "GPL" and "GPL
v2" license idents. That patch would put an end to discussions like the
one we're having here. I'm _not_ volunteering to submit it.)

Thanks,


Paul Bolle

