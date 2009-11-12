From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: PCI bus node location
Date: Thu, 12 Nov 2009 00:30:41 -0700
Message-ID: <fa686aa40911112330q5adba2b6yd3106471d5401f56@mail.gmail.com>
References: <B7D31A24-3361-4B80-81C4-5A815F09D42F@semihalf.com>
	<fa686aa40911091836s2a6b763aq14ece296cd7368db@mail.gmail.com>
	<A3A4CAD4-BE74-4CD4-BFFA-FE616DF38811@semihalf.com>
	<20091111000540.GB3235@yookeroo.seuss>
	<8239D9E6-E390-4DED-81C1-77FACF05C1D4@semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <8239D9E6-E390-4DED-81C1-77FACF05C1D4-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rafal Jaworowski <raj-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 11, 2009 at 7:16 AM, Rafal Jaworowski <raj-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org> wrote:
>
> On 2009-11-11, at 01:05, David Gibson wrote:
>
>>> The current approach seems a bit of a maintenance problem: the PCI
>>> bridges control reg need to specify the whole address instead of
>>> just an offset, which is more error prone in case of changes (when a
>>
>> Well, yes. =A0And worse, it means there's two places that need to be
>> adjusted rather than one, if the the IMMR is relocated (which it can
>> be). =A0But it's a trade-off of this versus the inconvenience of dealing
>> with separate "control" and "bridge" nodes for the PCI and following
>> phandles between them.
>
> Would the technique with additional control node and a phandle complicate
> bindings handling much? The clear benefit is the ability to truly reflect
> hierarchy of devices available within IMMR/CCSR block.

No, it wouldn't be particularly more complex.  It would require a
couple of lines of extra code to follow the phandle to obtain some of
the data.

>>> number of places need to be adjusted etc.). What would need to be
>>> done/extended for the ranges prop you mention to allow for better
>>> handling cases like this?
>>
>> I don't really understand the question. =A0As Grant has said the
>> "correct" approach is to have one node representing the control
>> registers - located under the IMMR ("soc") node - and another
>> representing the PCI host bridge itself (which would be in its present
>> location). =A0There would need to be phandles linking the two. =A0It
>> doesn't really need any extension to the device tree semantics itself
>> - just a more complex binding for this device.
>
> Maybe I misunderstood Grant, my impression was that there was possible so=
me
> 'fixing' of ranges properties (which would be alternative to the control
> node approach).

Yes, the PCI node could be moved back into the IMMR node, but, no, it
wouldn't improve the accuracy of the device tree.  It would just be
different.

However, It sounds like we're debating the wrong thing.  Yes, we
should debate how best to describe hardware, but something you said
earlier in this thread raised a warning flag for me:

>>>> Thanks a lot for the historic perspective and explanations.
>>>> My concern with integrating this model into FreeBSD device
>>>> scheme abstraction was that I could not reflect the hierarchy
>>>> of DT resources directly, because two peer bus entities at the
>>>> same level (soc, pci) would ask for overlapping areas to manage
>>>> (which shouldn't happen); but I believe I got an idea how to
>>>> resolve this.

It *sounds* like you may be depending too heavily on the device tree
for making internal FreeBSD decisions about how to manage your
devices.  But there is a fair bit of expressive latitude in device
tree authorship, and you've got no guarantees that you won't have
things like overlapping ranges between nodes, or 'peer' devices having
completely different parent nodes.  It is risky to model internal
kernel implementation details on device tree structure.

For example, in the early days of device tree work, the of_platform
stuff was created for registering of_devices on the of_bus where there
is a 1:1 relationship between device tree nodes and of_device
instances.  However, in hindsight it was a mistake because of_platform
ends up being a clone of the platform bus, but of_drivers and
platform_drivers are not compatible.  What we should do is extract and
adapt the data in the device tree and convert it to a form usable by
the existing kernel infrastructure.

> Please note we are targetting ARM (and other arches in the future) besides
> PowerPC, so if there can be any lessons learnt from previous encounters I=
'd
> rather embrace them.

Biggest lesson: document and post bindings for new hardware early;
before merging drivers that use them, and definitely before shipping
equipment.  Common errors are caught easily by review.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
