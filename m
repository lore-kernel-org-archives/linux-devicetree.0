From: Emil Medve <Emilian.Medve@Freescale.com>
Subject: Re: [PATCH 1/4] dt/bindings: Introduce the FSL QorIQ DPAA BMan
Date: Thu, 30 Oct 2014 11:19:45 -0500
Message-ID: <54526521.1090601@Freescale.com>
References: <1413986972-621-1-git-send-email-Emilian.Medve@Freescale.com>
 <EA33D307-CCDA-4A30-9386-46FA832FE0CA@codeaurora.org>
 <1414519738.23458.84.camel__4795.38602890006$1414521743$gmane$org@snotra.buserror.net>
 <54515ECB.70404@Freescale.com>
 <1414620996.23458.141.camel__29590.7804662876$1414621051$gmane$org@snotra.buserror.net>
 <5451BF49.6050106@Freescale.com>
 <1414680683.23458.148.camel__4514.07629666409$1414680744$gmane$org@snotra.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1414680683.23458.148.camel__4514.07629666409$1414680744$gmane$org@snotra.buserror.net>
Sender: linux-doc-owner@vger.kernel.org
To: Scott Wood <scottwood@Freescale.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, corbet@lwn.net, Geoff.Thorpe@Freescale.com, ijc+devicetree@hellion.org.uk, linux-doc@vger.kernel.org, linuxppc-dev@ozlabs.org, robh+dt@kernel.org, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hello Scott,


On 10/30/2014 09:51 AM, Scott Wood wrote:
> On Wed, 2014-10-29 at 23:32 -0500, Emil Medve wrote:
>> Hello Scott,
>>
>>
>> On 10/29/2014 05:16 PM, Scott Wood wrote:
>>> On Wed, 2014-10-29 at 16:40 -0500, Emil Medve wrote:
>>>> Hello Scott,
>>>>
>>>>
>>>> On 10/28/2014 01:08 PM, Scott Wood wrote:
>>>>> On Tue, 2014-10-28 at 09:36 -0500, Kumar Gala wrote:
>>>>>> On Oct 22, 2014, at 9:09 AM, Emil Medve <Emilian.Medve@freescale=
=2Ecom> wrote:
>>>>>>
>>>>>>> The Buffer Manager is part of the Data-Path Acceleration Archit=
ecture (DPAA).
>>>>>>> BMan supports hardware allocation and deallocation of buffers b=
elonging to
>>>>>>> pools originally created by software with configurable depletio=
n thresholds.
>>>>>>> This binding covers the CCSR space programming model
>>>>>>>
>>>>>>> Signed-off-by: Emil Medve <Emilian.Medve@Freescale.com>
>>>>>>> Change-Id: I3ec479bfb3c91951e96902f091f5d7d2adbef3b2
>>>>>>> ---
>>>>>>> .../devicetree/bindings/powerpc/fsl/bman.txt       | 98 +++++++=
+++++++++++++++
>>>>>>> 1 file changed, 98 insertions(+)
>>>>>>> create mode 100644 Documentation/devicetree/bindings/powerpc/fs=
l/bman.txt
>>>>>>
>>>>>> Should these really be in bindings/powerpc/fsl, aren=E2=80=99t y=
ou guys using this on ARM SoCs as well?
>>>>>
>>>>> The hardware on the ARM SoCs is different enough that I'm not sur=
e the
>>>>> same binding will cover it.  That said, putting things under <arc=
h>
>>>>> should be a last resort if nowhere else fits.
>>>>
>>>> OTC started ported the driver to the the ARM SoC and the feedback =
has
>>>> been that the driver needed minimal changes. The IOMMU has been th=
e only
>>>> area of concern, and a small change to the binding has been sugges=
ted
>>>
>>> Do we need something in the binding to indicate device endianness?
>>
>> As I said, I didn't have enough exposure to the ARM SoC so I can't
>> answer that
>>
>>> If this binding is going to continue to be relevant to future DPAA
>>> generations, I think we really ought to deal with the possibility t=
hat
>>> there is more than one datapath instance
>>
>> I'm unsure how relevant this will be going forward. In LS2 B/QMan is
>> abstracted/hidden away behind the MC (firmware).
>=20
> This is why I was wondering whether the binding would be at all the
> same...
>=20
>>  I wouldn't over-engineer this without a clear picture of what multi=
ple
>> data-paths per SoC even means at this point
>=20
> I don't think it's over-engineering.  Assuming only one instance of
> something is generally sloppy engineering.  Linux doesn't need to
> actually pay attention to it until and unless it becomes necessary, b=
ut
> it's good to have the information in the device tree up front.

I asked around and the "multiple data-path SoC" seems to be at this
point a speculation. It seems unclear how would it work, what
requirements/problems it would address/solve, what programming interfac=
e
it would have. I'm not sure what do you suggest we do

In order to reduce the sloppiness of this binding. I'll add a
memory-region phandle to connect each B/QMan node to their
reserved-memory node

>>> by having phandles and/or a parent container to connect the related
>>> components.
>>
>> Connecting the related components is beyond the scope of this bindin=
g.
>> It will soon hit the e-mail list(s) as part of upstreaming the Ether=
net
>> driver
>=20
> So you want us to merge this binding without being told how this work=
s?

This binding stands on its own and each block (B/QMan) can be used for
some useful purpose by itself. All other blocks/applications that use
the B/QMan use the same basic interface acquire/release a "buffer" and
enqueue/dequeue a "packet". I'm not sure what you feel I didn't share

> Or by "soon" do you mean before this binding is accepted?

No. The Ethernet driver, the QI SEC driver, RMan driver, etc. employ th=
e
B/QMan and *other* hardware resources in some specific way. I don't
think their binding/drivers condition accepting the B/QMan binding/driv=
er


Cheers,
