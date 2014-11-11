From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 0/5] ARM: sunxi: Add support for USB OTG PHY
Date: Wed, 12 Nov 2014 00:50:53 +0800
Message-ID: <CAGb2v65=xbP+QMTBtVGRg6cEXHhsYda45yKHGrq9QfKcXozHiA@mail.gmail.com>
References: <cover.1415645258.git.rbyshko@gmail.com> <5461D2C1.6020505@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBAX5RCRQKGQEIRTC7HQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <5461D2C1.6020505-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 11, 2014 at 5:11 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Hi,
>
> On 11/10/2014 07:55 PM, Roman Byshko wrote:
>> Hi,
>>
>> There is already support for two USB phys, which are used for
>> USB host controllers on Allwinner SoC aka sunxi.
>>
>> This patch series add support for the USB OTG phy (aka phy0).
>>
>> The code has been tested on Allwinner A20 aka sun7i (Cubietruck).
>>
>> Best regards,
>> Roman Byshko
>
> First of all very cool that you're working on this, I somehow missed
> v1, but I'm very happy to see this.
>
> Second some questions, this series seems to only add support for
> initializing the phy, without adding the necessary magic for
> switching from app to host mode, and without actually hooking up musb,
> I assume you've a follow up series adding musb support, which actually
> uses the phy ?
>
> Also have you coordinated your work with ChenYu? ATM ChenYu is mostly
> working on other stuff, but AFAIk he has been working on musb support
> in the past.

I'm happy that someone has taken over. I was mostly just exploring what
OTG is, not much code actually made it into my working branch, which is
available on github.

ChenYu
