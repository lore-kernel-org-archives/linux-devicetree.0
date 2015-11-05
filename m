From: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v6 1/8] dt-bindings: add documentation of rk3036 clock
 controller
Date: Thu, 05 Nov 2015 11:05:33 +0800
Message-ID: <563AC77D.3080403@rock-chips.com>
References: <1446639503-11763-1-git-send-email-zhengxing@rock-chips.com> <1446639503-11763-2-git-send-email-zhengxing@rock-chips.com> <2700959.OiVQMNL8Ss@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2700959.OiVQMNL8Ss@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2015=E5=B9=B411=E6=9C=8805=E6=97=A5 07:39, Heiko Stuebner wrote:
> Hi,
>
> Am Mittwoch, 4. November 2015, 20:18:16 schrieb Xing Zheng:
>> Add the devicetree binding for the cru on the rk3036 which quite sim=
ilar
>> structured as previous clock controllers.
>>
>> Signed-off-by: Xing Zheng<zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> Reviewed-by: Heiko Stuebner<heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>> ---
> your recipient-list is missing the clock maintainers+lists - sorry fo=
r
> not noticing this earlier.
>
> While the devicetree-maintainers may Review it, we expect the clock-
> maintainers to actually apply all 4 clock-related patches.
>
> Same comment is true for
> [PATCH v6 2/8] clk: rockchip: add dt-binding header for rk3036
>
>
> Heiko
>
Sorry, and I will loop them in the next versioin.
Thanks.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
