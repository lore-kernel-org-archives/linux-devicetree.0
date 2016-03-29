From: Dinh Nguyen <dinh.linux@gmail.com>
Subject: Re: [PATCHv3 9/9] ARM: dts: Add Altera Arria10 L2 Cache EDAC
 devicetree entry
Date: Tue, 29 Mar 2016 07:15:38 -0500
Message-ID: <CADhT+wfb6DOpBV11zZY-HYMkwnQECu8J3=aM9z39Db+=3u9Wng@mail.gmail.com>
References: <1458576106-24505-1-git-send-email-tthayer@opensource.altera.com>
	<1458576106-24505-10-git-send-email-tthayer@opensource.altera.com>
	<20160329084549.GC3705@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20160329084549.GC3705@pd.tnic>
Sender: linux-doc-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: Thor Thayer <tthayer@opensource.altera.com>, dougthompson@xmission.com, m.chehab@samsung.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Dinh Nguyen <dinguyen@opensource.altera.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, linux-edac@vger.kernel.org, Linux List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thor Thayer <tthayer.linux@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Boris,


On Tue, Mar 29, 2016 at 3:45 AM, Borislav Petkov <bp@alien8.de> wrote:
> On Mon, Mar 21, 2016 at 11:01:46AM -0500, tthayer@opensource.altera.com wrote:
>> From: Thor Thayer <tthayer@opensource.altera.com>
>>
>> Add the device tree entries needed to support the Altera L2
>> cache EDAC on the Arria10 chip.
>>
>> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
>> ---
>> v2 Match register value (l2-ecc@ffd06010)
>> v3 Set ecc_manager to beginning of system_manager. Add sysman
>>    phandle. Move IRQs into ecc_manager from children.
>> ---
>>  arch/arm/boot/dts/socfpga_arria10.dtsi |   15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
>> index cce9e50..345ea97 100644
>> --- a/arch/arm/boot/dts/socfpga_arria10.dtsi
>> +++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
>> @@ -599,6 +599,21 @@
>>                       reg = <0xffe00000 0x40000>;
>>               };
>>
>> +             eccmgr: eccmgr@ffd06000 {
>> +                     compatible = "altr,socfpga-a10-ecc-manager";
>> +                     altr,sysmgr-syscon = <&sysmgr>;
>> +                     #address-cells = <1>;
>> +                     #size-cells = <1>;
>> +                     interrupts = <0 2 IRQ_TYPE_LEVEL_HIGH>,
>> +                                  <0 0 IRQ_TYPE_LEVEL_HIGH>;
>> +                     ranges;
>> +
>> +                     l2-ecc@ffd06010 {
>> +                             compatible = "altr,socfpga-a10-l2-ecc";
>> +                             reg = <0xffd06010 0x4>;
>> +                     };
>> +             };
>> +
>>               rst: rstmgr@ffd05000 {
>>                       #reset-cells = <1>;
>>                       compatible = "altr,rst-mgr";
>> --
>
> I've picked up all except this one: need an ACK for it too. Dinh, DT-people?
>

If you don't mind, I can take this patch. This will prevent merge
conflicts in the
DTS board files.

Thanks,
Dinh
