From: Rob Herring <rob.herring@calxeda.com>
Subject: Re: Subject: L2x0 OF properties do not include interrupt #
Date: Wed, 10 Aug 2011 09:31:54 -0500
Message-ID: <4E42965A.9010500@calxeda.com>
References: <000201cc575b$c1229010$4367b030$@rutland@arm.com>
	<201108101609.56995.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201108101609.56995.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, linux@arm.linux.org.uk, Will Deacon <Will.Deacon@arm.com>, devicetree-discuss@lists.ozlabs.org, 'Barry Song' <21cnbao@gmail.com>, linux-kernel@vger.kernel.org, workgroup.linux@csr.com, 'Grant Likely' <grant.likely@secretlab.ca>, weizeng.he@csr.com, 'Olof Johansson' <olof@lixom.net>, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Arnd,

On 08/10/2011 09:09 AM, Arnd Bergmann wrote:
> On Wednesday 10 August 2011, Mark Rutland wrote:
> 
>> I realise I'm a bit late to the party here, but I'd like to propose adding an
>> optional interrupt parameter to the binding. I'm not aware of any
>> implementations which use separate interrupts, but given the binding
>> seems to be generic across L2CC implementations (and is not limited simply to
>> the L2x0), having a list rather than a single interrupt may be appropriate for
>> someone.
> 
> Sounds good, thanks for pointing this out.
> 
> How many possible interrupt sources are there? If there is only a small number
> of those (e.g. at most 4), we might just list all of them and register
> them from the driver even if they are all the same.
> 

Here's all the interrupts on the PL310:

DECERRINTR Decode error received on master ports from L3
SLVERRINTR Slave error received on master ports from L3
ERRRDINTR Error on L2 data RAM read
ERRRTINTR Error on L2 tag RAM read
ERRWDINTR Error on L2 data RAM write
ERRWTINTR Error on L2 tag RAM write
PARRDINTR Parity error on L2 data RAM read
PARRTINTR Parity error on L2 tag RAM read
ECNTRINTR Event Counter Overflow/Increment
L2CCINTR L2CC Combined Interrupt Output

It's likely that you would want to split these to different drivers.
EDAC for parity/bus errors and hw-events for event counters, for example.

Rob

>> This would boil down to (for the moment) a Documentation change along the lines of:
>>
>>> diff --git a/Documentation/devicetree/bindings/arm/l2cc.txt b/Documentation/devicetree/bindings/arm/l2cc.txt
>>> index f50e021..d4b387b 100644
>>> --- a/Documentation/devicetree/bindings/arm/l2cc.txt
>>> +++ b/Documentation/devicetree/bindings/arm/l2cc.txt
>>> @@ -28,6 +28,7 @@ Optional properties:
>>>  - arm,filter-ranges : <start length> Starting address and length of window to
>>>    filter. Addresses in the filter window are directed to the M1 port. Other
>>>    addresses will go to the M0 port.
>>> +- interrupt : A combined interrupt.
>>>  
>>>  Example:
>>>  
>>> @@ -39,4 +40,5 @@ L2: cache-controller {
>>>          arm,filter-latency = <0x80000000 0x8000000>;
>>>          cache-unified;
>>>          cache-level = <2>;
>>> +        interrupt = <45>;
>>>  };
>>
>> Any thoughts?
> 
> Do we also need to document an interrupt-parent property, or is that implied?
> 
> 	Arnd
