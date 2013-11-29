From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6 4/6] gpio: davinci: add OF support
Date: Fri, 29 Nov 2013 13:39:19 +0530
Message-ID: <52984BAF.4060306@ti.com>
References: <1385057731-4348-1-git-send-email-prabhakar.csengg@gmail.com>	<1385057731-4348-5-git-send-email-prabhakar.csengg@gmail.com>	<52932DB9.4090805@ti.com>	<5294950A.9070007@ti.com>	<5294D692.3080100@ti.com>
	<CACRpkdZtfsvgYNMUnuwiYL=0dVe6KDPV92Ri0TpTHL8gRJeqkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <CACRpkdZtfsvgYNMUnuwiYL=0dVe6KDPV92Ri0TpTHL8gRJeqkQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DLOS <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 29 November 2013 01:16 PM, Linus Walleij wrote:
> On Tue, Nov 26, 2013 at 6:12 PM, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org> wrote:
>> On Tuesday 26 November 2013 06:03 PM, Grygorii Strashko wrote:
> 
>>> Actually, the same was proposed by Linus, but we've tried avoid such huge rework -
>>> by switching to one irq_domain per all banks for example.
>>
>> I didn't really read that proposal from Linus so if two people
>> independently suggested the same thing, there must be something worth
>> considering there :)
> 
> From a GPIO POV it's not such a big deal really, this approach is fine
> and the important thing is that we progress toward a more standard
> driver... it's more a question for the DT people IMO. I really like the
> current patch set.

Rob has acked v5 of this patch. So no objection from DT people too. My
concern was a bit futuristic. Since everyone is happy I think we can go
with the current patch itself.

Thanks,
Sekhar
