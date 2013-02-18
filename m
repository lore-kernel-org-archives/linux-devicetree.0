From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 7/7] ARM: dts: Add Samsung G2D DT bindings documentation
Date: Mon, 18 Feb 2013 10:47:58 +0530
Message-ID: <CAK9yfHzf7f=+rmVVjr-Mkx1B=GbbgKgkkoz-pSp13os+fy9=dA@mail.gmail.com>
References: <1360151477-26460-1-git-send-email-sachin.kamat@linaro.org>
	<1360151477-26460-8-git-send-email-sachin.kamat@linaro.org>
	<104679815.9jiIT0ld5D@flatron>
	<CAK9yfHxcZ41rLK5i_hZ2QoBKsxUHEk252XLOHSMHeS2WvGrcrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <CAK9yfHxcZ41rLK5i_hZ2QoBKsxUHEk252XLOHSMHeS2WvGrcrQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>, "inki.dae@samsung.com" <inki.dae@samsung.com>, "patches@linaro.org" <patches@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Tomasz,

>>> +Optional properties:
>>> +  - samsung,power-domain : power-domain property defined with a phandle
>>> +                        to respective power domain.
>>
>> I'm not sure if samsung,power-domain should be mentioned in this
>> documentation file. The driver itself does not use this property.
>
> Oh ok. I will check this again and remove if unnecessary.

The driver does not use power-domain property for now and hence I have
removed this in V2.
Thanks for pointing out.

-- 
With warm regards,
Sachin
