From: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>
Subject: Re: [PATCH v2] media: st-rc: Add ST remote control driver
Date: Thu, 29 Aug 2013 12:50:55 +0100
Message-ID: <521F359F.9030306@st.com>
References: <1377704030-3763-1-git-send-email-srinivas.kandagatla@st.com> <20130829091155.GA6162@pequod.mess.org> <521F307C.9040807@st.com> <20130829120146.GA7811@pequod.mess.org>
Reply-To: srinivas.kandagatla@st.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20130829120146.GA7811@pequod.mess.org>
Sender: linux-media-owner@vger.kernel.org
To: Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On 29/08/13 13:01, Sean Young wrote:
> On Thu, Aug 29, 2013 at 12:29:00PM +0100, Srinivas KANDAGATLA wrote:
>> On 29/08/13 10:11, Sean Young wrote:
>>> On Wed, Aug 28, 2013 at 04:33:50PM +0100, Srinivas KANDAGATLA wrote:
>>>> From: Srinivas Kandagatla <srinivas.kandagatla@st.com>
>>>> +config RC_ST
>>>> +	tristate "ST remote control receiver"
>>>> +	depends on ARCH_STI && LIRC && OF
>>>
>>> Minor nitpick, this should not depend on LIRC, it depends on RC_CORE.
>> Yes, I will make it depend on RC_CORE, remove OF as suggested by Mauro
>> CC and select LIRC to something like.
>>
>> depends on ARCH_STI && RC_CORE
>> select LIRC
> 
> The driver is usable with the kernel ir decoders, there is no need to 
> select LIRC or use lirc at all.
> 
> You can either define a remote in drivers/media/rc/keymaps and set 
> the rcdev->map_name, or it can be loaded at runtime using ir-keytable(1);
> either way you don't need to use a lirc userspace daemon.
Yep.. got it.
I will remove LIRC selection.

Thanks,
srini
> 
> 
> Sean
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
