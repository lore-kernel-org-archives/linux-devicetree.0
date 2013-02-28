From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/4] documentation: add palmas dts definition
Date: Thu, 28 Feb 2013 12:07:24 -0700
Message-ID: <512FAAEC.5060004@wwwdotorg.org>
References: <1361164283-3133-1-git-send-email-j-keerthy@ti.com> <512E5144.9020105@wwwdotorg.org> <DC88CAD03C0052499C1907B327FC63229BCE15@DBDE01.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <DC88CAD03C0052499C1907B327FC63229BCE15@DBDE01.ent.ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: "J, KEERTHY" <j-keerthy@ti.com>
Cc: "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Cousson, Benoit" <b-cousson@ti.com>, "gg@slimlogic.co.uk" <gg@slimlogic.co.uk>
List-Id: devicetree@vger.kernel.org

On 02/28/2013 05:09 AM, J, KEERTHY wrote:
> Stephen Warren wrote at Thursday, February 28, 2013 12:03 AM:
>> On 02/17/2013 10:11 PM, J Keerthy wrote:
>>> Add the DTS definition for the palmas device including the MFD children.
>> ...
>>> diff --git a/Documentation/devicetree/bindings/mfd/palmas.txt

>>> +Required properties:
>>> +- compatible : Must be "ti,palmas";
>>
>> Do you need a version number there; will there be Palmas v1 HW, then
>> later Palmas v2 HW, and so on?
> 
> AFAIK there is no HW version.

My point was more: might there be in the future. However, I guess we can
go with a first compatible value that has no version, and for any future
device we can add the version to its compatible value then.

>>> +- interrupts : This i2c device has an IRQ line connected to the main SoC
>>> +- interrupt-controller : Since the palmas support several interrupts internally,
>>> +  it is considered as an interrupt controller cascaded to the SoC one.
>>> +- #interrupt-cells = <1>;
>>
>> Why not 2; can't any IRQ flags be represented in DT? 1 seems limiting
>> here unless the HW truly can't support configuration of IRQ input
>> polarity of edge-vs-level sensitivity.
> 
> From the register manual I see that only GPIO has the edge detect capability.
> I agree.

I'm not sure if you're agreeing that #interrupt-cells should be 2 here
as I suggested, or with the original code. you say "only GPIO has the
edge detect capability" which would imply that IRQs don't, which would
imply no need for a flags cell in DT, so #interrupt-cells=<1> would be
fine... But then you say "I agree" after I suggested that
#interrupt-cells=<2> might be better.

BTW, your mailer completely mangled the line-wrapping of my email,
making the parts you quoted rather harder to read.

>>> +Optional node:
>>> +- Child nodes contain in the palmas. The palmas family is made of several
>>> +  variants that support a different number of features.
>>> +  The child nodes will thus depend of the capability of the variant.
>>
>> Are there DT bindings for those child nodes anywhere?
>>
>> Representing each internal component as a separate DT node feels a
>> little like designing the DT bindings to model the Linux-internal MFD
>> structure. DT bindings should be driven by the HW design and OS-
>> agnostic.
>>
>> From a DT perspective, is there any need at all to create a separate DT
>> node for each component? This would only be needed or useful if the
>> child IP blocks (and hence DT bindings for those blocks) could be re-
>> used in other top-level devices that aren't represented by this top-
>> level ti,palmas DT binding. Are the HW IP blocks here re-used anywhere,
>> or will they be?
> 
> I guess for now I will drop this patch and will be taken up once we
> Finalize on the design.

The DT binding has to be fully defined before the code, or how do you
know what binding you're writing the code for? Dropping this patch and
then moving forward with posting it (which is what your statement
implies) doesn't seem correct.
