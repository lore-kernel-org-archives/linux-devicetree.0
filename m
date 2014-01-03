From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: DT include files (was: [GIT PULL 2/2] ARM: imx: device tree
 changes for 3.14)
Date: Fri, 3 Jan 2014 11:04:57 +0800
Message-ID: <20140103030455.GB25079@S2101-09.ap.freescale.net>
References: <20131231054427.GA22383@S2101-09.ap.freescale.net>
 <20140102202108.GF19720@quad.lixom.net>
 <20140103023211.GA25079@S2101-09.ap.freescale.net>
 <CAOesGMheei8YgzfRp9pmQ0rT9zhJ2_hF56j5Y+jLSy5TadPZ-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMheei8YgzfRp9pmQ0rT9zhJ2_hF56j5Y+jLSy5TadPZ-g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 02, 2014 at 06:41:30PM -0800, Olof Johansson wrote:
> Ok, then it's probably just the location of the header files that
> should be adjusted. Other subsystems have placed them under
> include/dt-bindings/<subsystem>, so that's likely a better place for
> these as well, don't you think?

I had a little discussion with DT people when the headers were firstly
created.  These pinctrl headers are a little different from the headers
in include/dt-bindings/<subsystem>.  The latter are used by both kernel
and device tree sources, while the pinctrl headers are used by device
tree sources only, so I chose to put them just in the same folder as
dts files.  And DT people are fine with my take.

Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
