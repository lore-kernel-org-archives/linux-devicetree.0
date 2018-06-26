From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: allwinner: a64: allow laptops to
 wake up from lid
Date: Tue, 26 Jun 2018 11:17:30 +0800
Message-ID: <CAGb2v65HJKm3UhA1bPZxg7+KL_FAHO+LDx4ijzXasS-K0UGUXQ@mail.gmail.com>
References: <20180622160631.8578-1-icenowy@aosc.io> <20180622160631.8578-2-icenowy@aosc.io>
 <20180625170913.p335obgr3rfa4skt@flea>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBYPAY3MQKGQE5M5N22Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180625170913.p335obgr3rfa4skt@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 26, 2018 at 1:09 AM, Maxime Ripard
<maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> On Sat, Jun 23, 2018 at 12:06:31AM +0800, Icenowy Zheng wrote:
>> Currently all ARM kernels will have s2idle enabled if CONFIG_SUSPEND is
>> present. In this case if the lid is closed, systemd-logind will enter
>> s2idle mode by default; however there's no possible wakeup source
>> defined, so the system will enter a forever idle.
>>
>> Add the lid itself as a wakeup source, thus the system can wakeup when
>> the lid is opened.
>>
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>
> Applied both, thanks!
> Maxime

Icenowy, could you also look into having the power button as a wakeup source?
It has no device node, so you might have to look at how to implement it in
the driver.

ChenYu
