From: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [RFC] drm/msm: DT support for 8960/8064
Date: Wed, 02 Jul 2014 15:09:39 -0600
Message-ID: <53B47513.2040704@codeaurora.org>
References: <1404241055-3579-1-git-send-email-robdclark@gmail.com> <20140702180928.GA29837@leverpostej> <CAF6AEGuK-_frg5ErRNXGpqHfXv85E_6-_iKHWuHyz5g6udVt8Q@mail.gmail.com>
Reply-To: jcrouse@codeaurora.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAF6AEGuK-_frg5ErRNXGpqHfXv85E_6-_iKHWuHyz5g6udVt8Q@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>, Mark Rutland <mark.rutland@arm.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 07/02/2014 03:01 PM, Rob Clark wrote:
> As far as I can tell from diving downstream android kgsl code, seems
> like some a2xx you might be able to read the value from hw.  Beyond
> that I'm not entirely sure.  (Remember, no docs.)

Ohhh! I get to tell a story!

The on chip registers have a long and consistent history of being wrong.
And not just the spin ID being wrong - the major and minor have had their
issues too. It got to the point that sometime around the A320 timeframe
we put our foot down and decided that we would never again rely on the
hardware. The reasoning is that the SoC and the GPU are on the same die
so we can use the one to identify the other. And thats what we've done
since then - first in the board files and now in the DT.

So long story short - the registers are there, we don't trust them as
far as we could throw them.  Use the SoC instead.

Jordan

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
