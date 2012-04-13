From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH v2 4/7] tegra: fdt: Add NAND controller binding
	and definitions
Date: Fri, 13 Apr 2012 14:07:33 -0500
Message-ID: <4F887975.5040702@freescale.com>
References: <1334341777-2681-1-git-send-email-sjg@chromium.org>
	<1334341777-2681-5-git-send-email-sjg@chromium.org>
	<4F8873D1.2010701@freescale.com>
	<CAPnjgZ0Avc3j8k1RiS8deS92sR_cDS9QfyUGX8-by=cpMR8sbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <CAPnjgZ0Avc3j8k1RiS8deS92sR_cDS9QfyUGX8-by=cpMR8sbw@mail.gmail.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree@theia.denx.de, Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 04/13/2012 02:01 PM, Simon Glass wrote:
> Hi Scott,
> 
> On Fri, Apr 13, 2012 at 11:43 AM, Scott Wood <scottwood@freescale.com> wrote:
>> On 04/13/2012 01:29 PM, Simon Glass wrote:
>>> Add a NAND controller along with a bindings file for review.
>>>
>>> Signed-off-by: Simon Glass <sjg@chromium.org>
>>> ---
>>> Changes in v2:
>>> - Update NAND binding to add "nvidia," prefix
>>>
>>>  arch/arm/dts/tegra20.dtsi                     |    6 ++
>>>  doc/device-tree-bindings/nand/nvidia-nand.txt |   68 +++++++++++++++++++++++++
>>>  2 files changed, 74 insertions(+), 0 deletions(-)
>>>  create mode 100644 doc/device-tree-bindings/nand/nvidia-nand.txt
>>>
>>> diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
>>> index bc64f42..7be0462 100644
>>> --- a/arch/arm/dts/tegra20.dtsi
>>> +++ b/arch/arm/dts/tegra20.dtsi
>>> @@ -200,4 +200,10 @@
>>>               reg = <0x7000f400 0x200>;
>>>       };
>>>
>>> +     nand: nand-controller@0x70008000 {
>>
>> s/nand-controller@/flash@/ (or "nand@" if you really want -- there's
>> enough of that in use already)
> 
> Changed to flash@.
> 
> I am a little concerned that we are co-mingling the controller with
> the device, but I think this is ok.

No, you're right -- it should be something like nand-controller@.  For
some reason I didn't notice the node split when I wrote that.

>>> +             #address-cells = <0>;
>>> +             #size-cells = <0>;
>>> +             compatible = "nvidia,tegra20-nand";
>>> +             reg = <0x70008000 0x100>;
>>> +     };
>>>  };
>>> diff --git a/doc/device-tree-bindings/nand/nvidia-nand.txt b/doc/device-tree-bindings/nand/nvidia-nand.txt
>>> new file mode 100644
>>> index 0000000..b19ce8e
>>> --- /dev/null
>>> +++ b/doc/device-tree-bindings/nand/nvidia-nand.txt
>>> @@ -0,0 +1,68 @@
>>> +NAND Flash
>>> +----------
>>> +
>>> +(there isn't yet a generic binding in Linux, so this describes what is in
>>> +U-Boot)
>>
>> Ideally the binding should not be Linux-specific or U-Boot specific --
>> it's just the binding that describes this hardware.
> 
> Agreed, but trying to agree a binding in Linux in the absence of a
> driver may be beyond my powers.

It shouldn't be, and if it is then we should move on to a better binding
repository (Grant set up devicetree.org for this a while back, but I'm
not sure what the process is for considering a binding there to be final).

-Scott
