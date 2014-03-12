From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [RFC PATCH] edac: zynq: Added EDAC support for zynq ddr ecc controller
Date: Wed, 12 Mar 2014 11:27:13 +0100
Message-ID: <c7840b9d-4c03-4680-9a0e-fb256f3743b4@AM1EHSMHS010.ehs.local>
References: <4adb2b4b-2ad6-42b9-929e-cc062f817245@TX2EHSMHS021.ehs.local> <20140310105655.GH14999@e106331-lin.cambridge.arm.com> <531DA900.5060202@monstr.eu> <fa35006e-055d-4ef2-9b65-a0f8cc6a0c8f@AM1EHSMHS016.ehs.local> <531ECA33.8050803@monstr.eu> <20140311155057.GJ13293@xsjandreislx>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140311155057.GJ13293@xsjandreislx>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>
Cc: Michal Simek <monstr@monstr.eu>, Mark Rutland <mark.rutland@arm.com>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, "dougthompson@xmission.com" <dougthompson@xmission.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "rob@landley.net" <rob@landley.net>, "kpc528@gmail.com" <kpc528@gmail.com>, "kalluripunnaiahchoudary@gmail.com" <kalluripun>
List-Id: devicetree@vger.kernel.org

On 03/11/2014 04:50 PM, S=C3=B6ren Brinkmann wrote:
> On Tue, 2014-03-11 at 09:32AM +0100, Michal Simek wrote:
>> On 03/10/2014 11:32 PM, S=C3=B6ren Brinkmann wrote:
>>> On Mon, 2014-03-10 at 12:58PM +0100, Michal Simek wrote:
>>>> On 03/10/2014 11:56 AM, Mark Rutland wrote:
>>>>> On Sun, Mar 09, 2014 at 02:57:16AM +0000, Punnaiah Choudary Kallu=
ri wrote:
>>>>>> Added EDAC support for reporting the ecc errors of zynq ddr cont=
roller.
>>>>>> The ddr ecc controller corrects single bit errors and detects do=
uble bit
>>>>>> errors
>>>>>>
>>>>>> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
>>>>>> ---
>>>>>>  .../devicetree/bindings/edac/zynq_edac.txt         |   18 +
>>>>>>  drivers/edac/Kconfig                               |    7 +
>>>>>>  drivers/edac/Makefile                              |    1 +
>>>>>>  drivers/edac/zynq_edac.c                           |  613 +++++=
+++++++++++++++
>>>>>>  4 files changed, 639 insertions(+), 0 deletions(-)
>>>>>>  create mode 100644 Documentation/devicetree/bindings/edac/zynq_=
edac.txt
>>>>>>  create mode 100644 drivers/edac/zynq_edac.c
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/edac/zynq_edac.tx=
t b/Documentation/devicetree/bindings/edac/zynq_edac.txt
>>>>>> new file mode 100644
>>>>>> index 0000000..c21ff83
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/edac/zynq_edac.txt
>>>>>> @@ -0,0 +1,18 @@
>>>>>> +Zynq EDAC driver, it does reports the DDR ECC single bit errors=
 that are
>>>>>> +corrected and double bit ecc errors that are detected by the DD=
R ECC controller.
>>>>>> +ECC support for DDR is available in half-bus width(16 bit) conf=
iguration only.
>>>>>> +
>>>>>> +Required properties:
>>>>>> +- compatible: Should be "xlnx,ps7-ddrc" or "xlnx,ps7-ddrc-1.00.=
a"
>>>>>
>>>>> Is this an or or a xor?
>>>>
>>>> Compatible string should be just xlnx,zynq-ddrc-1.00.a.
>>>> Nothing with ps7.
>>>
>>> Isn't this vendor IP? IMHO, this should be something completely
>>> different. Or if you want some Zynq-specific compat string it shoul=
d
>>> refer to an actual version string associated with Zynq. 1.00.a is n=
ot,
>>> AFAIK.
>>
>> I have checked with Punnaiah that this is Synopsys DDR memory contro=
ller.
>> Zynq is based on 1.4 version with some customization.
>> It means I think reasonable solution is
>> call it drivers/edac/synopsys_edac.c
>> rename zynq_ in driver to synopsys_ and
>> use xlnx,zynq-ddrc-1.00.a compatible string because zynq is not usin=
g
>> clean synopsys version.
>>
>> I am not getting point why you don't like 1.00.a suffix here.
>> Because of historical point of view compatible strings should be dif=
ferent
>> for early silicon, silicon v1, silicon v2, silicon v3, etc
>> but we haven't used it at all that's why we can use xilinx scheme
>> which we are using for our soft IPs.
>=20
> Well, but you refer to Zynq which has silicon revisions you can use t=
o
> refer to a specific Zynq version. That matches data sheets. Zynq-1.00=
=2Ea
> is just completely made up and wouldn't be found in any data sheet.

I didn't reply this one but we discussed this with Soren over phone.
No problem to use Synopsys version A07 according TRM.

Then compatible string is
xlnx,zynq-ddrc-A07 and file name is synopsys_edac.c

Soren: please correct me if I DDRC version is wrong.

Regarding silicon revision in compatible string let's start new thread
out of this ddrc one.

Thanks,
Michal
