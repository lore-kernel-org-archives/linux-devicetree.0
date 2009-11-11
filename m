From: Rafal Jaworowski <raj-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Subject: Re: PCI bus node location
Date: Wed, 11 Nov 2009 15:17:52 +0100
Message-ID: <C75E76CB-73F3-4448-B643-364304ABB364@semihalf.com>
References: <B7D31A24-3361-4B80-81C4-5A815F09D42F@semihalf.com>
	<fa686aa40911091836s2a6b763aq14ece296cd7368db@mail.gmail.com>
	<20091110031218.GG26042@yookeroo.seuss>
	<839C8AA0-A8B5-434E-9175-16D2B84D74BD@semihalf.com>
	<20091110234412.GA3235@yookeroo.seuss>
Mime-Version: 1.0 (Apple Message framework v1076)
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20091110234412.GA3235-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 2009-11-11, at 00:44, David Gibson wrote:

> On Tue, Nov 10, 2009 at 05:55:33PM +0100, Rafal Jaworowski wrote:
>> On 2009-11-10, at 04:12, David Gibson wrote:
>>> On Mon, Nov 09, 2009 at 07:36:57PM -0700, Grant Likely wrote:
>>>> On Mon, Nov 9, 2009 at 12:20 PM, Rafal Jaworowski
> [snip]
>>> Right.
>>>
>>> Under the new scheme, the "soc" node is really a historical  
>>> misnomer -
>>> it represents just the things within the IMMR, not everything on the
>>> SoC.  A number of chips also have the localbus controller as a
>>> separate node, likewise within the SoC but not within the IMMR, so  
>>> not
>>> a child of the soc node.
>>
>> Hm, how do we know whether something belongs under the IMMR/CCSR
>> node or not (even though it physically sits there :-)?
>
> Well, the basic criterion is whether its registers are relocated with
> the rest of the IMMR.  Which would cover the PCI control registers, of
> course, but they're not there for the reasons given.  Yes, it's kind
> of nasty.

It seems like the soc/simple-bus node is currently a rather arbitrary  
subset of peripherals available through SOC internal registers range.  
My concern is that without clear grouping criteria this is quite  
confusing.

>> Is the 'soc' node going to be named something less confusing then?
>
> I think it should, but it's difficult to change because u-boot has
> dependencies on it.  I think there are a few newer trees where it's
> named IMMR.

So is device_type = "soc" deprecated now for new trees, and for this  
kind of a bus node the only legit differentiator is the compatible =  
"simple-bus" prop?

BTW: in ePAPR examples there is device_type = "simple-bus" in a 8572  
soc node, is this a bug or a leftover?

Rafal
