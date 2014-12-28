From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/3] TTY: add support for "tty slave" devices.
Date: Sun, 28 Dec 2014 15:20:10 +0100
Message-ID: <20141228142010.GA3922@amd>
References: <20141211214801.4127.93914.stgit@notabene.brown>
 <20141211215943.4127.24792.stgit@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141211215943.4127.24792.stgit@notabene.brown>
Sender: linux-kernel-owner@vger.kernel.org
To: NeilBrown <neilb@suse.de>
Cc: Grant Likely <grant.likely@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi!

> index 8c4fd0332028..b59501ee2f21 100644
> --- a/Documentation/devicetree/bindings/serial/of-serial.txt
> +++ b/Documentation/devicetree/bindings/serial/of-serial.txt
> @@ -39,6 +39,10 @@ Optional properties:
>    driver is allowed to detect support for the capability even without this
>    property.
>  
> +Optional child node:
> +- a platform device listed as a child node will be probed and
> +  powered-on whenever the tty is in use (open).
> +
>  Example:
>  
>  	uart@80230000 {

Hmm. Other devices may want it the other way around: probe the device
behind the uart, make it control power and open/close of the uart, and
hide the /dev/ttyXX from userspace...
								Pavel
								
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
