From: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFC PATCH 02/10] MIPS: Octeon: Add device tree source files.
Date: Wed, 23 Feb 2011 18:22:43 -0800
Message-ID: <4D65C0F3.8030503@caviumnetworks.com>
References: <1298408274-20856-1-git-send-email-ddaney@caviumnetworks.com>
	<1298408274-20856-3-git-send-email-ddaney@caviumnetworks.com>
	<20110223000759.GA26300@yookeroo>
	<4D655AB6.80400@caviumnetworks.com>
	<20110223234923.GA4932@yookeroo>
	<4D65BB17.4060703@caviumnetworks.com>
	<20110224021440.GD26300@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110224021440.GD26300@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/23/2011 06:14 PM, David Gibson wrote:
> On Wed, Feb 23, 2011 at 05:57:43PM -0800, David Daney wrote:
>> On 02/23/2011 03:49 PM, David Gibson wrote:
>>> On Wed, Feb 23, 2011 at 11:06:30AM -0800, David Daney wrote:
>>>> On 02/22/2011 04:07 PM, David Gibson wrote:
>>>>> On Tue, Feb 22, 2011 at 12:57:46PM -0800, David Daney wrote:
>>>>>> Signed-off-by: David Daney<ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
>>>>>> ---
>>>>>>   arch/mips/cavium-octeon/.gitignore      |    2 +
>>>>>>   arch/mips/cavium-octeon/Makefile        |   13 ++
>>>>>>   arch/mips/cavium-octeon/octeon_3xxx.dts |  314 +++++++++++++++++++++++++++++++
>>>>>>   arch/mips/cavium-octeon/octeon_68xx.dts |   99 ++++++++++
>>>>>>   4 files changed, 428 insertions(+), 0 deletions(-)
>>>>>>   create mode 100644 arch/mips/cavium-octeon/.gitignore
>>>>>>   create mode 100644 arch/mips/cavium-octeon/octeon_3xxx.dts
>>>>>>   create mode 100644 arch/mips/cavium-octeon/octeon_68xx.dts
>>>>>>
>>>>>> diff --git a/arch/mips/cavium-octeon/.gitignore b/arch/mips/cavium-octeon/.gitignore
>>>>>> new file mode 100644
>>>>>> index 0000000..39c9686
>>>>>> --- /dev/null
>>>>>> +++ b/arch/mips/cavium-octeon/.gitignore
>>>>>> @@ -0,0 +1,2 @@
>>>>>> +*.dtb.S
>>>>>
>>>>> .dtb.S?
>>>>
>>>> I think I have the correct .gitignore syntax.
>>>
>>> What I meant was, where are you generating .dtb.S files that you need
>>> to ignore them?
>>>
>>
>> They are a byproduct of $(call cmd,dtc).
>>
>> Normally make removes them automatically, but if you abort at just
>> the right time, they can be left around.
>>
>> If it is objectionable, I can just remove that .gitignore bit.
>
> No, if they're byproducts of cmd,dtc they should be there.  I'm just a
> bit baffled as to why cmd,dtc would produce such byproducts.  dtc
> itself will convert dts ->  dtb without any extraneous intermediate
> steps.
>

I misspoke.

$(call cmd,dtc) does indeed just do the direct conversion.  There are 
other rules in scripts/Makefile.lib that convert the .dtb into a .dtb.o 
file that generate the .dtb.S files.

David Daney
