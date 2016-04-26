From: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 4/8] regulator: rk808: Migrate to regulator core's
 simplified DT parsing code
Date: Tue, 26 Apr 2016 10:46:54 +0200
Message-ID: <571F2AFE.2020006@phytec.de>
References: <1461590448-47685-1-git-send-email-w.egorov@phytec.de>
 <20160425173911.GQ3217@sirena.org.uk> <571F1CB4.10200@phytec.de>
 <2669414.IKg01zC8vG@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2669414.IKg01zC8vG@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 26.04.2016 10:17, Heiko St=FCbner wrote:
> Am Dienstag, 26. April 2016, 09:45:56 schrieb Wadim Egorov:
>> On 25.04.2016 19:39, Mark Brown wrote:
>>> On Mon, Apr 25, 2016 at 03:20:44PM +0200, Wadim Egorov wrote:
>>>> A common simplified DT parsing code for regulators was introduced =
in
>>>> commit a0c7b164ad11 ("regulator: of: Provide simplified DT parsing
>>>> method")
>>> This doesn't apply against current code, please check and resend.
>> Hm, for me all patches apply to the current code.
>> This patch depends on the first rename patch. Maybe this is the prob=
lem?
> which is the reason why renaming stuff makes everything just more com=
plicated=20
> without providing additional value ;-)=20
>
> The first patch would go through the mfd-tree (if accepted by Lee and=
 Acked by=20
> the other involved subsystem maintainers) which would then need a sta=
ble=20
> branch merged into the regulator tree - or after the first patch goes=
 in you=20
> simply wait for a kernel release.
>
> Normally I would expect the reasonable kernel developer to be able to=
 simply=20
> read code, kconfig, docs stating the drivers being for rk808 and rk81=
8 without=20
> getting "confused" by some structs mentioning the rk808.
>
>
> Heiko
I will drop the first patch and send a v4 later
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
