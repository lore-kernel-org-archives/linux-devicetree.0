From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCHv7 2/5] mailbox: Introduce framework for mailbox
Date: Thu, 19 Jun 2014 13:36:04 +0100
Message-ID: <53A2D934.6060401@arm.com>
References: <1402592317-7043-1-git-send-email-jaswinder.singh@linaro.org>	<1402592479-7244-1-git-send-email-jaswinder.singh@linaro.org>	<7hionz9i5e.fsf@paris.lan>	<CAJe_ZhcuOa39Db_tE4JupY74aze02=v1FWzduFD0sO15nMrKvw@mail.gmail.com>	<7hzjha5ew2.fsf@paris.lan> <CAJe_ZhfTCw3OHNeSTW71bc6U2g_d=5hYknu+dwhBkuZvPg=D6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJe_ZhfTCw3OHNeSTW71bc6U2g_d=5hYknu+dwhBkuZvPg=D6w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jaswinder.singh@linaro.org>, Kevin Hilman <khilman@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, lkml <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, Matt Porter <mporter@linaro.org>, Patch Tracking <patches@linaro.org>, Bjorn Andersson <bjorn@kryo.se>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Anna, Suman" <s-anna@ti.com>, Loic Pallardy <loic.pallardy@st.com>, LeyFoon Tan <lftan.linux@gmail.com>, Craig McGeachie <slapdau@yahoo.com.au>, Courtney Cavin <courtney.cavin@sonymobile.com>, Pawel Moll <Pawel.Moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Arnd Bergmann <arnd@arndb.de>, Josh Cartwright <joshc@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Kumar Gala <galak@codeaurora.org>, "ks.giri@samsung.com" <ks.giri@samsung.com>
List-Id: devicetree@vger.kernel.org

Hi Jassi,

On 19/06/14 03:55, Jassi Brar wrote:
> On 18 June 2014 22:33, Kevin Hilman <khilman@linaro.org> wrote:

[...]
>>
>> That's great.
>>
>> I sure would like to see some more Reviewed-by tags from those folks to
>> confirm that those starting to use it think it's on the right track.
>>
> The upstreaming attempts have been going on for months now, and via
> non-public interactions with developers I understand it last worked
> before the revision mandating DT support and ipc->mailbox symbol
> renaming. So basic working should still remain the same.
>     Suman(TI), Loic(ST), Girish(Samsung), Ashwin (PCC+ACPI).... guys,
> any word for v7?
>

I have been using v6 on ARM64 development platform and in the process of moving
to v7. I will respond with my comments/queries separately.

Regards,
Sudeep
