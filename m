From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinmux: Add TB10x pinmux driver
Date: Fri, 24 May 2013 11:20:31 +0200
Message-ID: <CACRpkdYsSwJeVPcLFT7pMjyRsgvoEc+302Zah1Zy2sDOBvVwEg@mail.gmail.com>
References: <20130418090310.GA17636@ab42.lan>
	<CACRpkdZd0_W432od5565phhUcJMRWiV9vXX4QVF4osKkxstC0Q@mail.gmail.com>
	<20130429161725.GB30136@ab42.lan>
	<5182B557.4040804@wwwdotorg.org>
	<CACRpkdaxO0q_P2wJFy3zv4F-QM9dZk54qW8ft350XqcBt1Gr1w@mail.gmail.com>
	<20130508164123.GA10248@ab42.lan>
	<518AAF31.8080502@wwwdotorg.org>
	<20130510082521.GA2125@ab42.lan>
	<51942472.9010402@wwwdotorg.org>
	<CACRpkdYtKr5w2=1sONG4Qn2TQue38nV7epWfzxNQz5rjSs0DZQ@mail.gmail.com>
	<20130522142824.GC4789@ab42.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130522142824.GC4789@ab42.lan>
Sender: linux-doc-owner@vger.kernel.org
To: Christian Ruppert <christian.ruppert@abilis.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Shiraz HASHIM <shiraz.hashim@st.com>, Patrice CHOTARD <patrice.chotard@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 22, 2013 at 4:28 PM, Christian Ruppert
<christian.ruppert@abilis.com> wrote:
> On Mon, May 20, 2013 at 10:10:33AM +0200, Linus Walleij wrote:

>> It's not even pinctrl-simple-centric it is completely generic.
>> The code is in drivers/gpio/gpiolib-of.c.
>>
>> It was written by Shiraz Hashin and Haojian Zhuang.
>> At the time I augmented the core code quite a bit to make
>> a good fit.
>
> I agree. Unluckily, it uses pinctrl-internal pin numbering which we
> would have to make coherent with the physical pin numbers of the
> individual packaging variants of the chip in order to expose them to
> customers (see my previous mail at https://lkml.org/lkml/2013/5/22/207).

Again, the Linux pin numberspace is sparse, you can use whatever
pin number you like as long as it fits in a u32 and does not overlap
with other pins.

If you have a problem that the physical pin numbers and the
bank offsets or bits you need to poke or something doesn't
match, that is an issue for the *driver* not for the pin control
subsystem. However the pin control core may provide
cross-mapping helpers as discussed elsewhere, but the
pin control internal numbering is *not* an issue. Those are
just "some number" on a certain pin controller, use the number
from the datasheet if you like.

Yours,
Linus Walleij
