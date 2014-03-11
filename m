From: RongJun Ying <rjying-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mfd: Support SiRF audio modules
Date: Tue, 11 Mar 2014 09:33:08 +0800
Message-ID: <CAByv0RNEZOkh2-_=Lu-FS2D66JRwt5c+iSbF=x3k8semUwe_3g@mail.gmail.com>
References: <1394184531-7679-1-git-send-email-rongjun.ying@csr.com>
	<20140310103532.GI14976@lee--X1>
	<CAByv0RNQrPitsfcAwMvn=eZ1hNSaii=jw94H68rQvfQXnjYz9A@mail.gmail.com>
	<20140310163158.GI13661@lee--X1>
	<20140310164812.GN28112@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140310164812.GN28112-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, DL-SHA-WorkGroupLinux <workgroup.linux-kQvG35nSl+M@public.gmane.org>, Rongjun Ying <rongjun.ying-kQvG35nSl+M@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

2014-03-11 0:48 GMT+08:00 Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> On Mon, Mar 10, 2014 at 04:31:58PM +0000, Lee Jones wrote:
>
>> > > I'm not sure there's any need for this. Why don't you just parse the
>> > > child nodes? Are you even sure you need an MFD at all? It appears
>> > > you're just using an MFD to share a regmap. Seems like over-kill to me.
>
>> > In my case, the prima2 and atlas6 codec have small different. But
>> > they use the same register address space.
>> > The sound codec driver need know what codec device is applied.
>
>> I understand it was you who made the original request for the regmap
>> to be shared between devices. Was it an MFD that you had in mind?
>
> I was expecting an audio driver that registered several interfaces with
> the ASoC core rather than a MFD.  It's possible there's some good reason
> for doing things this way, I've not looked at the new patches (I only
> seem to have one for the MFD itself...).

I think the MFD driver is better than the ASoC core. Because the mfd_add_devices
can register all child device into system and the parent driver data
can be got the regmap
to all child drivers.

Hi Mark Brown:
I will send new patches of sound, if the MFD driver is applied.

Thanks.
-- 
------------------------------
Rongjun Ying
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
