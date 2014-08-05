Return-Path: <sudeep.holla@arm.com>
Message-ID: <53E111F9.8010107@arm.com>
Date: Tue, 05 Aug 2014 18:18:49 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
MIME-Version: 1.0
Subject: Re: [PATCHv9 2/4] mailbox: Introduce framework for mailbox
References: <1406055250-29159-1-git-send-email-jaswinder.singh@linaro.org>	<1406055374-29275-1-git-send-email-jaswinder.singh@linaro.org>	<53DA7DBD.10704@arm.com>	<CAJe_ZheReu3whEmuQ6T1AO4VPbaFa=e9kQgFWB0-uJQhFBs_fA@mail.gmail.com>	<53DB6035.8080002@arm.com>	<CAJe_Zhc7pH-n5SX5wc161gZJ_m+J3xL2hHTvrAe84e3nm23Qgg@mail.gmail.com>	<53DB8A36.9040405@arm.com>	<CAJe_ZheEeKpc2TZG5a4QD34Jqhj-sCvAZbkdoaeruv9GCZogwg@mail.gmail.com>	<53DBCF74.3030301@arm.com> <CAJe_Zhf=tBUj-Vf0yoWo-8iBDTCf1NjD_wse8JLcEEPz5AmS6A@mail.gmail.com>
In-Reply-To: <CAJe_Zhf=tBUj-Vf0yoWo-8iBDTCf1NjD_wse8JLcEEPz5AmS6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ks.giri@samsung.com" <ks.giri@samsung.com>, "arnd@arndb.de" <arnd@arndb.de>, "ijc@hellion.org.uk" <ijc@hellion.org.uk>, Mark Rutland <Mark.Rutland@arm.com>, "robh@kernel.org" <robh@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "courtney.cavin@sonymobile.com" <courtney.cavin@sonymobile.com>, "mporter@linaro.org" <mporter@linaro.org>, "slapdau@yahoo.com.au" <slapdau@yahoo.com.au>, "lftan.linux@gmail.com" <lftan.linux@gmail.com>, "loic.pallardy@st.com" <loic.pallardy@st.com>, "s-anna@ti.com" <s-anna@ti.com>, "ashwin.chaugule@linaro.org" <ashwin.chaugule@linaro.org>, "bjorn@kryo.se" <bjorn@kryo.se>, "patches@linaro.org" <patches@linaro.org>, "t.takinishi@jp.fujitsu.com" <t.takinishi@jp.fujitsu.com>, "broonie@linaro.org" <broonie@linaro.org>, "khilman@linaro.org" <khilman@linaro.org>, "mollie.wu@linaro.org" <mollie.wu@linaro.org>, "andy.green@linaro.org" <andy.green@linaro.org>, "lee.jones@linaro.org" <lee.jones@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Hi Jassi,

Sorry for late response.

On 02/08/14 04:58, Jassi Brar wrote:
> On 1 August 2014 23:03, Sudeep Holla <sudeep.holla@arm.com> wrote:

[...]
>>
>> Sorry I have no intention to delay this getting merged(I too need it
>> ASAP) as long as the APIs can be extended if needed in future(which I
>> think should be).
>>
>> Now coming back to my original question: If the protocol/client manage
>> the SHM and assume there's some payload associated with a message and
>> controller expects it to be in place before calling send_data, then
>> how can you achieve this without blocking for one command to complete
>> before copying the payload for the next. If you wait in the protocol
>> to update payload before queueing the request, you end-up with no use of
>> Tx queue in mailbox.c
>>
> 1) When you say Client/Protocol manages the SHM, then they should be
> responsible for laying out the SHM with payloads. Not the controller
> driver.  (I hope you don't mean the prepare_data for the client,
> because that would mean even after submitting a packet for
> transmission the client has to respond to yet another call before the
> packet is actually put on the bus.)
>

Agreed even I don't think that's good idea, but ....

> 2) Considering ur example anyway ... Mailbox api queues "void *data"
> which could point to a payload structure on client's temporary buffer
> (like stack). When the packet's turn comes up, the controller driver
> may copy the payload data as the first thing in send_data() and then
> continue to trigger it as usual. Where does the client have to block?
>

That wouldn't help as controller has no idea where is your shared
memory, so it can't do anything with copied data. Anyway, it's better to
take up this when we hit this scenario.

Regards,
Sudeep
