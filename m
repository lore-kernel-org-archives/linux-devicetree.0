From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH RESEND v10 3/4] PHY: add APM X-Gene SoC 15Gbps
 Multi-purpose PHY driver
Date: Thu, 27 Feb 2014 12:04:13 +0530
Message-ID: <530EDC65.8060106@ti.com>
References: <1393308882-3964-1-git-send-email-lho@apm.com>
 <1393308882-3964-2-git-send-email-lho@apm.com>
 <1393308882-3964-3-git-send-email-lho@apm.com>
 <1393308882-3964-4-git-send-email-lho@apm.com> <530DB713.6000701@ti.com>
 <CAPw-ZT=eLbxt3wPL7hrZFtxTP9vGxbRyBY2Yoh77pq9ypphCaw@mail.gmail.com>
 <530ED4EF.1060000@ti.com>
 <CAPw-ZTnLYbUjQTm7QhJO5EMNqN5+dtWndSRUZn_bgMGvmNEu0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAPw-ZTnLYbUjQTm7QhJO5EMNqN5+dtWndSRUZn_bgMGvmNEu0Q@mail.gmail.com>
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

On Thursday 27 February 2014 11:55 AM, Loc Ho wrote:
> Hi,
>
>>>>> +
>>>>> +static void sds_wr(void __iomem *csr_base, u32 indirect_cmd_reg,
>>>>> +                  u32 indirect_data_reg, u32 addr, u32 data)
>>>>> +{
>>>>> +       u32 val;
>>>>> +       u32 cmd;
>>>>> +
>>>>> +       cmd = CFG_IND_WR_CMD_MASK | CFG_IND_CMD_DONE_MASK;
>>>>> +       cmd = CFG_IND_ADDR_SET(cmd, addr);
>>>>
>>>>
>>>>
>>>> This looks hacky. If 'CFG_IND_WR_CMD_MASK | CFG_IND_CMD_DONE_MASK' should
>>>> be set then it should be part of the second argument. From the macro
>>>> 'CFG_IND_ADDR_SET' the first argument should be more like the current value
>>>> present in the register right? I feel the macro (CFG_IND_ADDR_SET) is not
>>>> used in the way it is intended to.
>>>
>>>
>>> The macro XXX_SET is intended to update an field within the register.
>>> The update field is returned. The first assignment lines are setting
>>> another field. Those two lines can be written as:
>>>
>>> cmd = 0;
>>> cmd |= CFG_IND_WR_CMD_MASK;            ==> Set the CMD bit
>>> cmd |= CFG_IND_CMD_DONE_MASK;        ==> Set the DONE bit
>>> cmd = CFG_IND_ADDR_SET(cmd, addr);    ===> Set the field ADDR
>>
>>
>> #define  CFG_IND_ADDR_SET(dst, src) \
>>                  (((dst) & ~0x003ffff0) | (((u32)(src)<<4) & 0x003ffff0))
>>
>>  From this macro the first argument should be the present value in that
>> register. Here you reset the address bits and write the new address bits.
>
> Yes.. This is correct. I am clearing x number of bit and then set new value.
>
>> IMO the first argument should be the value in 'csr_base + indirect_cmd_reg'.
>> So it resets the address bits in 'csr_base + indirect_cmd_reg' and write
>> down the new address bits.
>
> Yes.. The above code does just that. In addition, I am also setting
> the bits CFG_IND_WR_CMD_MASK and CFG_IND_CMD_DONE_MASK with the two
> previous statement. Think of the code flow as follow:
>
> val = readl(some void * address); /* read the register */

Where are you reading the register in your code (before CFG_IND_ADDR_SET)?
> val = XXXX_SET(val, 0x1);            /* set bit 0  - assuming XXXX set
> bit 0 only */
If you want to set other bits (other than address) don't use 
CFG_IND_ADDR_SET macro. That looks hacky to me.

> val = YYYY_SET(val, 0x1);          /* set bit 1 - assuming YYYY set
> bit 1 only */
> val = ZZZZ_SET(val, 0x5);            /* set upper 16 bit of the
> register to 0x5 - assuming ZZZZ set field of the upper 16 bits */
>
> Instead writing the above, I am replacing the above 4 lines with these
> two lines:
>
> cmd = CFG_IND_WR_CMD_MASK | CFG_IND_CMD_DONE_MASK;
> cmd = CFG_IND_ADDR_SET(cmd, addr);
>
> Is there clear?
>
> -Loc
>

Cheers
Kishon
