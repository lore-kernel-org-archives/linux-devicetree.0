From: George Joseph <george.joseph-H+B1fhQ+CpcEVd8bySq3Wg@public.gmane.org>
Subject: Re: [PATCH v2] dts: cubox: Map gpio-keys to gpio3 8
Date: Mon, 23 Mar 2015 10:15:14 -0600
Message-ID: <CAHKv19BRZanUe+czmM-r8+dk0jybLK1niW28DNvBMJVf4MYb9w@mail.gmail.com>
References: <1426542829-16786-1-git-send-email-george.joseph@fairview5.com>
	<20150323133252.GE28410@dragon>
	<20150323151912.GS8656@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150323151912.GS8656-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kern." <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 23, 2015 at 9:19 AM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Mon, Mar 23, 2015 at 09:32:54PM +0800, Shawn Guo wrote:
>> On Mon, Mar 16, 2015 at 03:53:49PM -0600, George Joseph wrote:
>> > The Cubox has a recessed button between the HDMI and RJ-45 connectors
>> > that wasn't mapped in the device tree, so I've mapped it to gpio-keys
>> > BTN_0.
>> >
>> > Signed-off-by: George Joseph <george.joseph-H+B1fhQ+CpcEVd8bySq3Wg@public.gmane.org>
>> > Tested-by: George Joseph <george.joseph-H+B1fhQ+CpcEVd8bySq3Wg@public.gmane.org>
>>
>> Russell,
>>
>> Are you fine with this patch?
>
> No.  It's not submitted against a version of the DT file which has the
> new licensing, so it cocks up that change (and would mean I'd need
> George to agree to the new license.)

Didn't know there was a new license.  Tell me what you need and I'll fix it.

>
> --
> FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
> according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
