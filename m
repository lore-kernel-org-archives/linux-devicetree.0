From: Jassi Brar <jaswinder.singh@linaro.org>
Subject: Re: [PATCHv10 2/4] mailbox: Introduce framework for mailbox
Date: Sat, 2 Aug 2014 13:20:16 +0530
Message-ID: <CAJe_ZhePe7rTPc8wtSDP3qM6ptmt2udme6JdL15smejJgKJv5Q@mail.gmail.com>
References: <1406896194-4667-1-git-send-email-jaswinder.singh@linaro.org>
	<1406896296-4863-1-git-send-email-jaswinder.singh@linaro.org>
	<20140801183748.GL30458@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140801183748.GL30458@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Devicetree List <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, "ks.giri@samsung.com" <ks.giri@samsung.com>, Arnd Bergmann <arnd@arndb.de>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Courtney Cavin <courtney.cavin@sonymobile.com>, Matt Porter <mporter@linaro.org>, Craig McGeachie <slapdau@yahoo.com.au>, LeyFoon Tan <lftan.linux@gmail.com>, Loic Pallardy <loic.pallardy@st.com>, "Anna, Suman" <s-anna@ti.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Bjorn Andersson <bjorn@kryo.se>, Patch Tracking <patches@linaro.org>, Mollie Wu <mollie.wu@linaro.org>, Tetsuya Takinishi <t.takinishi@jp.fujitsu.com>, Kevin Hilman <khilman@linaro.org>, Lee Jones <lee.jones@linaro.org>, Andy Green <andy.green@linaro.org>
List-Id: devicetree@vger.kernel.org

On 2 August 2014 00:07, Mark Brown <broonie@kernel.org> wrote:
> On Fri, Aug 01, 2014 at 06:01:36PM +0530, Jassi Brar wrote:
>> Introduce common framework for client/protocol drivers and
>> controller drivers of Inter-Processor-Communication (IPC).
>>
>> Client driver developers should have a look at
>>  include/linux/mailbox_client.h to understand the part of
>> the API exposed to client drivers.
>> Similarly controller driver developers should have a look
>> at include/linux/mailbox_controller.h
>
> Reviewed-by: Mark Brown <broonie@linaro.org>
>
> One very minor thing:
>
>> +     t =3D add_to_rbuf(chan, mssg);
>> +     if (t < 0) {
>> +             pr_err("Try increasing MBOX_TX_QUEUE_LEN\n");
>> +             return t;
>> +     }
>
> In this and the other error messages it's probably worth doing someth=
ing
> like a dev_ print with the device in the mbox_controller - if there's
> more than one mailbox controller in the system it may well make
> someone's life easier to get a hint about which one is running into
> trouble.  Similarly if there were some identification for the channel=
s
> that might be useful to display that (perhaps add a name field people
> can initialize if they like in the struct?).
>
> This is clearly not a blocker for merge though.
>
OK will do.

Thanks,
Jassi


--=20
Linaro.org =E2=94=82 Open source software for ARM SoCs | Follow Linaro
http://facebook.com/pages/Linaro/155974581091106  -
http://twitter.com/#!/linaroorg - http://linaro.org/linaro-blog
