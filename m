From: Holger Schurig <holgerschurig-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC v1] clk: Add debugfs nodes for enable/disable/set-rate/set-parent
Date: Fri, 26 Feb 2016 09:22:29 +0100
Message-ID: <87twkvj2yi.fsf@gmail.com>
References: <1456454309-25037-1-git-send-email-pankaj.dev@st.com>
	<87fuwg9bog.fsf@gmail.com>
	<8B5B4FB66A982549A83D90C7791B761007F362D2E1@EAPEX1MAIL2.st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8B5B4FB66A982549A83D90C7791B761007F362D2E1-8vAmw3ZAcdwmTw2EpZffQNBPR1lH4CV8@public.gmane.org>
	(Pankaj DEV's message of "Fri, 26 Feb 2016 16:06:48 +0800")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pankaj DEV <pankaj.dev-qxv4g6HH51o@public.gmane.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "mturquette@linaro.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "kernel@stlinux.com" <kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org>, "sboyd@codeaurora.org" <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Laurent MEUNIER <laurent.meunier-qxv4g6HH51o@public.gmane.org>, "lee.jones@linaro.org" <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime COQUELIN <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Pankaj DEV <pankaj.dev-qxv4g6HH51o@public.gmane.org> writes:

> The prime motive for clk_set_rate is to set new rate for a clock,
> since the 'clk_rate' currently available, allows only reading.
> To provide reading rate from 'clk_set_rate' is just additional feature.

Sure.

But my point is to combine things.


After your patch:

- read via clk_rate
- read via clk_set_rate
- write via clk_set_rate

My proposal:

- read via clk_rate
- write via clk_rate
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
