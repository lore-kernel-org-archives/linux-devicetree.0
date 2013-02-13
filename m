From: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v7 1/6] watchdog: core: dt: add support for the
 timeout-sec dt property
Date: Wed, 13 Feb 2013 10:44:01 +0100
Message-ID: <20130213094401.GB7867@spo001.leaseweb.com>
References: <1357639455-21935-1-git-send-email-fabio.porcedda@gmail.com>
 <1357639455-21935-2-git-send-email-fabio.porcedda@gmail.com>
 <20130212230303.GA7867@spo001.leaseweb.com>
 <CAHkwnC_XdgHSo8Vkz5Ae=DQ48BBhLPVx_hXTzLTcw+xZJaEi5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAHkwnC_XdgHSo8Vkz5Ae=DQ48BBhLPVx_hXTzLTcw+xZJaEi5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Fabio,

> > I must admit that the different iterations of this patch only made it better.
> > I like the idea that you are proposing here (put the default timeout in the
> > watchdog_device struct and use a helper function to set the timeout parameter
> > value or the timeout-sec dt value). To be able to use other mechanism in the
> > future also, I think it make more sense to pass the device instead of the
> > device_node.
> 
> If i understand correctly you want to use "struct platform_device"
> instead of "struct device_node",
> in the function watchdog_init_timeout?

No struct device instead of struct device_node.

> > I also detailed your documentation a bit more and incorporated above changes
> > in an adjusted patch. Can you have a look at it and if OK for you I will put
> > it in linux-watchdog-next as your v10 :-).
> 
> That's good for sure :)

Will add it to the linux-watchdog-next tree today.

Kind regards,
Wim.
