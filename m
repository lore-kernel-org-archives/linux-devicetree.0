From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v4 45/49] adv7604: Add DT support
Date: Thu, 17 Apr 2014 16:52:08 +0200
Message-ID: <534FEA98.5000901@samsung.com>
References: <1397744000-23967-1-git-send-email-laurent.pinchart@ideasonboard.com>
 <1397744000-23967-46-git-send-email-laurent.pinchart@ideasonboard.com>
 <534FE7A1.8060800@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <534FE7A1.8060800@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, Lars-Peter Clausen <lars@metafoo.de>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 17/04/14 16:39, Sylwester Nawrocki wrote:
> On 17/04/14 16:13, Laurent Pinchart wrote:
>> > Parse the device tree node to populate platform data. Only the ADV7611
>> > is currently support with DT.
>> > 
>> > Cc: devicetree@vger.kernel.org
>> > Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> > Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
> The patch looks good to me.
> 
> Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 
> Just one comment below...
>> > ---
[...]
>> > +static struct of_device_id adv7604_of_id[] = {
>
> Not adding __maybe_unused attribute to this one ?

I missed it's added in the last patch in this series, please ignore
this comment.

-- 
Regards,
Sylwester
