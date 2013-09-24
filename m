From: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: introduce of_get_available_child_count
Date: Tue, 24 Sep 2013 14:22:50 -0700
Message-ID: <CAK5ve-LbgMrD1SFqpaW-L2cmEahaA9Ff+wjrrxwJiG=cVkQrrg@mail.gmail.com>
References: <1380045009-21149-1-git-send-email-cooloney@gmail.com> <52420118.9050501@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52420118.9050501-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 24, 2013 at 2:16 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 09/24/2013 12:50 PM, Bryan Wu wrote:
>> Some drivers keep counting available child by themselves. So
>> introduce a new simple API like of_get_child_count() but for
>> available childs.
>>
>> Cc: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>> Signed-off-by: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>
> Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>
> I assume you have some user and will take this dependency thru that tree?
>

Exactly, a patch from Josh [1] inspired me to create this API.

Thanks,
-Bryan

[1]: https://lkml.org/lkml/2013/9/24/68


>>  include/linux/of.h | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index f95aee3..54c2560 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -226,6 +226,17 @@ static inline int of_get_child_count(const struct device_node *np)
>>       return num;
>>  }
>>
>> +static inline int of_get_available_child_count(const struct device_node *np)
>> +{
>> +     struct device_node *child;
>> +     int num = 0;
>> +
>> +     for_each_available_child_of_node(np, child)
>> +             num++;
>> +
>> +     return num;
>> +}
>> +
>>  extern struct device_node *of_find_node_with_property(
>>       struct device_node *from, const char *prop_name);
>>  #define for_each_node_with_property(dn, prop_name) \
>> @@ -376,6 +387,11 @@ static inline int of_get_child_count(const struct device_node *np)
>>       return 0;
>>  }
>>
>> +static inline int of_get_available_child_count(const struct device_node *np)
>> +{
>> +     return 0;
>> +}
>> +
>>  static inline int of_device_is_compatible(const struct device_node *device,
>>                                         const char *name)
>>  {
>>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
