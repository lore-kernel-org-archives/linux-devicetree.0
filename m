From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH v2 3/3] arm64: allwinner: a64: add proper
 support for the Wi-Fi on BPi M64
Date: Thu, 10 Aug 2017 15:24:08 +0800
Message-ID: <CAGb2v64ME+t8nwhkMFExH=40Q-xKxOPssGXkKx6JSQXkBj5Khw@mail.gmail.com>
References: <20170725124504.40242-1-icenowy@aosc.io> <20170725124504.40242-3-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170725124504.40242-3-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 25, 2017 at 8:45 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> BPi M64 has an AP6212 Wi-Fi/Bluetooth combo module, and the Wi-Fi SDIO
> card is connected to the mmc1 controller.
>
> The pwrseq of the mmc1 (used to reset the card) used to missing, and the
> out-of-band interrupt line of the card is not specified.
>
> Fix these issues for proper Wi-Fi support of BPi M64.
>
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

Applied for 4.14.

Thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
