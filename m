From: "ivan.khoronzhuk" <ivan.khoronzhuk@ti.com>
Subject: Re: [PATCH 2/2] memory: ti-aemif: add bindings for AEMIF driver
Date: Tue, 26 Nov 2013 19:23:00 +0200
Message-ID: <5294D8F4.6040409@ti.com>
References: <1384962416-14862-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1384962416-14862-3-git-send-email-ivan.khoronzhuk@ti.com>
 <20131120182102.GK14627@ns203013.ovh.net> <528D076A.8070806@ti.com>
 <C0B815B0-E394-494C-88A2-78A0DBFA23DA@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <C0B815B0-E394-494C-88A2-78A0DBFA23DA@kernel.crashing.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Kumar Gala <galak@kernel.crashing.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, grygorii.strashko@ti.com, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Rob Landley <rob@landley.net>, linux-mtd@lists.infradead.org, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11/22/2013 11:06 PM, Kumar Gala wrote:
>
> On Nov 20, 2013, at 1:03 PM, ivan.khoronzhuk <ivan.khoronzhuk@ti.com> wro=
te:
>
>> On 11/20/2013 08:21 PM, Jean-Christophe PLAGNIOL-VILLARD wrote:
>>>> +				the chip select signal.
>>>> +				Minimum value is 1 (0 treated as 1).
>>>> +
>>>> +- ti,cs-wsetup:		write setup width, ns
>>>> +				Time between the beginning of a memory cycle
>>>> +				and the activation of write strobe.
>>>> +				Minimum value is 1 (0 treated as 1).
>>>> +
>>>> +- ti,cs-wstrobe:	write strobe width, ns
>>>> +				Time between the activation and deactivation of
>>>> +				the write strobe.
>>>> +				Minimum value is 1 (0 treated as 1).
>>>> +
>>>> +- ti,cs-whold:		write hold width, ns
>>>> +				Time between the deactivation of the write
>>>> +				strobe and the end of the cycle (which may be
>>>> +				either an address change or the deactivation of
>>>> +				the chip select signal.
>>>> +				Minimum value is 1 (0 treated as 1).
>>>> +
>>>> +If any of the above parameters are absent, current parameter value wi=
ll be taken
>>>> +from the corresponding HW reg.
>>>> +
>>>> +The name for cs node must be in format csN, where N is the cs number.
>>>
>>> this is wired we should use reg instead to represent the cs as done for=
 SPI
>>> or a an other property
>>>
>>> Best Regards,
>>> J.
>>>
>>
>> Ok, I will add new property cs-chipselect like following :
>>
>> ti,cs-chipselect:	number of chipselect. Indicates on the
>> 			aemif driver which chipselect is used
>> 			for accessing the memory.
>> 			For compatibles "ti,davinci-aemif" and
>> 			"ti,keystone-aemif" it can be in range [0-3].
>> 			For compatible "ti,omap-L138-aemif" range is [2-5].
>>
>> Is it OK?
>
> Why do you need this? As it was mentioned just use reg:
>
> So you=92d have something like:
>
> memory-controller@21000A00 {
> 	=85
> 	nand:cs2@2 {
> 		reg =3D <2 0 0>;
> 		ranges;
> 		...
>
> 	}:
> };
>
> However, I=92m confused by the example in which you have:
>
> +		nand@0,0x8000000 {
> +			compatible =3D "ti,davinci-nand";
> +			reg =3D <0 0x8000000 0x4000000
It means, use memory of 0 AEMIF range beginning from 0x800000 (started =

from beginning of this range) and with size 0x4000000
> +			       1 0x0000000 0x0000100>;
It means, use memory of 1 AEMIF range + 0x0000000 and with size 0x0000100
> +
> +			.. see davinci-nand.txt
> +		};
>
> What chipselects is this on 0 & 1?
Any of them is not cs number. 0 - is just a memory range number.
>
> - k
>

The ranges property provides a means of defining a mapping or =

translation between the address space of the AEMIF and the address space =

of the cs nodes.

The reg property describes the address of the cs's resources within the =

address space defined by AEMIF. The reg is the memory range, not cs number.

See Grygorii Starshko comment on it, he described it very well.
			=

>>
>> --
>> Regards,
>> Ivan Khoronzhuk
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- =

Regards,
Ivan Khoronzhuk

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
