From: Mayuresh Chitale <mchitale@apm.com>
Subject: Re: [PATCH 3/4] arm64: dts: Add APM X-Gene PCIe DMA device tree nodes
Date: Wed, 7 Jan 2015 16:15:54 +0530
Message-ID: <CAL-zptPDU2qoot-aZMDwRmPQ_4QoCsqtQZ=kc-fN-Ts68qrVDQ@mail.gmail.com>
References: <1420608537-12296-1-git-send-email-mchitale@apm.com>
 <1420608537-12296-4-git-send-email-mchitale@apm.com>
 <6884775.IcL8KCPQhi@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <6884775.IcL8KCPQhi@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "jcm@redhat.com" <jcm@redhat.com>, "patches@apm.com" <patches@apm.com>, "ddutile@redhat.com" <ddutile@redhat.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

Actually the addresses are different. For e.g port 0 base address is
1F2B0000 and port 1 base address is 1F2C0000 and so on.

Thanks,
Mayuresh.

On Wed, Jan 7, 2015 at 2:07 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wednesday 07 January 2015 10:58:56 Mayuresh Chitale wrote:
>>
>> +               xpdma0: dma0@1f2b0154 {
>> +                       status = "disabled";
>> +                       compatible = "apm,xgene-pciedma";
>> +                       reg = < 0x0 0x1f2b0154 0x0 0xc
>> +                               0x0 0x1f2b0058 0x0 0x8>;
>> +                       interrupts = <0x0 0xc6 0x4>;
>> +               };
>> +
>> +               xpdma1: dma1@1f2c0154 {
>> +                       status = "disabled";
>> +                       compatible = "apm,xgene-pciedma";
>> +                       reg = < 0x0 0x1f2c0154 0x0 0xc
>> +                               0x0 0x1f2c0058 0x0 0x8>;
>> +                       interrupts = <0x0 0xcc 0x4>;
>> +               };
>> +
>>
>
> Something's wrong here: you have the same addresses for
> all the nodes but use different names. Please change the names
> to all say 'dma' and set the correct addresses.
>
>         Arnd
> --
> To unsubscribe from this list: send the line "unsubscribe dmaengine" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
