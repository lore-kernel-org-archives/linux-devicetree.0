From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/4] of/platform: return error on
 of_platform_device_create_pdata failure
Date: Wed, 14 May 2014 10:43:46 +0300
Message-ID: <1400053426.8431.13.camel@iivanov-dev>
References: <1399499298-8830-1-git-send-email-robherring2@gmail.com>
	 <1399499298-8830-3-git-send-email-robherring2@gmail.com>
	 <20140513175603.GA27173@quad.lixom.net> <53728173.7050508@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53728173.7050508-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2014-05-13 at 13:32 -0700, Frank Rowand wrote:
> On 5/13/2014 10:56 AM, Olof Johansson wrote:
> > On Wed, May 07, 2014 at 04:48:16PM -0500, Rob Herring wrote:
> >> From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >>
> >> of_platform_populate does not return an error if creating the platform
> >> device fails. This means almost any error from driver core cannot be
> >> detected by the caller. Fix this.
> >>
> >> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> ---
> >>  drivers/of/platform.c | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> >> index 404d1da..622aeb3 100644
> >> --- a/drivers/of/platform.c
> >> +++ b/drivers/of/platform.c
> >> @@ -391,7 +391,9 @@ static int of_platform_bus_create(struct device_node *bus,
> >>  	}
> >>  
> >>  	dev = of_platform_device_create_pdata(bus, bus_id, platform_data, parent);
> >> -	if (!dev || !of_match_node(matches, bus))
> >> +	if (!dev)
> >> +		return -ENODEV;
> >> +	if (!of_match_node(matches, bus))
> >>  		return 0;
> >>  
> >>  	for_each_child_of_node(bus, child) {
> > 
> > This patch caused every single MMC driver to break on OF platforms, as far
> > as I can tell.  Reverting it on last night's -next seems to resolve it.
> > 
> > The problem seems to be that of_platform_populate() will bail on the
> > first device that fails this.
> > 
> > How did you test this code, Frank? On what platform? Practically all my
> > targets here failed to mount rootfs from eMMC or SD card...
> 
> I tested on a dragonboard, but without a working sdhci driver.  Thus I would not
> have hit the error.

Same here.

Regards,
Ivan

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
