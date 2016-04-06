From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH v3 1/5] Documentation: DT: vdma: Rename vdma-chan prefix
 to dma-chan
Date: Wed, 6 Apr 2016 23:16:11 +0200
Message-ID: <57057C9B.8040804@metafoo.de>
References: <1459959335-24083-1-git-send-email-appanad@xilinx.com>
 <1459959335-24083-2-git-send-email-appanad@xilinx.com>
 <20160406162022.GS23198@xsjsorenbubuntu>
 <C246CAC1457055469EF09E3A7AC4E11A4A57364B@XAP-PVEXMBX01.xlnx.xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <C246CAC1457055469EF09E3A7AC4E11A4A57364B@XAP-PVEXMBX01.xlnx.xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, Michal Simek <michals@xilinx.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "moritz.fischer@ettus.com" <moritz.fischer@ettus.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "luis@debethencourt.com" <luis@debethencourt.com>, Srikanth Vemula <svemula@xilinx.com>, Anirudha Sarangi <anirudh@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengin>
List-Id: devicetree@vger.kernel.org

On 04/06/2016 06:25 PM, Appana Durga Kedareswara Rao wrote:
> Hi Soren,
>=20
>=20
>> -----Original Message-----
>> From: S=C3=B6ren Brinkmann [mailto:soren.brinkmann@xilinx.com]
>> Sent: Wednesday, April 06, 2016 9:50 PM
>> To: Appana Durga Kedareswara Rao <appanad@xilinx.com>
>> Cc: robh+dt@kernel.org; pawel.moll@arm.com; mark.rutland@arm.com;
>> ijc+devicetree@hellion.org.uk; galak@codeaurora.org; Michal Simek
>> <michals@xilinx.com>; vinod.koul@intel.com; dan.j.williams@intel.com=
;
>> Appana Durga Kedareswara Rao <appanad@xilinx.com>;
>> moritz.fischer@ettus.com; laurent.pinchart@ideasonboard.com;
>> luis@debethencourt.com; Srikanth Vemula <svemula@xilinx.com>; Anirud=
ha
>> Sarangi <anirudh@xilinx.com>; devicetree@vger.kernel.org; linux-arm-
>> kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
>> dmaengine@vger.kernel.org
>> Subject: Re: [PATCH v3 1/5] Documentation: DT: vdma: Rename vdma-cha=
n
>> prefix to dma-chan
>>
>> On Wed, 2016-04-06 at 21:45:31 +0530, Kedareswara rao Appana wrote:
>>> This patch renames the vdma-mm2s-channel/vdma-s2mm-channel
>>> property with dma-mm2s-channel/dma-s2mm-channel to sync with the
>>> driver.
>>>
>>> Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
>>> ---
>>> Changes for v3:
>>> ---> New patch.
>>>
>>>  Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt | 8
>>> ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
>>> b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
>>> index a86737c..762938f 100644
>>> --- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
>>> +++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
>>> @@ -24,8 +24,8 @@ Optional properties:
>>>  	{3}, flush s2mm channel
>>>
>>>  Required child node properties:
>>> -- compatible: It should be either "xlnx,axi-vdma-mm2s-channel" or
>>> -	"xlnx,axi-vdma-s2mm-channel".
>>> +- compatible: It should be either "xlnx,axi-dma-mm2s-channel" or
>>> +	"xlnx,axi-dma-s2mm-channel".
>>
>> This change is not backwards compatible and breaks every user of the=
 current
>> binding.
>=20
> This commit http://git.kernel.org/cgit/linux/kernel/git/vkoul/slave-d=
ma.git/commit/?h=3Dnext&id=3D8e66e7d682b04f7141f8ae666908c8dcd7fc0bfa=20
> Renames xilinx_vdma_ prefix to xilinx_dma which includes renaming of =
the above properties.
> The patch (dmaengine: vdma: Rename xilinx_vdma_ prefix to xilinx_dma)=
 already got applied in the dma-next tree.
> That's why sent this patch to sync with the current driver I mean lat=
est driver.

The correct solution for this is to revert that part of the change ASAP=
,
since, as Soeren pointed out, it breaks all existing users.

Thanks,
- Lars
