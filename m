From: Tai Tri Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH v2 2/4] Documentation: Add documentation for APM X-Gene
 SoC PMU DTS binding
Date: Mon, 18 Apr 2016 13:04:53 -0700
Message-ID: <CACgAJHyBbO_LXwtfNVK1f=dY3v1Jfxwxq1dw98EZ0aYdhjPpAg@mail.gmail.com>
References: <1460510547-17611-1-git-send-email-ttnguyen@apm.com>
	<1460510547-17611-3-git-send-email-ttnguyen@apm.com>
	<20160418170009.GA15338@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160418170009.GA15338@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, patches <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

[...]

>> +Required properties for MCB subnode:
>> +- compatible         : Shall be "apm,xgene-pmu-mcb".
>> +- reg                        : First resource shall be the MCB PMU resource.
>> +- index                      : Instance number of the MCB PMU.
>> +
>> +Required properties for MC subnode:
>> +- compatible         : Shall be "apm,xgene-pmu-mc".
>> +- reg                        : First resource shall be the MC PMU resource.
>> +- index                      : Instance number of the MC PMU.
>
> Don't use indexes. You probably need phandles to the nodes these are
> related to.
>
> How many variations of child nodes do you expect to have? 2, 10, 50? You
> might want to just collapse all this down to a single node and put this
> information in the driver if it is fixed for each SoC and there's only a
> handful.
>

For each kind of PMU, for example memory controller PMU, I expect to
have the number of instances up to 8.
They are actually all independent PMU nodes and have their own CSR memory bases.
The indexes are used for exposing the devices to perf user only. It
doesn't have an impact on the programming model.
Mark also had the same concern.

Thanks,
-- 
Tai
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
