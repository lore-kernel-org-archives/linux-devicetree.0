Return-Path: <sudeep.holla@arm.com>
Message-ID: <53A45266.3030905@arm.com>
Date: Fri, 20 Jun 2014 16:25:26 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
MIME-Version: 1.0
Subject: Re: [PATCHv7 2/5] mailbox: Introduce framework for mailbox
References: <1402592317-7043-1-git-send-email-jaswinder.singh@linaro.org> <1402592479-7244-1-git-send-email-jaswinder.singh@linaro.org> <53A32927.4060004@arm.com> <20140619190342.GT4173@beef>
In-Reply-To: <20140619190342.GT4173@beef>
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
To: Matt Porter <mporter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Jassi Brar <jaswinder.singh@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "patches@linaro.org" <patches@linaro.org>, "bjorn@kryo.se" <bjorn@kryo.se>, "ashwin.chaugule@linaro.org" <ashwin.chaugule@linaro.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "s-anna@ti.com" <s-anna@ti.com>, "loic.pallardy@st.com" <loic.pallardy@st.com>, "lftan.linux@gmail.com" <lftan.linux@gmail.com>, "slapdau@yahoo.com.au" <slapdau@yahoo.com.au>, "courtney.cavin@sonymobile.com" <courtney.cavin@sonymobile.com>, Pawel Moll <Pawel.Moll@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "arnd@arndb.de" <arnd@arndb.de>, "joshc@codeaurora.org" <joshc@codeaurora.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "galak@codeaurora.org" <galak@codeaurora.org>, "ks.giri@samsung.com" <ks.giri@samsung.com>
List-ID: <devicetree@vger.kernel.org>



On 19/06/14 20:03, Matt Porter wrote:
> On Thu, Jun 19, 2014 at 07:17:11PM +0100, Sudeep Holla wrote:
>> Hi Jassi,
>>
>> I started using this from v5 and tried briefly to follow previous versio=
ns
>> and discussion. Please forgive me if I ask questions that are already an=
swered.
>>
>> On 12/06/14 18:01, Jassi Brar wrote:
>>> Introduce common framework for client/protocol drivers and
>>> controller drivers of Inter-Processor-Communication (IPC).
>>>
>>> Client driver developers should have a look at
>>>   include/linux/mailbox_client.h to understand the part of
>>> the API exposed to client drivers.
>>> Similarly controller driver developers should have a look
>>> at include/linux/mailbox_controller.h
>
> ...
>
>>> + * After startup and before shutdown any data received on the chan
>>> + * is passed on to the API via atomic mbox_chan_received_data().
>>> + * The controller should ACK the RX only after this call returns.
>>
>> Does this mean we can't support asynchronous messages from the remote.
>> One possible scenario I can think is if the remote system power controll=
er
>> has feature to configure the bounds for thermal sensors and it can send
>> async interrupt when the bounds are crossed. We can't just block one cha=
nnel
>> for this always. Again this might have been discussed before and you mig=
ht have
>> solution, I could not gather it with my brief look at older discussions.
>
> The way I see it we are simply putting the burden on the client to
> implement very little in the rx_callback. In my case, we will have a
> single client which is the IPC layer. The controller driver will notify
> the IPC client layer which will do as little as possible in the
> rx_callback before returning. We'll handle asynchronous dispatch of
> events within our IPC layer to the real client drivers rather than in
> the controller driver.
>

Yes it makes sense if there's only one client for mailbox.
I assume your single client just requests the channel once on boot and keep=
s
sending messages for when requested by its clients/users.

I too might have single IPC driver as I had mentioned before, but still
exploring if I can push it to individual drivers with some header handling
the packing and unpacking stuff. It avoids set of exported APIs from the si=
ngle
IPC driver :)

So I was thinking about the case where multiple clients of mailbox keep
acquiring and releasing the channel dynamically. If some client expects som=
e
asynchronous message through mailbox, how does this acquiring and releasing=
 of
the channel work then ?

Regards,
Sudeep
