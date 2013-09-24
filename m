From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/5] mfd: arizona: Add device tree helper functions
Date: Tue, 24 Sep 2013 16:58:40 -0600
Message-ID: <52421920.8010403@wwwdotorg.org>
References: <1379961043-23762-1-git-send-email-ckeepax@opensource.wolfsonmicro.com> <5240B464.2010903@wwwdotorg.org> <20130924094937.GN3635@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130924094937.GN3635-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/24/2013 03:49 AM, Charles Keepax wrote:
> On Mon, Sep 23, 2013 at 03:36:36PM -0600, Stephen Warren wrote:
>> On 09/23/2013 12:30 PM, Charles Keepax wrote:
>>> -  - AVDD1-supply, DBVDD1-supply, DBVDD2-supply, DBVDD3-supply, CPVDD-supply,
>>> +  - AVDD-supply, DBVDD1-supply, DBVDD2-supply, DBVDD3-supply, CPVDD-supply,
>>
>> That looks like an incompatible change to the DT ABI.
> 
> The supply name in the driver is AVDD as is the name for the pin
> on the datasheet, if you specify it as AVDD1 in device tree the
> current driver will not load.
> 
> This appears to have been a copy and paste error from the wm8994
> which has 2 AVDD supplies and I believe these docs were based
> on. I would prefer to update the documentation to match what the
> driver already expects rather than the other way around.

OK, if there's no driver anywhere that can possibly work with the
binding as written, it's likely fine to change the binding.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
