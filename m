From: Ryan Harkin <ryan.harkin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 1/3] amba-clcd: Add Device Tree support to amba-clcd
 driver
Date: Mon, 24 Sep 2012 08:07:54 +0100
Message-ID: <CAD0U-hKviTANE+88vh_UUkXijJOxpM3gXmgQW4oOegMnav9Zqg@mail.gmail.com>
References: <1348070666-9153-1-git-send-email-ryan.harkin@linaro.org>
 <1348070666-9153-2-git-send-email-ryan.harkin@linaro.org>
 <20120921114345.GE24458@pengutronix.de>
 <20120921121903.GE15609@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120921121903.GE15609-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org, tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, liviu.dudau-5wv7dgnIgG8@public.gmane.org, shiraz.hashim-qxv4g6HH51o@public.gmane.org, viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Thanks for all the comments.

Pawel, good point about the framebuffer.  Fixing this will also
address one of Russell's concerns.  I don't know how to use a phandle,
so I have some reading to do.

Russell, all good points and exactly the type of feedback I needed.
I'll re-work your suggestions into my code and re-post a V2 of the
patches.

Sascha, I see your point.  I'll work on the feedback above first
before getting to looking at how to handle the thread you linked to.

Thanks all,

Regards,
Ryan.
