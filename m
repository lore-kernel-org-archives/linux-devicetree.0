From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinmux: Add TB10x pinmux driver
Date: Wed, 29 May 2013 14:21:05 +0200
Message-ID: <CACRpkdbqzSZefYB2jywkkKDE_Qse83+MDJ+D+UNYnQGFUzwQWQ@mail.gmail.com>
References: <20130429161725.GB30136@ab42.lan>
	<5182B557.4040804@wwwdotorg.org>
	<CACRpkdaxO0q_P2wJFy3zv4F-QM9dZk54qW8ft350XqcBt1Gr1w@mail.gmail.com>
	<20130508164123.GA10248@ab42.lan>
	<518AAF31.8080502@wwwdotorg.org>
	<20130510082521.GA2125@ab42.lan>
	<51942472.9010402@wwwdotorg.org>
	<CACRpkdYtKr5w2=1sONG4Qn2TQue38nV7epWfzxNQz5rjSs0DZQ@mail.gmail.com>
	<20130522142824.GC4789@ab42.lan>
	<CAD6h2NT4FqmEsLvtTDwwDL2YVzXYNpw72hTOcSxSMvHLhWvFPQ@mail.gmail.com>
	<20130524115053.GB5203@ab42.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130524115053.GB5203@ab42.lan>
Sender: linux-doc-owner@vger.kernel.org
To: Christian Ruppert <christian.ruppert@abilis.com>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Shiraz HASHIM <shiraz.hashim@st.com>, Patrice CHOTARD <patrice.chotard@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 24, 2013 at 1:50 PM, Christian Ruppert
<christian.ruppert@abilis.com> wrote:

> I haven't understood how to associate GPIOs to
> other functions, however: Our hardware pin controller makes GPIO pins
> available depending on the configuration of the non-GPIO interfaces.
> This means that in many configurations, GPIO banks are only partially
> available because some pins are used for other purposes. We can't expect
> our customers to manually change the pin assignments in the device tree
> in order to take this into account for every PCB.

But what is it your customers do when customizing a board then?

Part of the promise of the device tree is to make it easy for downstream
users to customize the kernel, *especially* for different boards/systems
using the same SoC, for example. It is very much intended as a
customization tools for embedded developers getting boards from
a chipset vendor.

Maybe I don't understand what is meant by changing the pin
assignments above ...

Yours,
Linus Walleij
