From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2 4/7] tegra: fdt: Add NAND controller binding
	and definitions
Date: Fri, 13 Apr 2012 12:16:45 -0700
Message-ID: <CAPnjgZ0=ZGPLGCBhB5POczKhOdnRMOcBNny1DH-=gLHjioX3jg@mail.gmail.com>
References: <1334341777-2681-1-git-send-email-sjg@chromium.org>
	<1334341777-2681-5-git-send-email-sjg@chromium.org>
	<4F8873D1.2010701@freescale.com>
	<CAPnjgZ0Avc3j8k1RiS8deS92sR_cDS9QfyUGX8-by=cpMR8sbw@mail.gmail.com>
	<4F887975.5040702@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4F887975.5040702@freescale.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Scott Wood <scottwood@freescale.com>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Scott,

On Fri, Apr 13, 2012 at 12:07 PM, Scott Wood <scottwood@freescale.com> wrot=
e:
> On 04/13/2012 02:01 PM, Simon Glass wrote:
>> Hi Scott,
>>
>> On Fri, Apr 13, 2012 at 11:43 AM, Scott Wood <scottwood@freescale.com> w=
rote:
>>> On 04/13/2012 01:29 PM, Simon Glass wrote:
>>>> Add a NAND controller along with a bindings file for review.
>>>>
>>>> Signed-off-by: Simon Glass <sjg@chromium.org>
>>>> ---
>>>> Changes in v2:
>>>> - Update NAND binding to add "nvidia," prefix
>>>>
>>>> =A0arch/arm/dts/tegra20.dtsi =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A06 ++
>>>> =A0doc/device-tree-bindings/nand/nvidia-nand.txt | =A0 68 ++++++++++++=
+++++++++++++
>>>> =A02 files changed, 74 insertions(+), 0 deletions(-)
>>>> =A0create mode 100644 doc/device-tree-bindings/nand/nvidia-nand.txt
>>>>
>>>> diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
>>>> index bc64f42..7be0462 100644
>>>> --- a/arch/arm/dts/tegra20.dtsi
>>>> +++ b/arch/arm/dts/tegra20.dtsi
>>>> @@ -200,4 +200,10 @@
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x7000f400 0x200>;
>>>> =A0 =A0 =A0 };
>>>>
>>>> + =A0 =A0 nand: nand-controller@0x70008000 {
>>>
>>> s/nand-controller@/flash@/ (or "nand@" if you really want -- there's
>>> enough of that in use already)
>>
>> Changed to flash@.
>>
>> I am a little concerned that we are co-mingling the controller with
>> the device, but I think this is ok.
>
> No, you're right -- it should be something like nand-controller@. =A0For
> some reason I didn't notice the node split when I wrote that.

OK, changed it back.

>
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0>;
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra20-nand";
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x70008000 0x100>;
>>>> + =A0 =A0 };
>>>> =A0};
>>>> diff --git a/doc/device-tree-bindings/nand/nvidia-nand.txt b/doc/devic=
e-tree-bindings/nand/nvidia-nand.txt
>>>> new file mode 100644
>>>> index 0000000..b19ce8e
>>>> --- /dev/null
>>>> +++ b/doc/device-tree-bindings/nand/nvidia-nand.txt
>>>> @@ -0,0 +1,68 @@
>>>> +NAND Flash
>>>> +----------
>>>> +
>>>> +(there isn't yet a generic binding in Linux, so this describes what i=
s in
>>>> +U-Boot)
>>>
>>> Ideally the binding should not be Linux-specific or U-Boot specific --
>>> it's just the binding that describes this hardware.
>>
>> Agreed, but trying to agree a binding in Linux in the absence of a
>> driver may be beyond my powers.
>
> It shouldn't be, and if it is then we should move on to a better binding
> repository (Grant set up devicetree.org for this a while back, but I'm
> not sure what the process is for considering a binding there to be final).

Well we probably agree there should be a new repo for this. This is
going to the right mailing list (Devicetree Discuss), so people can
chime in as needed.

>
> -Scott
>

Regards,
Simon
