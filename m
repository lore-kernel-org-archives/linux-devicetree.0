From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v5 2/4] devicetree: bindings: Document Krait CPU/L1 EDAC
Date: Tue, 25 Feb 2014 14:48:38 -0600
Message-ID: <E34E6789-03BC-452C-9053-82CA1D027861@codeaurora.org>
References: <1389735034-21430-3-git-send-email-sboyd@codeaurora.org> <20140115102701.GA27314@e102568-lin.cambridge.arm.com> <20140115165623.GJ14405@codeaurora.org> <20140116013840.GA674@codeaurora.org> <20140116113332.GC25540@e102568-lin.cambridge.arm.com> <20140116180505.GA30925@codeaurora.org> <20140116183326.GG25540@e102568-lin.cambridge.arm.com> <20140116192617.GA13785@codeaurora.org> <20140117102109.GA22544@e102568-lin.cambridge.arm.com> <20140219002043.GE14769@codeaurora.org> <20140225111655.GA6855@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20140225111655.GA6855@e102568-lin.cambridge.arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Borislav Petkov <bp@alien8.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


On Feb 25, 2014, at 5:16 AM, Lorenzo Pieralisi <lorenzo.pieralisi@arm.c=
om> wrote:

> Hi Stephen,
>=20
> On Wed, Feb 19, 2014 at 12:20:43AM +0000, Stephen Boyd wrote:
>> (Sorry, this discussion stalled due to merge window + life events)
>=20
> Sorry for the delay in replying on my side too.
>=20
>> On 01/17, Lorenzo Pieralisi wrote:
>>> On Thu, Jan 16, 2014 at 07:26:17PM +0000, Stephen Boyd wrote:
>>>> On 01/16, Lorenzo Pieralisi wrote:
>>>>> On Thu, Jan 16, 2014 at 06:05:05PM +0000, Stephen Boyd wrote:
>>>>>> On 01/16, Lorenzo Pieralisi wrote:
>>>>>>> Do we really want to do that ? I am not sure. A cpus node is su=
pposed to
>>>>>>> be a container node, we should not define this binding just bec=
ause we
>>>>>>> know the kernel creates a platform device for it then.
>>>>>>=20
>>>>>> This is just copying more of the ePAPR spec into this document.
>>>>>> It just so happens that having a compatible field here allows a
>>>>>> platform device to be created. I don't see why that's a problem.
>>>>>=20
>>>>> I do not see why you cannot define a node like pmu or arch-timer =
and stick
>>>>> a compatible property in there. cpus node does not represent a de=
vice, and
>>>>> must not be created as a platform device, that's my opinion.
>>>>>=20
>>>>=20
>>>> I had what you're suggesting before in the original revision of
>>>> this patch. Please take a look at the original patch series[1]. I
>>>> suppose it could be tweaked slightly to still have a cache node
>>>> for the L2 interrupt and the next-level-cache pointer from the
>>>> CPUs.
>>>=20
>>> Ok, sorry, we are running around in circles here, basically you mov=
ed
>>> the node to cpus according to reviews. I still think that treating =
cpus
>>> as a device is not a great idea, even though I am in the same
>>> position with C-states and probably will add C-state tables in the =
cpus
>>> node.
>>>=20
>>> http://comments.gmane.org/gmane.linux.power-management.general/4101=
2
>>>=20
>>> I just would like to see under cpus nodes and properties that apply=
 to
>>> all ARM systems, and avoid defining properties (eg interrupts) that
>>> have different meanings for different ARM cores.
>>>=20
>>> The question related to why the kernel should create a platform dev=
ice
>>> out of cpus is still open. I really do not want to block your serie=
s
>>> for these simple issues but we have to make a decision and stick to=
 that,
>>> I am fine either way if we have a plan.
>>>=20
>>=20
>> Do you just want a backup plan in case we don't make a platform
>> device out of the cpus node? I believe we can always add code
>> somewhere to create a platform device at runtime if we detect the
>> cpus node has a compatible string equal to "qcom,krait". We could
>> probably change this driver's module_init() to scan the DT for
>> such a compatible string and create the platform device right
>> there. If we get more than one interrupt in the cpus node we can
>> add interrupt-names and then have software look for interrupts by
>> name instead of number.
>=20
> As I mentioned, I do not like the idea of adding compatible propertie=
s
> just to force the kernel to create platform devices out of device tre=
e
> nodes. On top of that I would avoid adding a compatible property
> to the cpus node (after all properties like enable-method are common =
for all
> cpus but still duplicated), my only concern being backward compatibil=
ity
> here (ie if we do that for interrupts, we should do that also for oth=
er
> common cpu nodes properties, otherwise we have different rules for
> different properties).
>=20
> I think you can then add interrupts to cpu nodes ("qcom,krait" specif=
ic),
> and as you mentioned create a platform device for that.
>=20
> Thanks,
> Lorenzo

So I agree with the statement about adding compatibles just to create p=
latform devices is wrong.  However its seems perfectly reasonable for a=
 cpu node to have a compatible property.  I don=92t see why a CPU is an=
y different from any other device described in a DT.

- k

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation
