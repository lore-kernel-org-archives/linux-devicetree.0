Return-Path: <jaswinder.singh@linaro.org>
MIME-Version: 1.0
In-Reply-To: <53DB6035.8080002@arm.com>
References: <1406055250-29159-1-git-send-email-jaswinder.singh@linaro.org>
	<1406055374-29275-1-git-send-email-jaswinder.singh@linaro.org>
	<53DA7DBD.10704@arm.com>
	<CAJe_ZheReu3whEmuQ6T1AO4VPbaFa=e9kQgFWB0-uJQhFBs_fA@mail.gmail.com>
	<53DB6035.8080002@arm.com>
Date: Fri, 1 Aug 2014 17:58:42 +0530
Message-ID: <CAJe_Zhc7pH-n5SX5wc161gZJ_m+J3xL2hHTvrAe84e3nm23Qgg@mail.gmail.com>
Subject: Re: [PATCHv9 2/4] mailbox: Introduce framework for mailbox
From: Jassi Brar <jaswinder.singh@linaro.org>
Content-Type: text/plain; charset=UTF-8
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ks.giri@samsung.com" <ks.giri@samsung.com>, "arnd@arndb.de" <arnd@arndb.de>, "ijc@hellion.org.uk" <ijc@hellion.org.uk>, Mark Rutland <Mark.Rutland@arm.com>, "robh@kernel.org" <robh@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "courtney.cavin@sonymobile.com" <courtney.cavin@sonymobile.com>, "mporter@linaro.org" <mporter@linaro.org>, "slapdau@yahoo.com.au" <slapdau@yahoo.com.au>, "lftan.linux@gmail.com" <lftan.linux@gmail.com>, "loic.pallardy@st.com" <loic.pallardy@st.com>, "s-anna@ti.com" <s-anna@ti.com>, "ashwin.chaugule@linaro.org" <ashwin.chaugule@linaro.org>, "bjorn@kryo.se" <bjorn@kryo.se>, "patches@linaro.org" <patches@linaro.org>, "t.takinishi@jp.fujitsu.com" <t.takinishi@jp.fujitsu.com>, "broonie@linaro.org" <broonie@linaro.org>, "khilman@linaro.org" <khilman@linaro.org>, "mollie.wu@linaro.org" <mollie.wu@linaro.org>, "andy.green@linaro.org" <andy.green@linaro.org>, "lee.jones@linaro.org" <lee.jones@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On 1 August 2014 15:09, Sudeep Holla <sudeep.holla@arm.com> wrote:
> On 31/07/14 18:58, Jassi Brar wrote:

>>>
>>> Probably this is discussed already, but again I missed to find it
>>> in archives, so asking here. If the protocol has some payload associated
>>> with the message and controller expects it to be in place before calling
>>> send_data, we essentially end up not using this queue at all by waiting
>>> in the protocol layer(may be in it's own queue)
>>>
>> Why essentially?
>>    The 'data' is a void *  i.o.w the packet format is a completely
>> internal understanding between a controller and a client. The 'data'
>> can point to a copy of payload that the controller driver sets up in
>> the shared payload region as the first thing in send_data() callback.
>> OR, like my 'server' type platform, where the access is serialized to
>> the shared payload region.
>>
>
> Yes that's exactly what I have now. But based on your driver I thought
> that the shared memory should not be associated with the mailbox controller
> and should be completely handled in the protocol/client.
>
> Also to handle async packet from remote, controller has to pass shared
> memory pointer always to the client to read the data as the buffer won't
> to ready in such case. So I thought it's good idea to handle shared memory
> completely in client/protocol.
>
Again ur platform has the freedom. The async client should have a free
packet to copy the data as soon as it arrives.
My platform divides the SHM into two parts - one for each direction.

-jassi
