From: Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH] of: define of_find_node_by_phandle for !CONFIG_OF
Date: Thu, 18 Jun 2015 12:25:08 -0500
Message-ID: <5582FEF4.3090708@ti.com>
References: <1434560033-26681-1-git-send-email-s-anna@ti.com> <CAL_JsqKHFwhsdYmhq2_DJS+mf1jPcfCuSQgwCusTriv-NPLEdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKHFwhsdYmhq2_DJS+mf1jPcfCuSQgwCusTriv-NPLEdg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>
List-Id: devicetree@vger.kernel.org

On 06/17/2015 06:33 PM, Rob Herring wrote:
> On Wed, Jun 17, 2015 at 11:53 AM, Suman Anna <s-anna@ti.com> wrote:
>> Define stub implementation for of_find_node_by_phandle() API
>> so that users of this API can build properly even when CONFIG_OF
>> is not defined.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
> 
> Do you have a user for this? If not, apply it when you do.

Yeah, ran into a randconfig build problem on x86 when we tried to add an
API to remoteproc core [1] that used this function.

regards
Suman

[1] http://marc.info/?l=devicetree&m=143232772426559&w=2

> 
> Acked-by: Rob Herring <robh@kernel.org>
> 
>> ---
>>  include/linux/of.h | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index ddeaae6d2083..90dfdc47ae26 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -422,6 +422,11 @@ static inline struct device_node *of_find_node_opts_by_path(const char *path,
>>         return NULL;
>>  }
>>
>> +static inline struct device_node *of_find_node_by_phandle(phandle handle)
>> +{
>> +       return NULL;
>> +}
>> +
>>  static inline struct device_node *of_get_parent(const struct device_node *node)
>>  {
>>         return NULL;
>> --
>> 2.4.1
>>
