From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v5 11/20] firmware: arm_scmi: add support for polling
 based SCMI transfers
Date: Mon, 19 Feb 2018 11:50:42 +0000
Message-ID: <d1acd809-48d0-5889-0eb1-e52b68445dfe@arm.com>
References: <1514904162-11201-1-git-send-email-sudeep.holla@arm.com>
 <1514904162-11201-12-git-send-email-sudeep.holla@arm.com>
 <CAK8P3a31CMsLUSm0rsHLdvM4sbjZ6fwocKmA1JiuCtF97vj3PQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK8P3a31CMsLUSm0rsHLdvM4sbjZ6fwocKmA1JiuCtF97vj3PQ@mail.gmail.com>
Content-Language: en-US
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
Cc: Nishanth Menon <nm@ti.com>, DTML <devicetree@vger.kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Harb Abdulhamid <harba@codeaurora.org>, Ryan Harkin <Ryan.Harkin@arm.com>, LKML <linux-kernel@vger.kernel.org>, Roy Franz <roy.franz@cavium.com>, Alexey Klimov <klimov.linux@gmail.com>, Loc Ho <lho@apm.com>, Sudeep Holla <sudeep.holla@arm.com>, ALKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



On 19/02/18 11:32, Arnd Bergmann wrote:
> On Tue, Jan 2, 2018 at 3:42 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
> 
>> +#define SCMI_MAX_POLLING_TIMEOUT_NS    (100 * NSEC_PER_USEC)
>>  /**
>>   * scmi_do_xfer() - Do one transfer
>>   *
>> @@ -389,14 +406,30 @@ int scmi_do_xfer(const struct scmi_handle *handle, struct scmi_xfer *xfer)
> 
>> +       if (xfer->hdr.poll_completion) {
>> +               ktime_t stop, cur;
>> +
>> +               stop = ktime_add_ns(ktime_get(), SCMI_MAX_POLLING_TIMEOUT_NS);
>> +               do {
>> +                       udelay(5);
>> +                       cur = ktime_get();
>> +               } while (!scmi_xfer_poll_done(info, xfer) &&
>> +                        ktime_before(cur, stop));
> 
> The 5 microsecond back-off isn't that much smaller than the 100 microsecond
> timeout, given that udelay() often waits much longer than the specified time.
> 
> How did you come up with those two numbers? Are you sure this is better
> than just using a cpu_relax() instead of the udelay()?
> 

Somehow I assumed that cpu_relax will schedule out and since this is
called in the fast switching path, I can't do that. But now I see that
it's just an hint and so I can use it. Sorry for missing it earlier, you
did point this out in previous version and I retained it based on my
wrong assumption. Thanks.

-- 
Regards,
Sudeep
