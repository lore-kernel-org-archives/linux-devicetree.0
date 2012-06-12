From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5 1/7] ARM: davinci, cp_intc: Add irq domain support
Date: Tue, 12 Jun 2012 23:06:15 +0530
Message-ID: <4FD77E0F.8050907@ti.com>
References: <1338373143-7467-1-git-send-email-hs@denx.de>
 <1338373143-7467-2-git-send-email-hs@denx.de> <4FC919C9.6070107@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4FC919C9.6070107-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 6/2/2012 1:06 AM, Sekhar Nori wrote:
> Hi Heiko,
> 
> On 5/30/2012 3:48 PM, Heiko Schocher wrote:
>> Signed-off-by: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
>> Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
>> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> Cc: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
>> Cc: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
>> Cc: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
>>
>> ---
> 
> On AM18x EVM, with this patch applied and CONFIG_KEYBOARD_GPIO_POLLED=y,
> I get warnings of type:
> 
> irq 0, desc: c0372950, depth: 1, count: 0, unhandled: 0
> 
> ->handle_irq():  c00552f8, handle_bad_irq+0x0/0x23c
> 
> ->irq_data.chip(): c03794e8, 0xc03794e8
> 
> ->action():   (null)
> 
>    IRQ_NOPROBE set
> 
>  IRQ_NOREQUEST set
> 
> 
> They do not come when CONFIG_KEYBOARD_GPIO_POLLED=n. I am yet to debug
> this, but wanted to point out now in case there is anything obvious.

I debugged this a bit more and the good news for you is that spurious
IRQ messages have got nothing to do with your patch. Looks like the
spurious interrupts on interrupt line 0 were always there - just that
they were getting silently ignored earlier. I am still debugging what is
causing these spurious interrupts.

Thanks,
Sekhar
