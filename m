From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v2 0/7] Allwinner A64 DE2 CCU support with
 dedicated DE2 bus driver
Date: Thu, 28 Jun 2018 04:21:30 +0800
Message-ID: <EB513C5E-4BBD-46B2-9B61-18ED0B14C0E4@aosc.io>
References: <20180622122615.55836-1-icenowy@aosc.io> <20180627183721.jmmsmp3u3mq4drvb@flea>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB3PDZ7MQKGQEHMQ4Y3Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180627183721.jmmsmp3u3mq4drvb@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B46=E6=9C=8828=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=882:=
37:21, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
>On Fri, Jun 22, 2018 at 08:26:08PM +0800, Icenowy Zheng wrote:
>> This patchset tries to implement the Allwinner A64 DE2 as a bus
>driver,
>> in order to model the fact that the SRAM claim controls the access to
>> the whole DE2 memory space.
>>=20
>> PATCH 1 and PATCH 4 are for the CCU part.
>>=20
>> PATCH 2 is the device tree binding for the A64 DE2 bus, and PATCH 3
>> implements the bus driver.
>>=20
>> PATCH 5 adds the DE2 CCU device tree node, with the DE2 bus node.
>>=20
>> PATCH 6 and 7 are HDMI simplefb patches for A64. They're present as a
>> test to this patchset.
>
>Applied all the patches with the minor modifications Chen-Yu and I
>suggested.
>
>The threading was broken on your serie though, so you probably want to
>check your git configuration.

In fact I think I should check my ISP configuration.

The breakage is introduced due to too long delay between aosc.io
mail server and my computer, so I must start to send the
remaining patches again.

>
>Thanks!
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
