From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH 2/2] memory: ti-aemif: add bindings for AEMIF driver
Date: Fri, 29 Nov 2013 10:08:01 -0500
Message-ID: <5298ADD1.7050203@ti.com>
References: <1384962416-14862-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1384962416-14862-3-git-send-email-ivan.khoronzhuk@ti.com>
 <20131120182102.GK14627@ns203013.ovh.net> <528D076A.8070806@ti.com>
 <20131122184247.GO14627@ns203013.ovh.net> <5298AB08.3090108@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <5298AB08.3090108@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, gregkh@linuxfoundation.org, Linus Walleij <linus.walleij@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Rob Landley <rob@landley.net>, "ivan.khoronzhuk" <ivan.khoronzhuk@ti.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Friday 29 November 2013 09:56 AM, Grygorii Strashko wrote:
> Hi Jean-Christophe,
> 
> On 11/22/2013 08:42 PM, Jean-Christophe PLAGNIOL-VILLARD wrote:
>> On 21:03 Wed 20 Nov     , ivan.khoronzhuk wrote:
>>> On 11/20/2013 08:21 PM, Jean-Christophe PLAGNIOL-VILLARD wrote:
>>>>> +				the chip select signal.
>>>>> +				Minimum value is 1 (0 treated as 1).
>>>>> +
>>>>> +- ti,cs-wsetup:		write setup width, ns
>>>>> +				Time between the beginning of a memory cycle
>>>>> +				and the activation of write strobe.
>>>>> +				Minimum value is 1 (0 treated as 1).
>>>>> +
>>>>> +- ti,cs-wstrobe:	write strobe width, ns
>>>>> +				Time between the activation and deactivation of
>>>>> +				the write strobe.
>>>>> +				Minimum value is 1 (0 treated as 1).
>>>>> +
>>>>> +- ti,cs-whold:		write hold width, ns
>>>>> +				Time between the deactivation of the write
>>>>> +				strobe and the end of the cycle (which may be
>>>>> +				either an address change or the deactivation of
>>>>> +				the chip select signal.
>>>>> +				Minimum value is 1 (0 treated as 1).
>>>>> +
>>>>> +If any of the above parameters are absent, current parameter value will be taken
>>>>> +from the corresponding HW reg.
>>>>> +
>>>>> +The name for cs node must be in format csN, where N is the cs number.
>>>>
>>>> this is wired we should use reg instead to represent the cs as done for SPI
>>>> or a an other property
>>>>
>>>> Best Regards,
>>>> J.
>>>>
>>>
>>> Ok, I will add new property cs-chipselect like following :
>>>
>>> ti,cs-chipselect:	number of chipselect. Indicates on the
>>> 			aemif driver which chipselect is used
>>> 			for accessing the memory.
>>> 			For compatibles "ti,davinci-aemif" and
>>> 			"ti,keystone-aemif" it can be in range [0-3].
>>> 			For compatible "ti,omap-L138-aemif" range is [2-5].
>>>
>>> Is it OK?
>>
>> yes
>>
>> I just have one issue the whole memory concept
>>
>> for me we should do as done on pinctrl have a phandle on the device that
>> require it and handle it at device core level
>>
>> as the memory controller is not necessarely on the same bus as the memory
>> device them selves
> 
> Could you clarify your point a bit, pls?
> Are you talking about external ASRAM, NOR and NAND chips wired to CS interface?
> 
Thats probably what he means.
The mtd devices can be interface with different memory controllers having different
layouts to set-up timing registers. If these layouts were standard, then it would
have been possible to manage the information at the core layers.

Regards,
Santosh



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
