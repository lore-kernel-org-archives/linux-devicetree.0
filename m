From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 4/4] drm/tinydrm: Add RePaper e-ink driver
Date: Wed, 7 Jun 2017 13:52:50 +0200
Message-ID: <e782fcac-9d84-00bf-6c5a-8d908d9570f2@tronnes.org>
References: <1496404155-8344-1-git-send-email-noralf@tronnes.org>
 <1496404155-8344-5-git-send-email-noralf@tronnes.org>
 <CACvgo50+0DEeR=M9pyWvhgzKFnUivFVrmjisDL0jLPmB4ofz1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACvgo50+0DEeR=M9pyWvhgzKFnUivFVrmjisDL0jLPmB4ofz1w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Emil,


Den 07.06.2017 11.30, skrev Emil Velikov:
> Hi Noralf,
>
> Small drive-by comment, noticed while going through my morning coffee.
> By no means a full review.
>
> On 2 June 2017 at 12:49, Noralf Trønnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org> wrote:
>
>
>> +/* pixels on display are numbered from 1 */
>> +static void repaper_all_pixels(struct repaper_epd *epd, u8 **pp,
>> +                              const u8 *data, u8 fixed_value, const u8 *mask,
>> +                              enum repaper_stage stage)
>> +{
>> +       unsigned int b;
>> +
>> +       for (b = epd->width / 8; b > 0; b--) {
>> +               if (data) {
>> +                       u16 pixels = repaper_interleave_bits(data[b - 1]);
>> +                       u16 pixel_mask = 0xffff;
>> +
>> +                       if (mask) {
>> +                               u16 pixel_mask = repaper_interleave_bits(mask[b - 1]);
>> +
>> +                               pixel_mask = (pixel_mask ^ pixels) & 0x5555;
>> +                               pixel_mask |= pixel_mask << 1;
> The second u16 pixel_mask seems very suspicious - likely a copy/paste mistake ?

Actually it's a correct copy. The same pattern is used in three places.
I did look at the datasheet to try and understand what was going on,
but the current and previous frame is applied in normal and inverted
form in several stages, the pixels are converted to black/white/nochange
and then I lost track of it all.
So I decided that the Pervasive people who wrote the driver probably
knew what they where doing. At least it works!

Noralf.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
