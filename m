Return-Path: <sudeep.holla@arm.com>
Message-ID: <53DBCF74.3030301@arm.com>
Date: Fri, 01 Aug 2014 18:33:40 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
MIME-Version: 1.0
Subject: Re: [PATCHv9 2/4] mailbox: Introduce framework for mailbox
References: <1406055250-29159-1-git-send-email-jaswinder.singh@linaro.org>	<1406055374-29275-1-git-send-email-jaswinder.singh@linaro.org>	<53DA7DBD.10704@arm.com>	<CAJe_ZheReu3whEmuQ6T1AO4VPbaFa=e9kQgFWB0-uJQhFBs_fA@mail.gmail.com>	<53DB6035.8080002@arm.com>	<CAJe_Zhc7pH-n5SX5wc161gZJ_m+J3xL2hHTvrAe84e3nm23Qgg@mail.gmail.com>	<53DB8A36.9040405@arm.com> <CAJe_ZheEeKpc2TZG5a4QD34Jqhj-sCvAZbkdoaeruv9GCZogwg@mail.gmail.com>
In-Reply-To: <CAJe_ZheEeKpc2TZG5a4QD34Jqhj-sCvAZbkdoaeruv9GCZogwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ks.giri@samsung.com" <ks.giri@samsung.com>, "arnd@arndb.de" <arnd@arndb.de>, "ijc@hellion.org.uk" <ijc@hellion.org.uk>, Mark Rutland <Mark.Rutland@arm.com>, "robh@kernel.org" <robh@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "courtney.cavin@sonymobile.com" <courtney.cavin@sonymobile.com>, "mporter@linaro.org" <mporter@linaro.org>, "slapdau@yahoo.com.au" <slapdau@yahoo.com.au>, "lftan.linux@gmail.com" <lftan.linux@gmail.com>, "loic.pallardy@st.com" <loic.pallardy@st.com>, "s-anna@ti.com" <s-anna@ti.com>, "ashwin.chaugule@linaro.org" <ashwin.chaugule@linaro.org>, "bjorn@kryo.se" <bjorn@kryo.se>, "patches@linaro.org" <patches@linaro.org>, "t.takinishi@jp.fujitsu.com" <t.takinishi@jp.fujitsu.com>, "broonie@linaro.org" <broonie@linaro.org>, "khilman@linaro.org" <khilman@linaro.org>, "mollie.wu@linaro.org" <mollie.wu@linaro.org>, "andy.green@linaro.org" <andy.green@linaro.org>, "lee.jones@linaro.org" <lee.jones@linaro.org>
List-ID: <devicetree@vger.kernel.org>



On 01/08/14 17:38, Jassi Brar wrote:
> On 1 August 2014 18:08, Sudeep Holla <sudeep.holla@arm.com> wrote:
>> On 01/08/14 13:28, Jassi Brar wrote:
>>>
>>>>>> Probably this is discussed already, but again I missed to find it
>>>>>> in archives, so asking here. If the protocol has some payload
>>>>>> associated
>>>>>> with the message and controller expects it to be in place before
>>>>>> calling
>>>>>> send_data, we essentially end up not using this queue at all by wait=
ing
>>>>>> in the protocol layer(may be in it's own queue)
>>>>>>
>>>>> Why essentially?
>>>>>      The 'data' is a void *  i.o.w the packet format is a completely
>>>>> internal understanding between a controller and a client. The 'data'
>>>>> can point to a copy of payload that the controller driver sets up in
>>>>> the shared payload region as the first thing in send_data() callback.
>>>>> OR, like my 'server' type platform, where the access is serialized to
>>>>> the shared payload region.
>>>>>
>>>>
>>>> Yes that's exactly what I have now. But based on your driver I thought
>>>> that the shared memory should not be associated with the mailbox
>>>> controller
>>>> and should be completely handled in the protocol/client.
>>>>
>>>> Also to handle async packet from remote, controller has to pass shared
>>>> memory pointer always to the client to read the data as the buffer won=
't
>>>> to ready in such case. So I thought it's good idea to handle shared
>>>> memory
>>>> completely in client/protocol.
>>>>
>>> Again ur platform has the freedom. The async client should have a free
>>> packet to copy the data as soon as it arrives.
>>> My platform divides the SHM into two parts - one for each direction.
>>>
>>
>> I understand that, but I wanted to know what's the general
>> recommendation for mailbox controller drivers. Do they need to be
>> associated with the shared memory or is it left the protocol ?
>>
> The framework already provides for either way ('data' may point to
> signal/code as well as payload info).
> I would leave the decision to the platforms that share the controller
> driver. Otherwise by 'recommending' a scheme we may end up controller
> drivers implement code that nobody ever uses.
>     Personally, I would write a controller driver that manages only the
> resources within the controller and leave SHM for clients to manage.
> However, if a controller can't convey enough info on its own (like a
> simple irq raise) and no meaningful IPC can be had without SHM, then
> the driver may assume SHM to always be used.
>

Thanks for the confirmation, this is exactly what had in mind too when
I first raised question on prepare_data.

>> The main reason I am asking is that the MHU driver you had didn't
>> deal with any shared memory. That's fine and if we want to make that
>> common/generic we need to know if we are going to handle shared
>> memory in there or leave it to client/protocol implementations.
>>
> Well, that driver is for MHU, which has nothing to do with SHM which
> may or may not be present on a platform.

Again agreed.

>   Anyways, could we please discuss the MHU driver in the patchset that
> introduces it? This API already supports both, and this patchset has
> had enough delays for more than a year now.
>

Sorry I have no intention to delay this getting merged(I too need it
ASAP) as long as the APIs can be extended if needed in future(which I
think should be).

Now coming back to my original question: If the protocol/client manage
the SHM and assume there's some payload associated with a message and
controller expects it to be in place before calling send_data, then
how can you achieve this without blocking for one command to complete
before copying the payload for the next. If you wait in the protocol
to update payload before queueing the request, you end-up with no use of
Tx queue in mailbox.c

Now as you said we can do this in controller's send_data(also agreed
and that's what I too thought of) or in mailbox just before calling
send_data(doesn't matter where). But doesn't it make sense to have
standard API like mbox_chan_prepare_data so that we can do that in
standard way?

Regards,
Sudeep
