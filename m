From: "ivan.khoronzhuk" <ivan.khoronzhuk@ti.com>
Subject: Re: [PATCH 2/2] memory: ti-aemif: add bindings for AEMIF driver
Date: Tue, 3 Dec 2013 12:50:44 +0200
Message-ID: <529DB784.5010308@ti.com>
References: <1384962416-14862-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1384962416-14862-3-git-send-email-ivan.khoronzhuk@ti.com>
 <20131120182102.GK14627@ns203013.ovh.net> <528D076A.8070806@ti.com>
 <C0B815B0-E394-494C-88A2-78A0DBFA23DA@kernel.crashing.org>
 <5298ABFA.8070804@ti.com> <5298AE74.7020804@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <5298AE74.7020804@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Santosh Shilimkar <santosh.shilimkar@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Rob Landley <rob@landley.net>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11/29/2013 05:10 PM, Santosh Shilimkar wrote:
> On Friday 29 November 2013 10:00 AM, Grygorii Strashko wrote:
>> Hi Kumar Gala,
>>
>> On 11/22/2013 11:06 PM, Kumar Gala wrote:
>>>
>>> On Nov 20, 2013, at 1:03 PM, ivan.khoronzhuk <ivan.khoronzhuk@ti.com> w=
rote:
>>>
>>>> On 11/20/2013 08:21 PM, Jean-Christophe PLAGNIOL-VILLARD wrote:
>>>>>> +				the chip select signal.
>>>>>> +				Minimum value is 1 (0 treated as 1).
>>>>>> +
>>>>>> +- ti,cs-wsetup:		write setup width, ns
>>>>>> +				Time between the beginning of a memory cycle
>>>>>> +				and the activation of write strobe.
>>>>>> +				Minimum value is 1 (0 treated as 1).
>>>>>> +
>>>>>> +- ti,cs-wstrobe:	write strobe width, ns
>>>>>> +				Time between the activation and deactivation of
>>>>>> +				the write strobe.
>>>>>> +				Minimum value is 1 (0 treated as 1).
>>>>>> +
>>>>>> +- ti,cs-whold:		write hold width, ns
>>>>>> +				Time between the deactivation of the write
>>>>>> +				strobe and the end of the cycle (which may be
>>>>>> +				either an address change or the deactivation of
>>>>>> +				the chip select signal.
>>>>>> +				Minimum value is 1 (0 treated as 1).
>>>>>> +
>>>>>> +If any of the above parameters are absent, current parameter value =
will be taken
>>>>>> +from the corresponding HW reg.
>>>>>> +
>>>>>> +The name for cs node must be in format csN, where N is the cs numbe=
r.
>>>>>
>>>>> this is wired we should use reg instead to represent the cs as done f=
or SPI
>>>>> or a an other property
>>>>>
>>>>> Best Regards,
>>>>> J.
>>>>>
>>>>
>>>> Ok, I will add new property cs-chipselect like following :
>>>>
>>>> ti,cs-chipselect:	number of chipselect. Indicates on the
>>>> 			aemif driver which chipselect is used
>>>> 			for accessing the memory.
>>>> 			For compatibles "ti,davinci-aemif" and
>>>> 			"ti,keystone-aemif" it can be in range [0-3].
>>>> 			For compatible "ti,omap-L138-aemif" range is [2-5].
>>>>
>>>> Is it OK?
>>>
>>> Why do you need this? As it was mentioned just use reg:
>>>
>>> So you=92d have something like:
>>>
>>> memory-controller@21000A00 {
>>> 	=85
>>> 	nand:cs2@2 {
>>> 		reg =3D <2 0 0>;
>>> 		ranges;
>>> 		...
>>>
>>> 	}:
>>> };
>>
>> I'd prefer to continue with "ti,cs-chipselect" (this is more human frien=
dly definition, as for me),
>> but if you insist - it can be changed as:
>> memory-controller@21000A00 {
>> 	compatible =3D "ti,keystone-aemif";
>> ...
>>
>> 	cs2 {
>> 		compatible =3D "ti,aemif-cs";
>> 		reg =3D <2>;
>> ...
>> 	}
>>
>> 	cs0 {
>> 		compatible =3D "ti,aemif-cs";
>> 		reg =3D <0>;
>> ...
>> 	}
>>
>>>
>>> However, I=92m confused by the example in which you have:
>>>
>>> +		nand@0,0x8000000 {
>>> +			compatible =3D "ti,davinci-nand";
>>> +			reg =3D <0 0x8000000 0x4000000
>>> +			       1 0x0000000 0x0000100>;
>>> +
>>> +			.. see davinci-nand.txt
>>> +		};
>>>
>>> What chipselects is this on 0 & 1?
>>
>> As I described in https://lkml.org/lkml/2013/11/26/282 we are not encodi=
ng CS number in reg
>>   - it's memory partition number.
>>
>> Also, I'd like to note that we *DO NOT introduce* NAND device bindings h=
ere.
>> The Davinci NAND bindings was introduced and accepted more then one year=
 ago, and
>> we've just updated its a bit (keeping full compatibility) and reused
>> (see https://lkml.org/lkml/2013/11/21/182).
>> And the CS number is encoded for Davinci NAND node using standalone prop=
erty
>> "ti,davinci-chipselect" and we need to provide (2) two memory ranges to =
it,
>> as result we can't encode CS number in "reg" for AEMIF child devices (NA=
ND/NOR/etc),
>> as it will break bindings compatibility.
>>
>> In this document, NAND node is used just as an example of child node.
>>
> The above should have been really captured in the commit log to get a bet=
ter
> picture. No way on earth, a reviewer can figure out whether this is new b=
indings
> or copy of bindings already used.
>
> Regards,
> Santosh
>

Ok, I will add it.

-- =

Regards,
Ivan Khoronzhuk

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
