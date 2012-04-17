From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH v2 4/7] tegra: fdt: Add NAND controller binding
	and definitions
Date: Tue, 17 Apr 2012 13:45:37 -0500
Message-ID: <4F8DBA51.4040205@freescale.com>
References: <1334341777-2681-1-git-send-email-sjg@chromium.org>
	<1334341777-2681-5-git-send-email-sjg@chromium.org>
	<4F8894FD.70307@wwwdotorg.org>
	<CAPnjgZ1uXbLUtMTXd5siZsKSF5m3BZGRtkGiEYhK+PQO1PbpNQ@mail.gmail.com>
	<4F8DB8A9.4060506@freescale.com>
	<CAPnjgZ0OCibwkMRP4OLCou_vF8pOxh_Zgs1GwD_Zu4jWfSSfbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <CAPnjgZ0OCibwkMRP4OLCou_vF8pOxh_Zgs1GwD_Zu4jWfSSfbA@mail.gmail.com>
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

On 04/17/2012 01:44 PM, Simon Glass wrote:
> Hi,
> 
> On Tue, Apr 17, 2012 at 11:38 AM, Scott Wood <scottwood@freescale.com> wrote:
>> On 04/17/2012 01:33 PM, Simon Glass wrote:
>>> Hi Stephen,
>>>
>>> On Fri, Apr 13, 2012 at 2:05 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
>>>> On 04/13/2012 12:29 PM, Simon Glass wrote:
>>>>> +nand-controller@0x70008000 {
>>>>> +     compatible = "nvidia,tegra20-nand";
>>>>> +     wp-gpios = <&gpio 59 0>;                /* PH3 */
>>>>> +     nvidia,width = <8>;
>>>>> +     nvidia,timing = <26 100 20 80 20 10 12 10 70>;
>>>>> +     nand@0 {
>>>>> +             compatible = "hynix,hy27uf4g2b", "nand-flash";
>>>>
>>>> The TRM says there can be up to 8 chip selects. Don't the NAND device
>>>> sub-nodes need a reg property to indicate which chip-select they're on?
>>>
>>> We don't have driver support for this at present.
>>
>> That shouldn't matter.  The device tree is about describing the
>> hardware.  Ideally the device tree shouldn't have to change if in the
>> future you do get driver support for it.
>>
>> Also, unit addresses should only be present if reg is present, and they
>> should match.
> 
> OK I will leave @0 in there, and add a reg property to the node.

Also set #address-cells = <1> and #size-cells = <0> in the controller node.

-Scott
