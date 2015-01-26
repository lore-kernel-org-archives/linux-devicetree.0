From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 2/2] sunxi: clk: Set sun6i-pll1 n_start = 1
Date: Mon, 26 Jan 2015 17:23:39 +0800
Message-ID: <CAGb2v65DwNE4Q_R1uQdn97VemPKuNxK8bsbc6-whZ0xeD4T7yw@mail.gmail.com>
References: <1422100592-19981-1-git-send-email-hdegoede@redhat.com>
 <1422100592-19981-2-git-send-email-hdegoede@redhat.com> <20150125155542.GF8470@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150125155542.GF8470@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 25, 2015 at 11:55 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Sat, Jan 24, 2015 at 12:56:32PM +0100, Hans de Goede wrote:
>> For all pll-s on sun6i n == 0 means use a multiplier of 1, rather then 0 as
>> it means on sun4i / sun5i / sun7i. n_start = 1 is already correctly set
>> for sun6i pll6, but was missing for pll1, this commit fixes this.
>>
>> Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> Applied the two, thanks!

This is the same as the one I sent, which you asked Mike to queue
for 3.19.

ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
