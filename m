From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V5 2/2] mfd: stmpe: Update DT support in stmpe driver
Date: Thu, 6 Dec 2012 16:49:47 +0530
Message-ID: <CAKohponrZ8a+=ozXox60nRVBO174Nr=GoSjKkkz7KjLCxd5BhQ@mail.gmail.com>
References: <20121130154542.GG23648@gmail.com>
	<CAKohpokLVEH+4F_VXh5auUm48cWWe0mumZME8yOCcAezcwJbCQ@mail.gmail.com>
	<20121205224203.691153E0E22@localhost>
	<CAKohponjLp214EPKgNHqP2N8Tje9U8ZxgywUTSvsjE-TqHy+xw@mail.gmail.com>
	<20121206095019.GN2718@gmail.com>
	<CAKohpokNQB6L2vvjmvA7_3KomFXnV9wZ-uBjrfRVuBL=QWgr_Q@mail.gmail.com>
	<20121206101131.GP2718@gmail.com>
	<CAKohpom9NK0Tg9fKdddkP-0H8FuVd-=yhHzZr-sWNb_zTVymWw@mail.gmail.com>
	<20121206103515.GQ2718@gmail.com>
	<CAKohponeU539FR+XCKJQTFnoNKJCnAh5ESB1NGP7ZK0u4Tqwyg@mail.gmail.com>
	<20121206111252.GR2718@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121206111252.GR2718@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Samuel Ortiz <sameo@linux.intel.com>, rabin.vincent@stericsson.com, shiraz.hashim@st.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, linus.walleij@linaro.org, Vipul Kumar Samar <vipulkumar.samar@st.com>
List-Id: devicetree@vger.kernel.org

On 6 December 2012 16:42, Lee Jones <lee.jones@linaro.org> wrote:
> I thought we'd be over this? The 'ID' will be represented by the
> address of the chip i.e. stmpe1601@40, where '40' will be
> distinguishing factor?

I haven't tested it but i thought we are getting i2c device name from
modalias() fn running on "st,stmpe1601" and so would give us "stmpe1601".

Now, i went back to your earlier mail and checked device name:
stmpe-i2c 0-0040: stmpe1601 detected, chip id: 0x212

It came from DT :)

So, probably no more issues of id's. Will resend my patch, after getting
rid of tables.

--
viresh
