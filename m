From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/2] regulator: palmas: model SMPS10 as two regulators
Date: Thu, 20 Jun 2013 19:49:12 +0530
Message-ID: <51C30F60.3060100@ti.com>
References: <1371717458-10307-1-git-send-email-kishon@ti.com>
 <1371717458-10307-3-git-send-email-kishon@ti.com>
 <51C2DEEB.9090600@nvidia.com> <51C3089F.5030003@ti.com>
 <51C30B95.4010406@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51C30B95.4010406-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thursday 20 June 2013 07:33 PM, Laxman Dewangan wrote:
> On Thursday 20 June 2013 07:20 PM, Kishon Vijay Abraham I wrote:
>> Hi,
>>
>> On Thursday 20 June 2013 04:22 PM, Laxman Dewangan wrote:
>>> On Thursday 20 June 2013 02:07 PM, Kishon Vijay Abraham I wrote:
>>>> SMPS10 has two outputs OUT1 and OUT2 and have one input IN1.
>>>> SMPS10-OUT2 is connected to SMPS10-IN1 and can be configured either
>>>> in BOOST mode or BYPASS mode. regulator_enable of SMPS10-OUT2 configures
>>>> it in BOOST mode. For BYPASS mode regulator_allow_bypass() API can be
>>>> used. SMPS10-OUT1 is connected to SMPS10-OUT2 and can be enabled using
>>>> regulator_enable().
>>>>
>>>> Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> Signed-off-by: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
>>>> ---
>>>>    drivers/regulator/palmas-regulator.c |   39
>>>> ++++++++++++++++++++++++++++++----
>>>>    include/linux/mfd/palmas.h           |    9 ++++----
>>>>    2 files changed, 40 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/regulator/palmas-regulator.c
>>>> b/drivers/regulator/palmas-regulator.c
>>>> index 3ae44ac..7004bab 100644
>>>> --- a/drivers/regulator/palmas-regulator.c
>>>> +++ b/drivers/regulator/palmas-regulator.c
>>>> @@ -97,7 +97,12 @@ static const struct regs_info palmas_regs_info[] = {
>>>>            .ctrl_addr    = PALMAS_SMPS9_CTRL,
>>>>        },
>>>>        {
>>>> -        .name        = "SMPS10",
>>>> +        .name        = "SMPS10_OUT1",
>>>> +        .sname        = "smps10-out2",
>>>> +        .ctrl_addr    = PALMAS_SMPS10_CTRL,
>>>> +    },
>>>> +    {
>>>> +        .name        = "SMPS10_OUT2",
>>>>            .sname        = "smps10-in",
>>>>
>>> This sequence can create regulator to be never register.
>>> In probe, we register regulator from 0 to max_id.
>>> Here smps10-out1 comes first and see the supply as smps10-out2 which is not
>>> registered yet and so will fail with PROBE_DEFER
>>> When again it tries, the same issue.
>> hmm.. But I was able to get (regulator_get) *SMPS10_OUT1* without any issue
>> during my testing. From looking at the code, I couldn't see *sname* being used
>> anywhere.
>
> We used the sname as
> pmic->desc[id].supply_name = palmas_regs_info[id].sname;
>
> However, how you have populated your dt?
> Have you added like
> smps10-out2-supply = <&SMPS10_OUT2>
>
> for the palmas regualtor -dt.

I added the regulator data like

+                       smps10_out1_reg: smps10_out1 {
+                               regulator-name = "smps10_out1";
+                               regulator-min-microvolt = <5000000>;
+                               regulator-max-microvolt = <5000000>;
+                               regulator-always-on;
+                               regulator-boot-on;
+                               regulator-allow-bypass;
+                               ti,warm_sleep = <0>;
+                               ti,roof_floor = <0>;
+                               ti,mode_sleep = <0>;
+                               ti,warm_reset = <0>;
+                               ti,tstep = <0>;
+                               ti,vsel = <0>;
+                       };

and from my controller I reference it using
+               vbus-supply = <&smps10_out1_reg>;

and in the controller driver I use
+               vbus_reg = devm_regulator_get(dev, "vbus");

Thanks
Kishon
