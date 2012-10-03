From: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 3/5] watchdog: at91sam9_wdt: add device tree support
Date: Wed, 3 Oct 2012 18:32:53 +0200
Message-ID: <CAHkwnC_RUQ+hhzHAVEK5u4UUJDArKQNjEdXTzswn6cfYPWU_ew@mail.gmail.com>
References: <1349094281-28889-1-git-send-email-fabio.porcedda@gmail.com>
 <1349094281-28889-4-git-send-email-fabio.porcedda@gmail.com>
 <20121001124546.GE11837@lunn.ch>
 <CAHkwnC_u+bMX7REU5G3u=cm3VGmOUn+AShruw+ERkPJWtZpxUg@mail.gmail.com>
 <CAHkwnC_5wRgf-DGnUfzkrreT_E1v8i=G8U0qo_5t1DY6+L7c+w@mail.gmail.com>
 <20121001130658.GG11837@lunn.ch>
 <CAHkwnC83DcKXZOtLse_xnYe7zOZ5qwGJVimLkBzDwSJ7Y5vL_Q@mail.gmail.com>
 <20121002195914.GG21046@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121002195914.GG21046-g2DYL2Zd6BY@public.gmane.org>
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
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 2, 2012 at 9:59 PM, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:
>> I was thinking to add a more generic helper function like this:
>>
>> static inline void watchdog_get_dttimeout(struct device_node *node,
>> u32 *timeout)
>> {
>>       if (node)
>>               of_property_read_u32(node, "timeout", &wdd->timeout);
>> }
>
> You forgot to change the function signature.
>
> Also, if you are adding a generic function, it should be a generic
> function for the framework. All drivers should be slowly moving
> towards the framework, so adding functions which help you not move
> towards the framework are wrong.

Maybe i can use a framework specific function and use a dummy
watchdog_device for
the non framerwork drivers.

If it's ok i will send an updated patch.

Best regards and thanks for the review.
-- 
Fabio Porcedda
