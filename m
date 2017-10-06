From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v3 15/22] firmware: arm_scmi: abstract mailbox interface
Date: Fri, 6 Oct 2017 19:04:13 +0530
Message-ID: <CABb+yY0DiDTKUkVrCDkx8_czfp2p6enzs7w_FRJpy91GDs9wXQ@mail.gmail.com>
References: <1506604306-20739-1-git-send-email-sudeep.holla@arm.com>
 <1506604306-20739-16-git-send-email-sudeep.holla@arm.com> <CAK8P3a0EUr_aEZdOrjHixzp44yXqsNxTMzBceSBTmk-x8x2MAg@mail.gmail.com>
 <f316b938-c6d5-3aa9-4f03-6b5c6ad4bfa7@arm.com> <CABb+yY0SmQaPgBxan44a_Sx2mFuuiPcMz41J1yjqfO5irPTYig@mail.gmail.com>
 <4b1ea5ac-1b50-901f-e33a-5af1f04f8a8f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4b1ea5ac-1b50-901f-e33a-5af1f04f8a8f@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, ALKML <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Roy Franz <roy.franz@cavium.com>, Harb Abdulhamid <harba@codeaurora.org>, Nishanth Menon <nm@ti.com>, Loc Ho <lho@apm.com>, Alexey Klimov <alexey.klimov@arm.com>, Ryan Harkin <Ryan.Harkin@arm.com>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 6, 2017 at 6:57 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
>
> On 06/10/17 12:34, Jassi Brar wrote:
>> On Wed, Oct 4, 2017 at 5:02 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>>
>>> Also, I have added shim only for specific controllers that need them.
>>> E.g. ARM MHU as Jassi disagreed to add doorbell mechanism to that.
>>> mbox_if provides default implementation that just calls direct mailbox
>>> APIs.
>>>
>> Yeah you could hack away the MHU driver to make your life easy at the
>> cost of duplicated code and extra DT bindings, but for a moment think
>> what if your development platform wasn't MHU but, say, Rockchip
>> mailbox controller?
>>
>
> As mentioned before I understand your concern. But the point is this
> needs to be replicated with each protocol on that controller.
>
Only generic protocols need to have a platform specific transport
layer. There's no escaping that.

> So as Arnd
> pointed out we can reduce that by generalizing common things like doorbell.
>
Rockchip, and most other controllers, has no "doorbell". And yet each
is perfectly capable of supporting SCMI.
Looking forward to your "generalised doorbell".
