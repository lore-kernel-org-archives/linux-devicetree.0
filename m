From: okaya@codeaurora.org
Subject: Re: [PATCH 10/10] dmaengine: qcom_hidma: add MSI support for
 interrupts
Date: Mon, 08 Aug 2016 07:48:13 -0400
Message-ID: <7b7153195677daafda84cbf1eddd47f9@codeaurora.org>
References: <1468867177-15007-1-git-send-email-okaya@codeaurora.org>
 <1468867177-15007-11-git-send-email-okaya@codeaurora.org>
 <20160724064256.GA9681@localhost>
 <e6560c8b-e18e-9e32-5b51-c1c12d8551ce@codeaurora.org>
 <20160804124641.GE9681@localhost>
 <497ddb6c-0233-657f-72c6-b844b798ff11@codeaurora.org>
 <20160808081415.GV9681@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160808081415.GV9681@localhost>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: dmaengine@vger.kernel.org, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, jcm@redhat.com, eric.auger@linaro.org, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Williams, Dan J" <dan.j.williams@intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2016-08-08 04:14, Vinod Koul wrote:
> On Thu, Aug 04, 2016 at 09:59:43AM -0400, Sinan Kaya wrote:
>> On 8/4/2016 8:46 AM, Vinod Koul wrote:
>> >> > Yes, I do have a new device ID for platforms with MSI capability.
>> >> >
>> >> > Which new binding are you referring to?
>> > If you have "QCOM8062" why do you need DT to tell hidma-1.1 ?
>> 
>> Unfortunately, DT cannot do a binding with the ACPI names. Similarly, 
>> ACPI
>> cannot do a binding with the DT name.
>> 
>> The structure of binding name is also subject to different kind of 
>> rules
>> for DT and ACPI.
>> 
>> This driver supports both device tree and ACPI. That's why, two 
>> different
>> names are required.
> 
> Hmmm, wasn't the who get_property stuff supposed to make properties 
> work on
> both ACPi & DT. I am not sure though about the current state of affairs 
> on
> that.


Get property works. It is able to abstract device driver properties. A 
driver doesn't need to know whether it is coming from acpi dsd or of.

However, no such mechanism exists for driver names due to nature of 
different naming requirements.

Of has its own match table and acpi has its own. Acpi also has 
ridiculous 8 character name limitation.
