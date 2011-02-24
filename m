From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [RFC PATCH 02/10] MIPS: Octeon: Add device tree source files.
Date: Wed, 23 Feb 2011 17:57:43 -0800
Message-ID: <4D65BB17.4060703@caviumnetworks.com>
References: <1298408274-20856-1-git-send-email-ddaney@caviumnetworks.com> <1298408274-20856-3-git-send-email-ddaney@caviumnetworks.com> <20110223000759.GA26300@yookeroo> <4D655AB6.80400@caviumnetworks.com> <20110223234923.GA4932@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110223234923.GA4932@yookeroo>
Sender: linux-kernel-owner@vger.kernel.org
To: David Gibson <david@gibson.dropbear.id.au>, linux-mips@linux-mips.org, ralf@linux-mips.org, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 02/23/2011 03:49 PM, David Gibson wrote:
> On Wed, Feb 23, 2011 at 11:06:30AM -0800, David Daney wrote:
>> On 02/22/2011 04:07 PM, David Gibson wrote:
>>> On Tue, Feb 22, 2011 at 12:57:46PM -0800, David Daney wrote:
>>>> Signed-off-by: David Daney<ddaney@caviumnetworks.com>
>>>> ---
>>>>   arch/mips/cavium-octeon/.gitignore      |    2 +
>>>>   arch/mips/cavium-octeon/Makefile        |   13 ++
>>>>   arch/mips/cavium-octeon/octeon_3xxx.dts |  314 +++++++++++++++++++++++++++++++
>>>>   arch/mips/cavium-octeon/octeon_68xx.dts |   99 ++++++++++
>>>>   4 files changed, 428 insertions(+), 0 deletions(-)
>>>>   create mode 100644 arch/mips/cavium-octeon/.gitignore
>>>>   create mode 100644 arch/mips/cavium-octeon/octeon_3xxx.dts
>>>>   create mode 100644 arch/mips/cavium-octeon/octeon_68xx.dts
>>>>
>>>> diff --git a/arch/mips/cavium-octeon/.gitignore b/arch/mips/cavium-octeon/.gitignore
>>>> new file mode 100644
>>>> index 0000000..39c9686
>>>> --- /dev/null
>>>> +++ b/arch/mips/cavium-octeon/.gitignore
>>>> @@ -0,0 +1,2 @@
>>>> +*.dtb.S
>>>
>>> .dtb.S?
>>
>> I think I have the correct .gitignore syntax.
>
> What I meant was, where are you generating .dtb.S files that you need
> to ignore them?
>

They are a byproduct of $(call cmd,dtc).

Normally make removes them automatically, but if you abort at just the 
right time, they can be left around.

If it is objectionable, I can just remove that .gitignore bit.


>>>> +  compatible = "octeon,octeon";
>>>
>>> There's no model number at all for this board?
>>
>>
>> I think it should be:
>>
>> 	compatible = "octeon,octeon-3860";
>
> That looks better.
>
> Also, the part before the comma is generally the vendor, so I would
> have expected cavium,XXX throughout rather than octeon,XXX.

OK, I will do that instead.


[...]
>>>> +      device_type = "network";
>>>> +      model = "mgmt";
>>>> +      reg =<0x10700 0x00100000 0x0 0x100>, /* MIX */
>>>> +<0x11800 0xE0000000 0x0 0x300>, /* AGL */
>>>> +<0x11800 0xE0000400 0x0 0x400>, /* AGL_SHARED  */
>>>> +<0x11800 0xE0002000 0x0 0x8>;   /* AGL_PRT_CTL */
>>>> +      unit-number =<0>;
>>>
>>> What is this 'unit-number' property for?
>>
>> The AGL_SHARED register bank is shared among all the octeon-5230-mii
>> devices.  the 'unit-number' indicates the bit-field index that this
>> device should use within those registers.
>
> Ok.  'cell-index' is the normal property name for this sort of
> purpose.

Thanks, I will use 'cell-index'.

David Daney
