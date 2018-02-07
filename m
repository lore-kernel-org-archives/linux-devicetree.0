From: Kieran Bingham <kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH 2/2] drm: adv7511: Add support for
 i2c_new_secondary_device
Date: Wed, 7 Feb 2018 23:40:00 +0000
Message-ID: <2484af34-4688-9ac6-f433-1e6ef03a2416@ideasonboard.com>
References: <1516625389-6362-1-git-send-email-kieran.bingham@ideasonboard.com>
 <1516625389-6362-3-git-send-email-kieran.bingham@ideasonboard.com>
 <e42ec168-5aff-8b8b-2307-d57a662dd395@codeaurora.org>
 <5890b343-e908-688b-ba03-84c1f76411f3@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5890b343-e908-688b-ba03-84c1f76411f3-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jean-Michel Hautbois <jean-michel.hautbois-B+Q8N6RmIDZBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Bhumika Goyal <bhumirks-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Archit,

On 07/02/18 12:33, Kieran Bingham wrote:
> Hi Archit,
> 
> Thank you for your review,
> 

<snip>

>>>       unsigned int val;
>>>       int ret;
>>>   @@ -1153,24 +1151,35 @@ static int adv7511_probe(struct i2c_client *i2c,
>>> const struct i2c_device_id *id)
>>>       if (ret)
>>>           goto uninit_regulators;
>>>   -    regmap_write(adv7511->regmap, ADV7511_REG_EDID_I2C_ADDR, edid_i2c_addr);
>>> -    regmap_write(adv7511->regmap, ADV7511_REG_PACKET_I2C_ADDR,
>>> -             main_i2c_addr - 0xa);
> 
> 
> Packet address here is written as an offset of -0x0a, which gives 0x2f or 0x33 ... ?
> 
> I think these current offsets are platform specific to a specific platform :)

I appear to be using platform specific maths specific to a non-conforming
platform or universe :-)

Sorry for the incorrect assertion here. - I mixed up 8bit and 7bit values.

The offsets are valid (when calculated correctly) - however - as per my reply to
Laurent - I believe the patch which determined the offsets was using the wrong
base :).

Also - due to a hardware issue on the ADV7511 - the Wheat (as the only known
user of two chips on the same bus) will need to be updated to ensure the current
assignments don't conflict.

--
Kieran

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
