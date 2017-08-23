From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH v2 1/3] media: V3s: Add support for
 Allwinner CSI.
Date: Wed, 23 Aug 2017 08:52:00 +0200
Message-ID: <3392c717-10ea-4d6e-4c25-9be0bbec004e@xs4all.nl>
References: <1501131697-1359-1-git-send-email-yong.deng@magewell.com>
 <1501131697-1359-2-git-send-email-yong.deng@magewell.com>
 <5082b6d6-29a7-f101-8cba-13fce8983c89@xs4all.nl>
 <20170822110148.734c01b69dacc57fa08965d1@magewell.com>
 <8dd8c350-cd45-5cd9-65cc-67102944811f@xs4all.nl>
 <20170822201731.hyjqrbkhggaoomfl@flea.home>
Reply-To: hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBC3MVVMX3ELBBHOM6TGAKGQEECZKQCA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170822201731.hyjqrbkhggaoomfl-YififvaboMKzQB+pC5nmwQ@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jean-Christophe Trotin <jean-christophe.trotin-qxv4g6HH51o@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/22/2017 10:17 PM, Maxime Ripard wrote:
> On Tue, Aug 22, 2017 at 08:43:35AM +0200, Hans Verkuil wrote:
>>>>> +static int sun6i_video_link_setup(struct media_entity *entity,
>>>>> +				  const struct media_pad *local,
>>>>> +				  const struct media_pad *remote, u32 flags)
>>>>> +{
>>>>> +	struct video_device *vdev = media_entity_to_video_device(entity);
>>>>> +	struct sun6i_video *video = video_get_drvdata(vdev);
>>>>> +
>>>>> +	if (WARN_ON(video == NULL))
>>>>> +		return 0;
>>>>> +
>>>>> +	return sun6i_video_formats_init(video);
>>>>
>>>> Why is this called here? Why not in video_init()?
>>>
>>> sun6i_video_init is in the driver probe context. sun6i_video_formats_init
>>> use media_entity_remote_pad and media_entity_to_v4l2_subdev to find the
>>> subdevs.
>>> The media_entity_remote_pad can't work before all the media pad linked.
>>
>> A video_init is typically called from the notify_complete callback.
>> Actually, that's where the video_register_device should be created as well.
>> When you create it in probe() there is possibly no sensor yet, so it would
>> be a dead video node (or worse, crash when used).
>>
>> There are still a lot of platform drivers that create the video node in the
>> probe, but it's not the right place if you rely on the async loading of
>> subdevs.
> 
> That's not really related, but I'm not really sure it's a good way to
> operate. This essentially means that you might wait forever for a
> component in your pipeline to be probed, without any chance of it
> happening (not compiled, compiled as a module and not loaded, hardware
> defect preventing the driver from probing properly, etc), even though
> that component might not be essential.

We're talking straightforward video pipelines here. I.e. a source, some
processing units and a DMA engine at the end. There is no point in
creating a video node if the pipeline is not complete since you need
the full pipeline.

I've had bad experiences in the past where video nodes were created too
soon and part of the internal state was still incomplete, causing at best
weird behavior and at worst crashes.

More complex devices are a whole different ballgame.

Regards,

	Hans

> This is how DRM operates, and you sometimes end up in some very dumb
> situations where you wait for say, the DSI controller to probe, while
> you only care about HDMI in your system.
> 
> But this seems to be on of the hot topic these days, so we might
> discuss it further in some other thread :)
> 
> Maxime
> 
