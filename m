From: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Subject: Re: [PATCH v4 3/3] regulator: qcom-rpm: Regulator driver for the
 Qualcomm RPM
Date: Wed, 16 Jul 2014 15:17:13 -0700
Message-ID: <CAJAp7Oj1R-EkJoSdLEa6SBLbzE_N1MjsystQ9Z+x4L_SjU=56w@mail.gmail.com>
References: <1405465241-28684-1-git-send-email-bjorn.andersson@sonymobile.com>
	<1405465241-28684-4-git-send-email-bjorn.andersson@sonymobile.com>
	<CAMf-jSn2YHF7ihRpXMfkPWYt8pNCj4o395OGha3BHD3K3mUv9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMf-jSn2YHF7ihRpXMfkPWYt8pNCj4o395OGha3BHD3K3mUv9g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: pramod gurav <pramod.gurav.etc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 16, 2014 at 12:01 AM, pramod gurav
<pramod.gurav.etc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Bjorn,
>
> On Wed, Jul 16, 2014 at 4:30 AM, Bjorn Andersson
> <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org> wrote:
[...]
>> +static const struct regulator_linear_range pldo_ranges[] = {
>> +       REGULATOR_LINEAR_RANGE( 750000,   0,  59, 12500),
>
> ERROR: space prohibited after that open parenthesis '('
>

I prefer the nicely aligned columns over checkpatch correctness here.

>> +       REGULATOR_LINEAR_RANGE(1500000,  60, 123, 25000),
>> +       REGULATOR_LINEAR_RANGE(3100000, 124, 160, 50000),
>> +};
>> +

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
