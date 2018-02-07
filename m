From: Kieran Bingham <kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH 1/2] media: adv7604: Add support for
 i2c_new_secondary_device
Date: Wed, 7 Feb 2018 15:54:20 +0000
Message-ID: <4ff04149-9726-716c-306c-819130897c98@ideasonboard.com>
References: <1516625389-6362-1-git-send-email-kieran.bingham@ideasonboard.com>
 <1516625389-6362-2-git-send-email-kieran.bingham@ideasonboard.com>
 <20180129200813.ifaz2bkkxshiodga@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180129200813.ifaz2bkkxshiodga@rob-hp-laptop>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kieran Bingham <kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jean-Michel Hautbois <jean-michel.hautbois-B+Q8N6RmIDZBDgjK7y7TUQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 29/01/18 20:08, Rob Herring wrote:
> On Mon, Jan 22, 2018 at 12:49:56PM +0000, Kieran Bingham wrote:
>> From: Jean-Michel Hautbois <jean-michel.hautbois-B+Q8N6RmIDZBDgjK7y7TUQ@public.gmane.org>
>>
>> The ADV7604 has thirteen 256-byte maps that can be accessed via the main
>> I²C ports. Each map has it own I²C address and acts as a standard slave
>> device on the I²C bus.
>>
>> Allow a device tree node to override the default addresses so that
>> address conflicts with other devices on the same bus may be resolved at
>> the board description level.
>>
>> Signed-off-by: Jean-Michel Hautbois <jean-michel.hautbois-B+Q8N6RmIDZBDgjK7y7TUQ@public.gmane.org>
>> [Kieran: Re-adapted for mainline]
>> Signed-off-by: Kieran Bingham <kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
>> ---
>> Based upon the original posting :
>>   https://lkml.org/lkml/2014/10/22/469
>> ---
>>  .../devicetree/bindings/media/i2c/adv7604.txt      | 18 ++++++-
> 
> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Thank you.

> In the future, please split bindings to separate patch.

Yes, of course - sorry - I should probably have known better here.

I was clearly being lazy as the original patch had bindings in with the driver.
Although I don't think I've got an excuse for the second patch in the series :D

I've split them out for the v2.

--
Kieran

>>  drivers/media/i2c/adv7604.c                        | 60 ++++++++++++++--------
>>  2 files changed, 55 insertions(+), 23 deletions(-)
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
