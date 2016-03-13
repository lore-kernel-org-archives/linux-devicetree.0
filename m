From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/5] regulator: pwm: Prints error number when it fails
Date: Sun, 13 Mar 2016 18:37:56 +0530
Message-ID: <56E5662C.7020906@nvidia.com>
References: <1457434405-30372-1-git-send-email-ldewangan@nvidia.com> <1457434405-30372-4-git-send-email-ldewangan@nvidia.com> <20160312060543.GV3898@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160312060543.GV3898-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Saturday 12 March 2016 11:35 AM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Tue, Mar 08, 2016 at 04:23:23PM +0530, Laxman Dewangan wrote:
>
>> +		dev_err(&pdev->dev, "Failed to get PWM, %d\n", ret);
> Pretty much everywhere else in the kernel we use "foo: %d\n" - please
> use a consistent style.

I saw mixed approach and so always thought what would be better.
Great to know that it is foo: %d style is far better than other way.

Will correct and post the another patch.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
