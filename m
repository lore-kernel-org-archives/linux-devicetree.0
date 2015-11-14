From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] mtd: create a partition type device tree binding
Date: Sat, 14 Nov 2015 11:46:59 +0100
Message-ID: <CACRpkdakyae95f_Lc-R7Uf7wndj5hyfCqqHziwmZjwm-uNkGAg@mail.gmail.com>
References: <1446123152-22666-1-git-send-email-linus.walleij@linaro.org>
	<20151029162908.GA13275@localhost>
	<CACRpkdYS5Jf8UC2K0bNdEQZDjTeZZx44Uu-kkof+9E=4Ny0oDg@mail.gmail.com>
	<20151030175145.GF13239@google.com>
	<CAL_JsqL2F3p7qBPbOiGytVyzF_aNLWbrCT0mAX1WZo6SxE3JoA@mail.gmail.com>
	<20151113220039.GA74382@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151113220039.GA74382-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 13, 2015 at 11:00 PM, Brian Norris
<computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

(...)
>  (2) we should define a comptible property for the hard-coded
>  partitioning case (e.g., compatible = "partitions")
(...)
> If we went with option (2), then ofpart.c could just check only for
> 'compatible = "partitions"' (or similar), and if not found bail out.

So this "hard-coded partitioning case" the case is where all partitions
are defined in the device tree as described in
Documentation/devicetree/bindings/mtd/partition.txt ?

Or is it a way to indicate that this array
static const char * const part_probe_types_def[] = {
        "cmdlinepart", "RedBoot", "ofpart", "ofoldpart", NULL };
in physmap_of.c should be used?

Sorry if I don't fully follow, I'm a bit stupid when it comes to the MTD
helicopter  view of the situation.... :(

> I think option (2) makes more sense. But it would require an update to
> the binding and code for 4.4, since [1] was only introduced during this
> release cycle.

Does that mean all old device trees that specify no compatible
string all of a sudden stop working? We can't break the DT ABI, so I
guess not.

A bit confused here, I can't really see what I should do with the patch...

Yours,
Linus Walleij
