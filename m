From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH Resend] gpio: stmpe: Add DT support for stmpe gpio
Date: Mon, 26 Nov 2012 16:57:53 +0530
Message-ID: <CAKohpo=sYeeigxs3V9_gz_AqT3wTbFPpVYXAA-gjoGWranRGkg@mail.gmail.com>
References: <c0badc4f4021029a5de4393d7e3ca71494edb8ea.1353686946.git.viresh.kumar@linaro.org>
	<20121126112628.GH12782@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121126112628.GH12782@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linus.walleij@linaro.org, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, Vipul Kumar Samar <vipulkumar.samar@st.com>
List-Id: devicetree@vger.kernel.org

On 26 November 2012 16:56, Lee Jones <lee.jones@linaro.org> wrote:
>> From: Vipul Kumar Samar <vipulkumar.samar@st.com>

>> +Optional properties:
>> + - norequest-mask: bitmask specifying which GPIOs should _not_ be requestable
>
> You have 'norequest-mask' here and 'st,norequest-mask' in the example.

> If 'st,norequest-mask' is truly required to be in the DT (I don't
> really understand it well enough to comment), and you fix up the
> inconsistency in the Documentation, you can apply my:
>
> Acked-by: Lee Jones <lee.jones@linaro.org>

Thanks for pointing out. Will fix it up.

--
viresh
