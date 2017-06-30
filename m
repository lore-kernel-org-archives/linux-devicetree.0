From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 1/9] Documentation: dt-bindings: add support for mailbox
 client shared memory
Date: Fri, 30 Jun 2017 11:24:03 +0100
Message-ID: <6ca6f182-ca0d-2f89-690c-ed0041ccb498@arm.com>
References: <1498492513-29771-1-git-send-email-sudeep.holla@arm.com>
 <1498492513-29771-2-git-send-email-sudeep.holla@arm.com>
 <20170628225633.rvfwc4s6rfqwo2jb@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170628225633.rvfwc4s6rfqwo2jb@rob-hp-laptop>
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
To: Rob Herring <robh@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, DTML <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Harb Abdulhamid <harba@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>, Roy Franz <roy.franz@cavium.com>, Loc Ho <lho@apm.com>, Matt Sealey <neko@bakuhatsu.net>, Sudeep Holla <sudeep.holla@arm.com>, Alexey Klimov <alexey.klimov@arm.com>, ALKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



On 28/06/17 23:56, Rob Herring wrote:
> On Mon, Jun 26, 2017 at 04:55:05PM +0100, Sudeep Holla wrote:
>> Many users of the mailbox controllers depend on the shared memory between the
>> two end points to exchange the main data while using simple doorbell mechanism
>> to alert the end points of the presence of a message.
> 
> "dt-bindings: mailbox: ..." for the subject.
> 

Fixed locally now.

>>
>> This patch defines device tree bindings to represent such shared memory in a
>> generic way.
>>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
>> ---
>>  .../devicetree/bindings/mailbox/mailbox.txt        | 28 ++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
> 
> Otherwise,
> 
> Acked-by: Rob Herring <robh@kernel.org>
> 

Thanks

-- 
Regards,
Sudeep
