From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 1/3] arm64: allwinner: a64: add ethernet0
 alias for BPi M64 EMAC node
Date: Thu, 10 Aug 2017 15:04:16 +0800
Message-ID: <CAGb2v66bR+kOBR3qwHkLdBCuzPdGpiCrgfXQWr0anYADCD6VmQ@mail.gmail.com>
References: <20170722022852.7868-1-icenowy@aosc.io> <20170722022852.7868-2-icenowy@aosc.io>
 <CAGb2v64DVdFU37V422KfT5zUFN7c6dXyLFBukZegbAuUKZmJBA@mail.gmail.com> <660391B7-FD1B-44BC-98AF-4CA99DCEBB0B@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBCMLWDGAKGQESLBRBOI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <660391B7-FD1B-44BC-98AF-4CA99DCEBB0B-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 10, 2017 at 12:40 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>
>
> =E4=BA=8E 2017=E5=B9=B48=E6=9C=8810=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=88=
11:56:02, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> =E5=86=99=E5=88=B0:
>>Hi,
>>
>>On Sat, Jul 22, 2017 at 10:28 AM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>>wrote:
>>> The Banana Pi M64 board uses the A64 chip's EMAC to provide Ethernet
>>> link.
>>>
>>> Add the ethernet0 alias in the device tree, in order to let U-Boot
>>> generate a MAC address from the chip's SID.
>>>
>>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>>
>>As mentioned in the discussion of the cover letter of this series,
>>we'd really like to move this to fixes for 4.13.
>>
>>I'd like to move forward on this soon. Can I just do a wholesale
>>rewrite of the commit message along the lines of the following
>>example, and move the 3 patches to fixes for 4.13?
>
> Yes.

Done.

ChenYu

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
