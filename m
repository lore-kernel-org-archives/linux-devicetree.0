From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/4] pinctrl: st: Add software edge trigger interrupt
 support.
Date: Fri, 24 Jan 2014 08:28:59 +0000
Message-ID: <20140124082859.GJ8586@lee--X1>
References: <1389886545-31498-1-git-send-email-srinivas.kandagatla@st.com>
 <1389886651-31990-1-git-send-email-srinivas.kandagatla@st.com>
 <CACRpkdaBAnpfHBqkgU2emZrYwHGh9KvDvqfnCvaWdU5jYgxStA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaBAnpfHBqkgU2emZrYwHGh9KvDvqfnCvaWdU5jYgxStA@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


> > +/*
> > + * As edge triggers are not supported at hardware level, it is sup=
ported by
> > + * software by exploiting the level trigger support in hardware.
>=20
> (...)
>=20
> All this is quite hard to understand. Maybe it's just because
> it's hard overall. Edge triggers are not supported by hardware
> so we use the hardware edge trigger support?
>=20
> That is a bit oxymoronic...

That's not what is says. Read it again. :)

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
