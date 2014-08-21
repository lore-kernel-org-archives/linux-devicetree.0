From: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] phy: miphy28lp: Add MiPHY28lp header file for DT x
 Driver defines
Date: Thu, 21 Aug 2014 09:12:06 +0200
Message-ID: <CAG374jC5qYWZgsaUZjgp_YU8uYqwxg8SSfzEr8OTVWNvEZXUQQ@mail.gmail.com>
References: <1407944075-8093-1-git-send-email-gabriel.fernandez@linaro.org>
	<1407944075-8093-3-git-send-email-gabriel.fernandez@linaro.org>
	<53F4B663.90400@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53F4B663.90400-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org" <kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org>, alexandre torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kishon,

Okay, good.


BR
Gabriel

On 20 August 2014 16:53, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
> Hi,
>
> On Wednesday 13 August 2014 09:04 PM, Gabriel FERNANDEZ wrote:
>> This provides the shared header file which will be reference from both
>> the MiPHY28lp driver and its associated Device Tree node(s).
>>
>> Signed-off-by: alexandre torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  include/dt-bindings/phy/phy-miphy28lp.h | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>  create mode 100644 include/dt-bindings/phy/phy-miphy28lp.h
>>
>> diff --git a/include/dt-bindings/phy/phy-miphy28lp.h b/include/dt-bindings/phy/phy-miphy28lp.h
>> new file mode 100644
>> index 0000000..7cf9bce
>> --- /dev/null
>> +++ b/include/dt-bindings/phy/phy-miphy28lp.h
>> @@ -0,0 +1,12 @@
>> +/*
>> + * This header provides constants for the phy framework
>> + * based on the STMicroelectronics miph28lp.
>> + */
>> +#ifndef _DT_BINDINGS_PHY_MIPHY28LP
>> +#define _DT_BINDINGS_PHY_MIPHY28LP
>> +
>> +#define MIPHY_TYPE_SATA              1
>> +#define MIPHY_TYPE_PCIE              2
>> +#define MIPHY_TYPE_USB               3
>
> I think we should create a common file for phy so that all user's need not
> create a separate copy of the same thing.
>
> Thanks
> Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
