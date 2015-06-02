From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 0/6] Introduce Allwinner A33 support
Date: Tue, 2 Jun 2015 15:43:25 +0800
Message-ID: <CAGb2v64Nm8jp+xEoUyPKV7UuhUXW3HS87hbp68MZAdrHR4uNgw@mail.gmail.com>
References: <1432997706-20172-1-git-send-email-hdegoede@redhat.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBON5WWVQKGQEZYIKYRA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1432997706-20172-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, May 30, 2015 at 10:55 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Hi Maxime,
>
> Here is a cleaned up series of Vishnu Patekar's A33 support. This should
> address all concerns raised during the posting of v1.
>
> I've tested that all peripherals declared in the shared sun8i-a23-a33.dtsi
> work on the A33 too, with the exception of the dma-controller. For the
> dma-controller I've compared the A23 vs A33 manual and the entire dma-
> controller description including the register description is bit for bit
> identical.
>
> This has been tested on a 7" Ippo Q8H v1.2 A23 tablet, a 7" Ippo Q8H v1.2
> A33 tablet and a 10" GA10H A33 tablet. The dts for the 10" tablet still
> needs some work wrt the lradc button voltages so that is not included
> in this set.

Whole series is

Tested-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

on my Sinlinx SinA33 dev board. I'll send patches for it later.
