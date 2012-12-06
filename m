From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V5 2/2] mfd: stmpe: Update DT support in stmpe driver
Date: Thu, 6 Dec 2012 08:06:20 +0530
Message-ID: <CAKohponBkA+bg7B4TKaU6WbcVBNDHPe4AWqAEE6JGD7zctoULw@mail.gmail.com>
References: <2dcd7cb4c4022fa24b5328974e4226f5aaf89419.1354199865.git.viresh.kumar@linaro.org>
	<121653def4e985b0c1b59045637dd4518f97e73a.1354199865.git.viresh.kumar@linaro.org>
	<20121130105731.GN3176@sortiz-mobl>
	<20121130154542.GG23648@gmail.com>
	<CAKohpokLVEH+4F_VXh5auUm48cWWe0mumZME8yOCcAezcwJbCQ@mail.gmail.com>
	<20121205224203.691153E0E22@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121205224203.691153E0E22@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, rabin.vincent@stericsson.com, shiraz.hashim@st.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, linus.walleij@linaro.org, Vipul Kumar Samar <vipulkumar.samar@st.com>
List-Id: devicetree@vger.kernel.org

On 6 December 2012 04:12, Grant Likely <grant.likely@secretlab.ca> wrote:
> On Sat, 1 Dec 2012 00:33:46 +0530, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>> This first tries to match the table my patch added, _BUT_ the string will
>> never match as we had "st,stmpe810" in table and "stmpe810" in dev.
>
> of_driver_match_device() matches against the compatible list in
> dev->of_node, not against the device name. So, if the compatible
> property has a string that is in the table, then it really should match
> against it.

Grant, but isn't it true that the final device's name would not be the DT
way of names? It would simply be "stmpe810" for us and so if we have
multiple instances of stmpe on a board, we need to distinguish them
ourselves? One way for that was passing id for these instances, which
would finally be used, when we create platform devices for sub-modules
of stmpe (gpio, keypad, ts, etc).

--
viresh
