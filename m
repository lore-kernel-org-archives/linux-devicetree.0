From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: sun6i: Add
 sun6i-a31-reference-design-tablet.dtsi
Date: Mon, 22 Aug 2016 20:55:52 +0200
Message-ID: <c7d7dab8-ee30-8e71-c3b4-16ff1edfe134@redhat.com>
References: <1471533095-13432-1-git-send-email-hdegoede@redhat.com>
 <20160822183915.GA7104@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160822183915.GA7104@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 22-08-16 20:39, Maxime Ripard wrote:
> Hi,
>
> On Thu, Aug 18, 2016 at 05:11:34PM +0200, Hans de Goede wrote:
>> Just like with a13/a23/a33 most a31 tablets are derived from the same
>> reference design. Add a .dtsi file with all the common bits to avoid
>> endless copy and pasting of these.
>>
>> The sun6i-a31-reference-design-tablet.dtsi this commit adds is a copy
>> of sun6i-a31s-colorfly-e708-q1.dts with a few tablet specific bits
>> removed / left in sun6i-a31s-colorfly-e708-q1.dts.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> The patch looks ok, but doesn't apply.

Right, I forgot an earlier patch in the series, which is why I send a v2.

Regards,

Hans

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
