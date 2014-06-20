Return-Path: <jaswinder.singh@linaro.org>
MIME-Version: 1.0
In-Reply-To: <53A45C54.2010103@arm.com>
References: <1402592317-7043-1-git-send-email-jaswinder.singh@linaro.org>
	<1402592479-7244-1-git-send-email-jaswinder.singh@linaro.org>
	<53A32927.4060004@arm.com>
	<CAJe_ZhdRr-9D2uvC9U9_7+N1nKeHPSS7OKocFt6Kq-Gjquokag@mail.gmail.com>
	<53A45C54.2010103@arm.com>
Date: Fri, 20 Jun 2014 22:00:04 +0530
Message-ID: <CAJe_Zhciv-twFB1ntSCRi7uaF5wZRS9ZQrW-fAP1oj2_BPjAcw@mail.gmail.com>
Subject: Re: [PATCHv7 2/5] mailbox: Introduce framework for mailbox
From: Jassi Brar <jaswinder.singh@linaro.org>
Content-Type: text/plain; charset=UTF-8
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mporter@linaro.org" <mporter@linaro.org>, "patches@linaro.org" <patches@linaro.org>, "bjorn@kryo.se" <bjorn@kryo.se>, "ashwin.chaugule@linaro.org" <ashwin.chaugule@linaro.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "s-anna@ti.com" <s-anna@ti.com>, "loic.pallardy@st.com" <loic.pallardy@st.com>, "lftan.linux@gmail.com" <lftan.linux@gmail.com>, "slapdau@yahoo.com.au" <slapdau@yahoo.com.au>, "courtney.cavin@sonymobile.com" <courtney.cavin@sonymobile.com>, Pawel Moll <Pawel.Moll@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "arnd@arndb.de" <arnd@arndb.de>, "joshc@codeaurora.org" <joshc@codeaurora.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "galak@codeaurora.org" <galak@codeaurora.org>, "ks.giri@samsung.com" <ks.giri@samsung.com>
List-ID: <devicetree@vger.kernel.org>

On 20 June 2014 21:37, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> As I mentioned in the other mail, suppose there's one channel and multiple
> users
> of it. Each have to acquire the channel, and from then any data received
> will
> be sent to the client. But what is the async data from remote is not for the
> client currently holding the channel. I also gave the example.
>
> If the remote is the process that controls power managements and allows you
> to
> set the thermal bounds. If those limits are crossed, it sends any interrupt
> to
> notify that, while the controller can be busy handling some other
> request(say
> DVFS).
>
Multiple clients of a single mailbox channel asks for a single
'server' type shim client that simply forwards requests to remote on
behalf of clients but filter out async notifications from replies
coming in from remote. In your case, your 'thermal' client driver will
register itself with the shim server for 'thermal' type async
notifications. The shim server holds the mailbox channel for whole of
its lifetime so you never miss the thermal event.

cheers,
-jassi
