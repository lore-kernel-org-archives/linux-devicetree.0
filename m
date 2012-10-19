From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 08/10] pinctrl: single: support pinconf generic
Date: Thu, 18 Oct 2012 19:40:13 -0700
Message-ID: <20121019024012.GP30550@atomide.com>
References: <1350551224-12857-1-git-send-email-haojian.zhuang@gmail.com>
 <1350551224-12857-8-git-send-email-haojian.zhuang@gmail.com>
 <CACRpkda0QLkdKns3CXNOijYBjaDtW1QyhNYjTqDvRH-in8pvZQ@mail.gmail.com>
 <20121018222907.GH30550@atomide.com>
 <CAN1soZzsruhWt7VFgf5Fi79npcjLiMSUEVwnE3hR5iWEh+9GRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAN1soZzsruhWt7VFgf5Fi79npcjLiMSUEVwnE3hR5iWEh+9GRw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

* Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> [121018 19:25]:
> 
> I wonder whether gpio function in OMAP is also configured in the pinmux
> register. For example, the function is 3bit field in pinmux register
> of Marvell's
> PXA/MMP silicon. GPIO function is the one of function.
> 
> If the usage case is same in OMAP silicon, I can merge
> "pinctrl-single,gpio-mask"
> with "pinctrl-single,function-mask".
> 
> Do we need "pinctrl-single,gpio-disable" at here? I want to remove it,
> but I don't
> know whether it's necessary in OMAP case.

Maybe.. I'll take a look at at that tomorrow.

Regards,

Tony
