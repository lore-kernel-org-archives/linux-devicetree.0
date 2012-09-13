From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3.6.0-rc5] dt: introduce of_get_child to get child node
 by name.
Date: Thu, 13 Sep 2012 09:48:50 -0600
Message-ID: <50520062.2040107@wwwdotorg.org>
References: <1347534640-787-1-git-send-email-srinivas.kandagatla@st.com>
 <5051F838.5080002@wwwdotorg.org> <5051FAFA.4040507@st.com>
 <5051FF1A.7060507@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5051FF1A.7060507-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: bergner-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/13/2012 09:43 AM, Rob Herring wrote:
> On 09/13/2012 10:25 AM, Srinivas KANDAGATLA wrote:
>>
>> On 13/09/12 16:14, Stephen Warren wrote:
>>> On 09/13/2012 05:10 AM, Srinivas KANDAGATLA wrote:
>>>> From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
>>>>
>>>> This patch introduces of_get_child function to get a child node by its
>>>> name in a given parent node.
>>>>
>>>> Without this patch each driver code has to iterate the parent and do
>>>> a string compare, However having of_get_child libary function would
>>>> avoid code duplication, errors and is more convenient.
>>>>
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
>>> You forgot to Cc the drivers/of maintainers, Grant and Rob. I have here.
>>
>> Oops...
>>
>>>
>>> I can certainly see a use for this in many places; the "runtime
>>> interpreted power sequences" patch, and the regulator DT parsing code at
>>> least both could benefit from this.
> 
> I would think the power sequences code would always iterate over the nodes.

There are two stages to the power sequences code; the first finds the
"power-sequences" child node in the device itself (and should use this
new API), and the next iterates over all children in that node, and then
all children in those nodes.

>> There are at-least 7-8 places in the current kernel which could use this
>> function directly.
> 
> Care to point them out and preferably fix them then. That would be more
> convincing that this is needed.

drivers/mfd/tps6586x:tps6586x_parse_dt()'s call to
of_find_node_by_name() should be replaced by this function.

drivers/regulator/max8907-regulator.c:max8907_regulator_parse_dt() has
the same issue.

drivers/regulator/tps65910-regulator.c:tps65910_parse_dt_reg_data() has
the same issue.

Perhaps other regulators too; those are just the ones used on my platforms.

At least some of those three will be added during the 3.7 merge window,
so it'd be hard to fix in this patch without merging in a bunch of
dependencies first.
