From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/5] sun6i: Add A31s (pinctrl) support
Date: Fri, 28 Nov 2014 13:59:46 +0100
Message-ID: <547871C2.6050209@redhat.com>
References: <1416747283-13489-1-git-send-email-hdegoede@redhat.com> <CACRpkdb3P+KM+ANqe6fKqJcRnBp6zvJhWUFZDap8qFDWdY1JNQ@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBTHD4GRQKGQEQ7ZC7VQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CACRpkdb3P+KM+ANqe6fKqJcRnBp6zvJhWUFZDap8qFDWdY1JNQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 11/28/2014 01:01 PM, Linus Walleij wrote:
> On Sun, Nov 23, 2014 at 1:54 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
>> I'm not sure if sunxi pinctrl patches go through Maxime's tree or Linus' tree,
>> so I'll leave figuring out who takes what patches to you two.
>
> The changes in drivers/pinctrl and arch/* are usually orthogonal
> (just Kconfig symbols and DTS changes, no cross calls or header
> files that break compilation etc) and then they can be
> applied orthogonally. I just put the pinctrl patch in my tree and
> the rest in the platform tree.

Ok, note in case it was not clear there will be a v2, so please do not merge v1.

Thanks,

Hans
