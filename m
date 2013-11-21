From: Rob Herring <robherring2@gmail.com>
Subject: Re: [RFC PATCH 2/2] of: add initcall with match boilerplate helpers
Date: Thu, 21 Nov 2013 17:23:14 -0600
Message-ID: <CAL_JsqKHZtidrzJPH+c-zyFUQNsxtEKxOYg+Nzyo9JYNDNexug@mail.gmail.com>
References: <1383113571-13029-1-git-send-email-robherring2@gmail.com>
	<1383113571-13029-3-git-send-email-robherring2@gmail.com>
	<20131121125007.17A8FC40A2C@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131121125007.17A8FC40A2C@trevor.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 21, 2013 at 6:50 AM, Grant Likely <grant.likely@linaro.org> wrote:
> On Wed, 30 Oct 2013 01:12:51 -0500, Rob Herring <robherring2@gmail.com> wrote:
>> From: Rob Herring <rob.herring@calxeda.com>
>>
>> Add boilerplate helpers to create initcalls which are conditional on
>> matching on devicetree properties.
>>
>> Cc: Grant Likely <grant.likely@linaro.org>
>> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
>> ---
>>  include/linux/of.h | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index f95aee3..a1327c9 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -592,6 +592,18 @@ static inline int of_property_read_u32(const struct device_node *np,
>>               s;                                              \
>>               s = of_prop_next_string(prop, s))
>>
>> +#define of_initcall_match(__func, __lvl, __match) \
>> +static int __init __func##_init(void) \
>> +{ \
>> +     if (of_find_matching_node(NULL, __match)) \
>> +             return __func(); \
>> +     else \
>> +             return -ENODEV; \
>> +} \
>> +__lvl(__func##_init);
>> +
>> +#define of_module_init_match(__func, __match) of_initcall_match(__func, module_init, __match)
>> +
>
> I'm not sure why this is necessary. I don't particularly have a problem
> with it, but I wouldn't normally try to filter out device drivers when
> the probe code simply won't get called.
>
> Considering it's paired with the previous patch that creates devices in
> the module init call, I'm assuming it is to support that use case. If so
> then I don't think it is a good idea. If there is another use case then
> maybe.

This is for cases that are not drivers. Again, the motivation is how
do I do initialization on arm64 where there is not already some
conditional initialization hook. My approach to solve this is by
eliminating the machine_desc for highbank. While I don't really have a
need to do this on highbank itself, I do have a need for some of the
same functions present in mach-highbank for arm64.

I realized quickly going down this path that I would have a repeated
pattern and that there's already a few other examples in the kernel of
something like this:

static int __init some_initcall(void)
{
  if (of_machine_is_compatible("my-awesume-board"))
    return -ENODEV;

  /* do some init stuff... */
}

There are some examples using this here [1][2].

Rob

[1] https://git.kernel.org/cgit/linux/kernel/git/robh/linux.git/commit/?h=highbank-rm-mach-desc&id=2920f2082f51128dc28348756a1727fe0d13b5a8
[2] https://git.kernel.org/cgit/linux/kernel/git/robh/linux.git/commit/?h=highbank-rm-mach-desc&id=1acc8c4d023506e22d0abaad84a74a34c36fecfb
