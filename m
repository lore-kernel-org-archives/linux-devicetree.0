From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5 0/7] phy-sun4i-usb: Add OTG and newer SoC support
Date: Mon, 15 Jun 2015 10:57:07 +0530
Message-ID: <557E622B.50401@ti.com>
References: <1434199071-22127-1-git-send-email-hdegoede@redhat.com>
Reply-To: kishon-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBCOOP4VF5IDRBO6E7GVQKGQEKZB36XI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1434199071-22127-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Saturday 13 June 2015 06:07 PM, Hans de Goede wrote:
> Hi Kishon,
>
> Here is a patch series with all my oustanding phy-sun4i-usb changes pending
> for merging into 4.3.
>
> This includes the 5th iteration of the OTG support addition, now with the
> extcon provider support addition split-out into a new patch and ported to
> the extcon API changes which are queued up for 4.2 from :
>
> http://git.kernel.org/cgit/linux/kernel/git/chanwoo/extcon.git/log/?h=extcon-next-v4.2
>
> which already merged in GKH's char-misc branch for 4.2, this means that
> this series now depends on those changes.
>
> Other than that this is a resend of some of the other feature addition
> patches I recently send rebased on top of v5 of the OTG support.
>
> Please merge this series for 4.3.

sure, will queue once -rc1 is tagged.

Thanks
Kishon
