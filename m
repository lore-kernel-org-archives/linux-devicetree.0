From: Kumar Gala <galak@kernel.crashing.org>
Subject: Re: [PATCH] Add device file bindings for MAPLE
Date: Mon, 5 Aug 2013 17:26:23 -0500
Message-ID: <02BD0D75-437A-4653-B7F9-856373F58763@kernel.crashing.org>
References: <1375354963-11219-1-git-send-email-shaveta@freescale.com>
 <5C32ABF4-ECC3-4F1C-82D0-EA3AD9053575@kernel.crashing.org>
 <1375737065.13074.58.camel@snotra.buserror.net>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1375737065.13074.58.camel@snotra.buserror.net>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Scott Wood <scottwood@freescale.com>
Cc: Shaveta Leekha <shaveta@freescale.com>, devicetree-discuss@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


On Aug 5, 2013, at 4:11 PM, Scott Wood wrote:

> On Thu, 2013-08-01 at 11:05 -0500, Kumar Gala wrote:
>> On Aug 1, 2013, at 6:02 AM, Shaveta Leekha wrote:
>> 
>>> Signed-off-by: Shaveta Leekha <shaveta@freescale.com>
>>> ---
>>> .../devicetree/bindings/powerpc/fsl/maple.txt      |   30 ++++++++++++++++++++
>>> 1 files changed, 30 insertions(+), 0 deletions(-)
>>> create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/maple.txt
>>> 
>>> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/maple.txt b/Documentation/devicetree/bindings/powerpc/fsl/maple.txt
>>> new file mode 100644
>>> index 0000000..da51c5f
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/powerpc/fsl/maple.txt
>>> @@ -0,0 +1,30 @@
>>> +* Freescale MAPLE Multi Accelerator Platform Engine Baseband 3
>>> +  (MAPLE-B3)device nodes
>>> +
>>> +Supported chips:
>>> +Example: B4860
>>> +
>>> +Required properties:
>>> +
>>> +- compatible:	Should contain "fsl,maple-b3-liodn" as the value
>>> +		This identifies Multi Accelerator Platform Engine
>>> +		Baseband 3 block.This representation is required
>>> +		for doing the PAMU/LIODN programming on the Linux side.
>> 
>> This compatible makes no sense, we shouldn't be marking a full HW block with some name that is just intended for LIODN convenance.
> 
> The point is we're not describing the whole block here, because the rest
> of the block is owned by an external entity (the DSP cores).

So the binding should make that far more clear that the MAPLE would be controlled by DSP SW.

> 
>> Is this version 3 of the block?  If so a name like "fsl,maple-v3" or "fsl,maple-v3.0" would be more appropriate.
>> 
>> - k
>> 
>>> +
>>> +- reg:		offset and length of the register set for the device
>>> +

So the reg should limit itself to the LIODN registers only.

>>> +Devices that have LIODNs need to specify links to the parent PAMU controller
>>> +(the actual PAMU controller that this device is connected to) and a pointer to
>>> +the LIODN register, if applicable.
>> 
>> 
>> Does Maple not have any IRQs associated with it?
> 
> maple-liodn doesn't.
> 
> -Scott
> 
> 
