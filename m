From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 3/5] ARM: dts: sun7i: Add Itead Ibox support
Date: Mon, 21 Dec 2015 22:21:33 +0800
Message-ID: <CAGb2v64qmYbn+v+CY3qW54A9B9gY7F-PszYv_fNeAGJ1CY7HQg@mail.gmail.com>
References: <1450537521-6476-1-git-send-email-codekipper@gmail.com> <1450537521-6476-4-git-send-email-codekipper@gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBBEW4CZQKGQEUHHHPCI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1450537521-6476-4-git-send-email-codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 19, 2015 at 11:05 PM,  <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> The Itead Ibox is a multi board device based on the Allwinner A20 SoC.
> It contains the A20 Itead Core module and a base board for the external
> interfaces.
>
> The core module comes with 4GB NAND and 1GB DDR RAM.
>
> The base board to which the core board is connected provides 3 USB 2.0 Host
> ports, 1 USB 2.0 OTG, 1 uSD slot, 10/100 Ethernet port, HDMI, IR receiver,
> SPDIF and a 32-pin GPIO header. This header expands the features of core
> board by exposing the VGA pins, audio In/Out pins, SATA, SPI, I2C, UARTS,
> USB-OTG and power.
>
> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
