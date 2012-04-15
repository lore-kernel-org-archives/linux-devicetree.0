From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH V3 1/1] dt: add of_get_child_count helper function
Date: Sun, 15 Apr 2012 11:51:27 +0800
Message-ID: <CAA+hA=Q0kKX+mdAH0H-XXpHgJOLNPM4me_+qh4oSWd3+Jg02FA@mail.gmail.com>
References: <1328980929-5423-1-git-send-email-dong.aisheng@linaro.org>
	<4F381F6C.1030908@gmail.com>
	<CAA+hA=RpfLfUyupVqBpMHsRN1h5KG5eLD86DkDygZRk5nCUtqA@mail.gmail.com>
	<4F8A3D5C.8030001@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4F8A3D5C.8030001@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Dong Aisheng <dong.aisheng@linaro.org>, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Apr 15, 2012 at 11:15 AM, Rob Herring <robherring2@gmail.com> w=
rote:
> On 04/13/2012 01:07 PM, Dong Aisheng wrote:
>> Hi Rob,
>>
>> On Mon, Feb 13, 2012 at 4:22 AM, Rob Herring <robherring2@gmail.com>=
 wrote:
>>> On 02/11/2012 11:22 AM, Dong Aisheng wrote:
>>>> Currently most code to get child count in kernel are almost same,
>>>> add a helper to implement this function for dt to use.
>>>>
>>>> Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>
>>>> Cc: Grant Likely <grant.likely@secretlab.ca>
>>>> Cc: Rob Herring <rob.herring@calxeda.com>
>>>>
>>>> ---
>>>> Hi Rob,
>>>>
>>>> Since my imx pinctrl driver series still depends on the pinctrl co=
re dt
>>>> binding patch which is still not in mainline, i'd like this pure d=
t patch
>>>> go separately first in case others want to use.
>>>>
>>>
>>> Applied for 3.4.
>>>
>> I did not see this in 3.4 kernel.
>> Anything i missed?
>> My pinctrl-imx driver i just sent is using this.
>
> Sorry, I did not get this sent to Grant in time. Go ahead and merge i=
t
> with your pinctrl driver.
>
It's fine to me,
so i can add your ack, right?

Regards
Dong Aisheng

>
>>
>> Regards
>> Dong Aisheng
>>
>>> Rob
>>>
>>>> changes v2->v3:
>>>> =A0Addressed some people's comments:
>>>> =A0* do not use assignment as expression
>>>> =A0* return 0 for non-dt case
>>>>
>>>> Changes v1->v2:
>>>> =A0* change the name from of_get_child_number to of_get_child_coun=
t
>>>> ---
>>>> =A0include/linux/of.h | =A0 16 ++++++++++++++++
>>>> =A01 files changed, 16 insertions(+), 0 deletions(-)
>>>>
>>>> diff --git a/include/linux/of.h b/include/linux/of.h
>>>> index a75a831..ae242ef 100644
>>>> --- a/include/linux/of.h
>>>> +++ b/include/linux/of.h
>>>> @@ -195,6 +195,17 @@ extern struct device_node *of_get_next_child(=
const struct device_node *node,
>>>> =A0 =A0 =A0 for (child =3D of_get_next_child(parent, NULL); child =
!=3D NULL; \
>>>> =A0 =A0 =A0 =A0 =A0 =A0child =3D of_get_next_child(parent, child))
>>>>
>>>> +static inline int of_get_child_count(const struct device_node *np=
)
>>>> +{
>>>> + =A0 =A0 struct device_node *child =3D NULL;
>>>> + =A0 =A0 int num =3D 0;
>>>> +
>>>> + =A0 =A0 while ((child =3D of_get_next_child(np, child)) !=3D NUL=
L)
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 num++;
>>>> +
>>>> + =A0 =A0 return num;
>>>> +}
>>>> +
>>>> =A0extern struct device_node *of_find_node_with_property(
>>>> =A0 =A0 =A0 struct device_node *from, const char *prop_name);
>>>> =A0#define for_each_node_with_property(dn, prop_name) \
>>>> @@ -268,6 +279,11 @@ static inline bool of_have_populated_dt(void)
>>>> =A0#define for_each_child_of_node(parent, child) \
>>>> =A0 =A0 =A0 while (0)
>>>>
>>>> +static inline int of_get_child_count(const struct device_node *np=
)
>>>> +{
>>>> + =A0 =A0 return 0;
>>>> +}
>>>> +
>>>> =A0static inline int of_device_is_compatible(const struct device_n=
ode *device,
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 const char *name)
>>>> =A0{
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-ker=
nel" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.htm=
l
>>> Please read the FAQ at =A0http://www.tux.org/lkml/
>
