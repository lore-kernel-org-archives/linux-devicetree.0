From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH v2 2/2] drm/bridge: Add PTN3460 bridge driver
Date: Thu, 15 Aug 2013 16:51:40 -0400
Message-ID: <CAOw6vbJvZeKMSY=xQHHmTDjpCSoS6gC99Ly2RDWUGsuyKPXw7Q@mail.gmail.com>
References: <1376513258-25703-1-git-send-email-seanpaul@chromium.org>
 <1376513258-25703-3-git-send-email-seanpaul@chromium.org> <20130815152812.GF16951@ulmo>
 <CAOw6vbLukpMkDHivB54uMnMvmRU6=qq2hodgE9Jxj5oSpjQHxQ@mail.gmail.com> <20130815204207.GA24507@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130815204207.GA24507@ulmo>
Sender: linux-doc-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, robdclark@gmail.com, Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@linux.ie>, =?ISO-8859-1?Q?St=E9phane_Marchesin?= <marcheu@chromium.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 15, 2013 at 4:42 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Thu, Aug 15, 2013 at 03:32:58PM -0400, Sean Paul wrote:
>> On Thu, Aug 15, 2013 at 11:28 AM, Thierry Reding
>> <thierry.reding@gmail.com> wrote:
>> > On Wed, Aug 14, 2013 at 04:47:38PM -0400, Sean Paul wrote:
>> > [...]
>> >> +int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
>> >> +             struct i2c_client *client, struct device_node *node)
>> > [...]
>> >> +     ptn_bridge->gpio_pd_n = of_get_named_gpio(node, "powerdown-gpio", 0);
>> >
>> > of_get_named_gpio() can return -EPROBE_DEFER and I wonder how you handle
>> > that in the driver that uses ptn3460_init(). Since you pass in an
>> > initialized drm_device, you'd need to undo all of that in case of
>> > -EPROBE_DEFER. Well I guess you'd have to do that in case of any error,
>> > but it makes things difficult to handle for drivers.
>> >
>> > For instance on Tegra we pretty much delay DRM initialization until all
>> > required subdevices (there are quite a few) have been probed, so if we
>> > wanted to use this function we'd have to call it after all drivers have
>> > been probed because only then do we have access to a struct drm_device.
>> > That will cause other problems, however, because at that point we can't
>> > defer probing anymore.
>> >
>>
>> I suppose I could add another init that performs the deferrable tasks
>> (ptn3460_init_deferrable or something). This would be called before
>> drm init has been started from one of the probe functions.
>> Alternatively, I could set this up as a standalone i2c driver and do
>> this stuff in the probe. Any other options?
>
> My point was that in those cases you don't have access to the DRM device
> yet since you haven't called drm_init() yet.
>

Yep, I got that. I meant to say we could parse the dt and save the
gpio number for later use when ptn3460_init is called with a
drm_device (thus separating the deferable parts into a place that's
easier to defer). I'm not sure this is worth fixing, TBH.


>> Adding another init call adds yet another thing the drm driver has to
>> do to use this bridge. Making the ptn driver standalone requires you
>> to set things up such that drm init is dependent on ptn probe running
>> successfully. I'm not sure which is more desirable.
>>
>> Practically speaking, do you expect to call drm_init before the gpio
>> is available?
>
> No, not really, but I won't know that the GPIO is available until I
> actually call of_get_named_gpio_flags().
>
> But perhaps we should cross that bridge when we get to it.
>

Pun intended? ;-)

Sean


> Thierry
