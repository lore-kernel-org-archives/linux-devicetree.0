From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/5] checks: add string list check for *-names properties
Date: Fri, 17 Nov 2017 12:07:48 -0600
Message-ID: <CAL_JsqLQwZ=grCDwjUORaE0NnmC_qJBBtJtT7X0-Z2BGujcfmA@mail.gmail.com>
References: <20171117144515.10870-1-robh@kernel.org> <20171117144515.10870-4-robh@kernel.org>
 <8eea3f9e-5512-dc6c-f755-58cc333db732@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8eea3f9e-5512-dc6c-f755-58cc333db732-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 17, 2017 at 9:12 AM, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> wrote:
> Hi,
>
> On 17/11/17 14:45, Rob Herring wrote:
>> Add a string list check for common properties ending in "-names" such as
>> reg-names or interrupt-names.
>>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>>  checks.c | 17 ++++++++++++++++-
>>  1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/checks.c b/checks.c
>> index 4e23f29486bb..346b0256f9cb 100644
>> --- a/checks.c
>> +++ b/checks.c
>> @@ -622,6 +622,21 @@ WARNING_IF_NOT_STRING(stdout_path_is_string, "stdout-path");
>>
>>  WARNING_IF_NOT_STRING_LIST(compatible_is_string_list, "compatible");
>>
>> +static void check_names_is_string_list(struct check *c, struct dt_info *dti,
>> +                                    struct node *node)
>> +{
>> +     struct property *prop;
>> +
>> +     for_each_property(node, prop) {
>> +             if (!strstr(prop->name, "-names"))
>
> But that would match "actually-names-dont-matter" as well, resulting in
> a false positive? Should we check if the string appears at the *end* of
> the property name?

Perhaps. IMO, once a word is used, it needs to be reserved for that
purpose. For example, the gpio hogs binding use of "gpios" with just
numbers and no phandle is bad because we have a mixture of types for a
given property name or suffix. So we should really enforce that
"-names" only appears as a suffix and use anywhere else is a warning.

Rob
