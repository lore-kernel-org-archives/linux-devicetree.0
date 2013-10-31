From: Ming Lei <tom.leiming@gmail.com>
Subject: Re: [RFC 4/9] of/irq: Refactor interrupt-map parsing
Date: Thu, 31 Oct 2013 09:19:44 +0800
Message-ID: <CACVXFVM5EMb+zs_ep-Hj3zt2+zKrTb9X7_FANHxfegebYvG43Q@mail.gmail.com>
References: <1381869563-16083-1-git-send-email-grant.likely@linaro.org>
	<1381869563-16083-5-git-send-email-grant.likely@linaro.org>
	<CAOesGMj03kgJXttm80pHvPYeqg5hOaeOJAJ4DA8tf5LxqdArrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOesGMj03kgJXttm80pHvPYeqg5hOaeOJAJ4DA8tf5LxqdArrQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Kevin Hilman <khilman@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 30, 2013 at 12:23 AM, Olof Johansson <olof@lixom.net> wrote:
> Hi,
>
> On Tue, Oct 15, 2013 at 1:39 PM, Grant Likely <grant.likely@linaro.org> wrote:
>> All the users of of_irq_parse_raw pass in a raw interrupt specifier from
>> the device tree and expect it to be returned (possibly modified) in an
>> of_phandle_args structure. However, the primary function of
>> of_irq_parse_raw() is to check for translations due to the presence of
>> one or more interrupt-map properties. The actual placing of the data
>> into an of_phandle_args structure is trivial. If it is refactored to
>> accept an of_phandle_args structure directly, then it becomes possible
>> to consume of_phandle_args from other sources. This is important for an
>> upcoming patch that allows a device to be connected to more than one
>> interrupt parent. It also simplifies the code a bit.
>>
>> The biggest complication with this patch is that the old version works
>> on the interrupt specifiers in __be32 form, but the of_phandle_args
>> structure is intended to carry it in the cpu-native version. A bit of
>> churn was required to make this work. In the end it results in tighter
>> code, so the churn is worth it.
>>
>> Signed-off-by: Grant Likely <grant.likely@linaro.org>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>
> This patch stopped exynos/arndale from booting when it hit next (i.e.
> last night). I bisected down to this commit.

+1, :-)

>
> It seems that the platform is getting stuck calibrating delay loop,
> i.e. it is not getting interrupts. Let me know if you want me to
> collect more data of some sort.



Thanks,
-- 
Ming Lei
