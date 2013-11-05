From: delicious quinoa <delicious.quinoa@gmail.com>
Subject: Re: [PATCH 3/3] use linear irq domain in gpio-dwapb
Date: Tue, 5 Nov 2013 16:19:44 -0600
Message-ID: <CANk1AXSn_75d3hX+h2n_gqf+Bs0HWWPJZw0L11x6ECU+Xb=cUw@mail.gmail.com>
References: <1383670552-17566-1-git-send-email-delicious.quinoa@gmail.com>
	<1383670552-17566-4-git-send-email-delicious.quinoa@gmail.com>
	<527963D9.1070007@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <527963D9.1070007@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@stericsson.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Jamie Iles <jamie@jamieiles.com>, Heiko Stuebner <heiko@sntech.de>, Alan Tull <atull@altera.com>, Dinh Nguyen <dinguyen@altera.com>, Yves Vandervennet <rocket.yvanderv@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 5, 2013 at 3:32 PM, Sebastian Hesselbarth
<sebastian.hesselbarth@gmail.com> wrote:
> On 11/05/2013 05:55 PM, Alan Tull wrote:
>>
>> From: Alan Tull <atull@altera.com>
>>
>>   * Changes to get gpio-dwapb (originally v3.2-rc7) driver building and
>>     working on current kernel.
>>   * Use linear irq domain.
>>   * Fix setting irq edge type for 'rising' and 'both'.
>>   * Support as a loadable module.
>>   * Use bgpio_chip's spinlock during register access.
>
>
> As this patch is basically messing what I have commented before,
> I really lost interest in reviewing this again. Please just squash
> them into one.

Hi Sebastian,

Thanks for the review.  I'm working on implementing these changes.

Do you want me to squash all 3 patches or just the last two?

In either case, I will be taking off all the Ack's and Signed-off-by's
as I will  be changing the patches post-ack/signoff.

Alan
