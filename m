From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] of/irq: add empty irq_of_parse_and_map() for non-dt builds
Date: Sat, 24 Mar 2012 21:42:00 +0530
Message-ID: <CAJuYYwQfNNO94_9nQnXH3xEoP6aWSJi4Hcpuh82N2xfGKJ4OnA@mail.gmail.com>
References: <1332581257-15989-1-git-send-email-thomas.abraham@linaro.org>
	<4F6DC847.8000902@gmail.com>
	<CAJuYYwR92M7faLaZxT8ycKZB=ORf5J8fELwFENaL_GK7dtG7ew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJuYYwR92M7faLaZxT8ycKZB=ORf5J8fELwFENaL_GK7dtG7ew@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, patches@linaro.org, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On 24 March 2012 21:37, Thomas Abraham <thomas.abraham@linaro.org> wrote:
> On 24 March 2012 18:42, Rob Herring <robherring2@gmail.com> wrote:
>> On 03/24/2012 04:27 AM, Thomas Abraham wrote:
>>> Add a empty irq_of_parse_and_map() that returns 0 for non-dt builds and
>>> avoid having #ifdef CONFIG_OF around all calls to irq_of_parse_and_map().
>>>
>>> Suggested-by: Grant Likely <grant.likely@secretlab.ca>
>>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>>> ---
>>
>> Acked-by: Rob Herring <rob.herring@calxeda.com>
>>
>> Go ahead and merge with the rest of your series.
>>
>> Rob
>
> Thanks Rob. It would be good if this patch goes via Grant's
> devicetree/next. The other patch series that I have posted would go
> via Samsung maintainer's dt-branch into which this patch can be merged
> from Grant's devicetree/next.
>
> Regards,
> Thomas.

Fixing lkml address and add Grant in Cc.
