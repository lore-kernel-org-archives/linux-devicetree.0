From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 3/3] arm64: dts: juno/rtsm: re-structure motherboard
 includes
Date: Thu, 10 May 2018 11:07:09 +0100
Message-ID: <fd05b1da-83aa-2177-8e99-23dcb7199856@arm.com>
References: <1525884291-18851-1-git-send-email-sudeep.holla@arm.com>
 <1525884291-18851-3-git-send-email-sudeep.holla@arm.com>
 <20180510094901.GR1027@e110455-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180510094901.GR1027@e110455-lin.cambridge.arm.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org



On 10/05/18 10:49, Liviu Dudau wrote:
> On Wed, May 09, 2018 at 05:44:51PM +0100, Sudeep Holla wrote:
>> It is a bit unorthodox to just include a file in the middle of a another
>> DTS file, it breaks the pattern from other device trees and also makes
>> it really hard to reference things across the files with phandles.
>>
>> Restructure the include for the Juno/RTSM motherboards to happen at the
>> top of the file, reference the target nodes directly, and indent the
>> motherboard .dtsi files to reflect their actual depth in the hierarchy.
>>
>> This is a purely syntactic change that result in the same DTB files from
>> the DTS/DTSI files. This is based on similar patch from Linus Walleij
>> for ARM Vexpress platforms.
> 
> A bit of bikeshedding here: the reason I've used the DT /include/
> here was that on decompilation of the DTB the nodes would have been in
> the natural order and easier to look for issues. Those were the early
> days and I can accept that the general practice has changed and we're
> using now the C preprocessor more. I don't have any strong feelings on
> how the DT looks nowadays, so:
>

I can understand. After this patch applied, I did hit an issue with
timer registration. I just posted a patch [1]

>>
>> Cc: Liviu Dudau <liviu.dudau@arm.com>
> 
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>
> 

Thanks for all the acks.

-- 
Regards,
Sudeep

[1]
https://lkml.kernel.org/r/1525881728-4858-1-git-send-email-sudeep.holla@arm.com
