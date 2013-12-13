From: =?UTF-8?B?w4lyaWMgUGllbA==?= <eric.piel-VkQ1JFuSMpfAbQlEx87xDw@public.gmane.org>
Subject: Re: [PATCH 0/4] lis3lv02d: update DT binding for use with Nokia N900
Date: Fri, 13 Dec 2013 23:31:39 +0100
Message-ID: <52AB8ACB.6000101@tremplin-utc.net>
References: <1386968094-24554-1-git-send-email-sre@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386968094-24554-1-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 13-12-13 21:54, Sebastian Reichel wrote:
> Hi,
>
> The lis302 has already a DT binding described in [0],
> which descibes misc. hardware properties. The current
> binding does not support all values needed to convert
> the Nokia N900's platform data to DT.
>
> This patchset introduces support for describing inverted
> axis, configuration of second wakeup unit and wakeup
> threshold support.
Hi,

All the three patches related to the lis3lv02d driver look fine to me.
Here is my signed-off for patches 2, 3, and 4:
Signed-off-by: =C3=89ric Piel <eric.piel-VkQ1JFuSMpfAbQlEx87xDw@public.gmane.org>

I've got 2 side questions:
  * How do you write a negative value in a DTS file? Is this just the=20
very standard way (i.e., -), or do you need to use a specific technique=
=20
(such as 2-completemnt on 32 bits)? If it's not the standard way, it=20
should probably be documented somewhere.
  * Who wants to carry these patches? Can they all go via the devicetre=
e=20
branch? Or maybe Arnd or Greg would prefer to pick them via the misc=20
driver branch? Both ways are fine for me...

Cheers,
=C3=89ric
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
