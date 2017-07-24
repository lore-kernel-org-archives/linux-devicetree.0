From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 3/9] firmware: arm_scmi: add basic driver infrastructure
 for SCMI
Date: Mon, 24 Jul 2017 18:30:41 +0100
Message-ID: <39eeddc1-99fb-092a-a833-cf4024695d87@arm.com>
References: <1498492513-29771-4-git-send-email-sudeep.holla@arm.com>
 <1499446341-5956-1-git-send-email-jaswinder.singh@linaro.org>
 <5f2e4f3c-297b-c5f8-9244-399c1c4e2c21@arm.com>
 <CABb+yY3Xo-meg5bTZ5Cj1DAvf_0yOw0QB5Kq6U7VG+L_L+Mo3w@mail.gmail.com>
 <f165d171-a55b-662f-888c-3be2c3e8f11a@arm.com>
 <CABb+yY3NNUE7YXAhBLpMzVZkB7Kgx6iZk8a--crHa9Wpw6Ls4Q@mail.gmail.com>
 <cd935dab-06b8-a91b-d393-cfc2f085c600@arm.com>
 <CABb+yY0tX3kgAPTYOSqVMXwVPXFBYGwdwo5gy+TgdtRpZkwx6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABb+yY0tX3kgAPTYOSqVMXwVPXFBYGwdwo5gy+TgdtRpZkwx6Q@mail.gmail.com>
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
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Nishanth Menon <nm@ti.com>, "arnd@arndb.de" <arnd@arndb.de>, Harb Abdulhamid <harba@codeaurora.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Roy Franz <roy.franz@cavium.com>, Jassi Brar <jaswinder.singh@linaro.org>, DTML <devicetree@vger.kernel.org>, Loc Ho <lho@apm.com>, Matt Sealey <neko@bakuhatsu.net>, Sudeep Holla <sudeep.holla@arm.com>, Alexey Klimov <alexey.klimov@arm.com>, ALKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



On 24/07/17 18:21, Jassi Brar wrote:
> On Mon, Jul 24, 2017 at 9:51 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>> On 24/07/17 16:41, Jassi Brar wrote:
> 
>>> SCMI  calls
>>>     mbox_send_message(struct mbox_chan *chan, struct scmi_xfer *xfer);
>>>
>>> whereas the API expects
>>>     mbox_send_message(struct mbox_chan *chan, struct controller_specific *xfer);
>>>
>>
>> That's not hard to change ...
> 
> Cool, please change it and lets move on.
> 

But tell me why first ? You said it needs to work with any controller.
And now you say I need to change it to some controller_specific ptr,
won't that make it controller specific protocol ?

You responded on something you wanted ignoring all the other parts,
still waiting for those response.

1. Tell me how my changes to MHU and SCMI are related ?
2. How my MHU changes and PCC are different ? Why do you think
   this SCMI is FUBAR design which the clients using PCC are not ?

-- 
Regards,
Sudeep
