From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH RESEND v10 3/4] PHY: add APM X-Gene SoC 15Gbps
 Multi-purpose PHY driver
Date: Thu, 27 Feb 2014 11:32:23 +0530
Message-ID: <530ED4EF.1060000@ti.com>
References: <1393308882-3964-1-git-send-email-lho@apm.com>
 <1393308882-3964-2-git-send-email-lho@apm.com>
 <1393308882-3964-3-git-send-email-lho@apm.com>
 <1393308882-3964-4-git-send-email-lho@apm.com> <530DB713.6000701@ti.com>
 <CAPw-ZT=eLbxt3wPL7hrZFtxTP9vGxbRyBY2Yoh77pq9ypphCaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAPw-ZT=eLbxt3wPL7hrZFtxTP9vGxbRyBY2Yoh77pq9ypphCaw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Loc Ho <lho@apm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Suman Tripathi <stripathi@apm.com>, Arnd Bergmann <arnd@arndb.de>, Jon Masters <jcm@redhat.com>, "patches@apm.com" <patches@apm.com>, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Don Dutile <ddutile@redhat.com>, Tejun Heo <tj@kernel.org>, Tuan Phan <tphan@apm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thursday 27 February 2014 02:15 AM, Loc Ho wrote:
> Hi,
>
>>>
>>> +config PHY_XGENE
>>> +       tristate "APM X-Gene 15Gbps PHY support"
>>> +       depends on ARM64 || COMPILE_TEST
>>> +       select GENERIC_PHY
>>
>>
>> depends on HAS_IOMEM and CONFIG_OF..
>
> I will make it depends as "HAS_IOMEM && OF && (ARM64 || COMPILE_TEST)
>
>>>
>>> +/* PLL Clock Macro Unit (CMU) CSR accessing from SDS indirectly */
>>> +#define CMU_REG0                       0x00000
>>> +#define  CMU_REG0_PLL_REF_SEL_MASK     0x00002000
>>> +#define  CMU_REG0_PLL_REF_SEL_SET(dst, src)    \
>>> +               (((dst) & ~0x00002000) | (((u32)(src) << 0xd) & 0x00002000))
>>
>>
>> using decimals for shift value would be better. No strong feeling though.
>
> I will change to integer value.
>
>>> +/*
>>> + * For chip earlier than A3 version, enable this flag.
>>> + * To enable, pass boot argument phy_xgene.preA3Chip=1
>>> + */
>>> +static int preA3Chip;
>>> +MODULE_PARM_DESC(preA3Chip, "Enable pre-A3 chip support (1=enable 0=disable)");
>>> +module_param_named(preA3Chip, preA3Chip, int, 0444);
>>
>>
>> Do we need to have module param for this? I mean we can differentiate between
>> different chip versions in dt data only.
>
> This is only required for the short term. Once all the pre-A3 system
> are replaced, there isn't an need for this. For those who still has an
> pre-A3 silicon system, this would provide an short term solution for
> them. DT isn't quite correct here. This is an global thing. I guess I
> can OR all node. If it is still better to put in the DT, let me know
> and I will move it.
>
>>> +
>>> +static void sds_wr(void __iomem *csr_base, u32 indirect_cmd_reg,
>>> +                  u32 indirect_data_reg, u32 addr, u32 data)
>>> +{
>>> +       u32 val;
>>> +       u32 cmd;
>>> +
>>> +       cmd = CFG_IND_WR_CMD_MASK | CFG_IND_CMD_DONE_MASK;
>>> +       cmd = CFG_IND_ADDR_SET(cmd, addr);
>>
>>
>> This looks hacky. If 'CFG_IND_WR_CMD_MASK | CFG_IND_CMD_DONE_MASK' should be set then it should be part of the second argument. From the macro 'CFG_IND_ADDR_SET' the first argument should be more like the current value present in the register right? I feel the macro (CFG_IND_ADDR_SET) is not used in the way it is intended to.
>
> The macro XXX_SET is intended to update an field within the register.
> The update field is returned. The first assignment lines are setting
> another field. Those two lines can be written as:
>
> cmd = 0;
> cmd |= CFG_IND_WR_CMD_MASK;            ==> Set the CMD bit
> cmd |= CFG_IND_CMD_DONE_MASK;        ==> Set the DONE bit
> cmd = CFG_IND_ADDR_SET(cmd, addr);    ===> Set the field ADDR

#define  CFG_IND_ADDR_SET(dst, src) \
		(((dst) & ~0x003ffff0) | (((u32)(src)<<4) & 0x003ffff0))

 From this macro the first argument should be the present value in that 
register. Here you reset the address bits and write the new address bits.
IMO the first argument should be the value in 'csr_base + 
indirect_cmd_reg'. So it resets the address bits in 'csr_base + 
indirect_cmd_reg' and write down the new address bits.

Thanks
Kishon
