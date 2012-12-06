From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V5 2/2] mfd: stmpe: Update DT support in stmpe driver
Date: Thu, 6 Dec 2012 16:12:42 +0530
Message-ID: <CAKohponeU539FR+XCKJQTFnoNKJCnAh5ESB1NGP7ZK0u4Tqwyg@mail.gmail.com>
References: <121653def4e985b0c1b59045637dd4518f97e73a.1354199865.git.viresh.kumar@linaro.org>
	<20121130105731.GN3176@sortiz-mobl>
	<20121130154542.GG23648@gmail.com>
	<CAKohpokLVEH+4F_VXh5auUm48cWWe0mumZME8yOCcAezcwJbCQ@mail.gmail.com>
	<20121205224203.691153E0E22@localhost>
	<CAKohponjLp214EPKgNHqP2N8Tje9U8ZxgywUTSvsjE-TqHy+xw@mail.gmail.com>
	<20121206095019.GN2718@gmail.com>
	<CAKohpokNQB6L2vvjmvA7_3KomFXnV9wZ-uBjrfRVuBL=QWgr_Q@mail.gmail.com>
	<20121206101131.GP2718@gmail.com>
	<CAKohpom9NK0Tg9fKdddkP-0H8FuVd-=yhHzZr-sWNb_zTVymWw@mail.gmail.com>
	<20121206103515.GQ2718@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121206103515.GQ2718@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Samuel Ortiz <sameo@linux.intel.com>, rabin.vincent@stericsson.com, shiraz.hashim@st.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, linus.walleij@linaro.org, Vipul Kumar Samar <vipulkumar.samar@st.com>
List-Id: devicetree@vger.kernel.org

On 6 December 2012 16:05, Lee Jones <lee.jones@linaro.org> wrote:
>> > Or you could not put unnecessary bindings into the Device Tree
>> > by putting two and two together and realise that using the table
>> > is the correct thing to do instead. This actually gives reason
>> > to you previous patch, but should probably be fixed-up into it
>> > so it has some proper meaning/purpose. ;)
>>
>> Couldn't understand this one :(
>
> Really?

I tried again, but couldn't get it :(

> Let's break it down - what do you need "stmpe,id" for?

To distinguish two instances of of stmpe811 (for instance) on a board.
Names of stmpe sub-modules would contain .0, .1, if we have an id
passed to it. Passing -1 would create same names for both gpio blocks
which belonged to different stmpe811's.
