From: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/3] of/irq: Add new function of_msi_map_rid()
Date: Wed, 23 Sep 2015 09:59:35 -0700
Message-ID: <5602DA77.9090108@caviumnetworks.com>
References: <1442966406-13198-1-git-send-email-ddaney.cavm@gmail.com> <1442966406-13198-3-git-send-email-ddaney.cavm@gmail.com> <20150923175216.3384d7b4@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150923175216.3384d7b4-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/23/2015 09:52 AM, Marc Zyngier wrote:
> On Tue, 22 Sep 2015 17:00:05 -0700
> David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>>
>> The device tree property "msi-map" specifies how to create the PCI
>> requester id used in some MSI controllers.  Add a new function
>> of_msi_map_rid() that finds the msi-map property and applies its
>> translation to a given requester id.
>>
>> Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/of/irq.c       | 86 ++++++++++++++++++++++++++++++++++++++++++++++++++
>>   include/linux/of_irq.h |  7 ++++
>>   2 files changed, 93 insertions(+)
>>
>> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
>> index 55317fa..3f64d2e 100644
>> --- a/drivers/of/irq.c
>> +++ b/drivers/of/irq.c
>> @@ -598,3 +598,89 @@ void of_msi_configure(struct device *dev, struct device_node *np)
[...]
>> +	while (!matched && msi_map_len >= 4 * sizeof(__be32)) {
>> +		rid_base = be32_to_cpup(msi_map + 0);
>> +		phandle = be32_to_cpup(msi_map + 1);
>> +		msi_base = be32_to_cpup(msi_map + 2);
>> +		rid_len = be32_to_cpup(msi_map + 3);
>
> Rob did suggest to use of_property_read_u32_index() instead of these
> be32_to_cpup(). Not sure if that'd be a major improvement though.
>

I did think about that, but the micro-optimizer in me didn't feel 
comfortable with the overhead of rerunning of_find_property() for each 
value.  I decided to run of_find_property() once, and then iterate 
through the individual values within the property.

If there are strong objections to doing it this way, we can change it.

David Daney
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
