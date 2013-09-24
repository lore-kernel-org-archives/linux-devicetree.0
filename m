From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 2/5] mfd: arizona: Add device tree binding for
	max_channels_clocked
Date: Tue, 24 Sep 2013 10:58:03 +0100
Message-ID: <20130924095803.GO3635@opensource.wolfsonmicro.com>
References: <1379961043-23762-1-git-send-email-ckeepax@opensource.wolfsonmicro.com> <1379961043-23762-2-git-send-email-ckeepax@opensource.wolfsonmicro.com> <5240B4C2.2080600@wwwdotorg.org> <20130923232832.GM21013@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130923232832.GM21013-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 24, 2013 at 12:28:32AM +0100, Mark Brown wrote:
> On Mon, Sep 23, 2013 at 03:38:10PM -0600, Stephen Warren wrote:
> > On 09/23/2013 12:30 PM, Charles Keepax wrote:
> 
> > > +  - wlf,max-channels-clocked : The maximum number of channels to be clocked on
> > > +    each AIF, useful for I2S systems with multiple data lines being mastered.
> > > +    If specified three cells must supplied one for each AIF, specify zero for
> > > +    AIFs that should be handled normally.
> 
> > What determines the value of this property? Is it really a definition of
> > HW, or some kind of run-time configuration/limit? What goes into each of
> > the 3 cells?
> 
> It's hardware, it's other devices wired in parallel on the bus that use
> the CODEC as a clock master.  Personally I'd have this be set by the
> ASoC machine driver so it's invisible from a DT point of view, that's
> what it's really a property of.

I don't have any really problem with setting this from the
machine driver, I will have a look at doing that.

I think based on the comments here I would suggest that we put
the first patch in but I need to rethink the other patches and
decide what is actually OS independant here.

Thanks,
Charles

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
