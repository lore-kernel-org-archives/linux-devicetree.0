From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 1/6] V4L2: Add Renesas R-Car JPEG codec driver.
Date: Mon, 25 Aug 2014 14:39:49 +0200
Message-ID: <53FB2E95.7040505@xs4all.nl>
References: <1408452653-14067-2-git-send-email-mikhail.ulyanov@cogentembedded.com> <1408969787-23132-1-git-send-email-mikhail.ulyanov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1408969787-23132-1-git-send-email-mikhail.ulyanov@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, horms@verge.net.au, magnus.damm@gmail.com, m.chehab@samsung.com, robh+dt@kernel.org, grant.likely@linaro.org
Cc: laurent.pinchart@ideasonboard.com, hans.verkuil@cisco.com, linux-sh@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/25/2014 02:29 PM, Mikhail Ulyanov wrote:
> This patch contains driver for Renesas R-Car JPEG codec.
> 
> Cnanges since v1:
>     - s/g_fmt function simplified
>     - default format for queues added
>     - dumb vidioc functions added to be in compliance with standard api:
>         jpu_s_priority, jpu_g_priority

Oops, that's a bug elsewhere. Don't add these empty prio ops, this needs to be
solved in the v4l2 core.

I'll post a patch for this.

Regards,

	Hans

>     - standard v4l2_ctrl_subscribe_event and v4l2_event_unsubscribe
>       now in use by the same reason

