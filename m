From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 4/4] ARM: sun8i: dt: Add Ippo-q8h v5 support
Date: Tue, 24 Jun 2014 09:28:36 +0800
Message-ID: <CAGb2v67_6v-6a69eia_7eq+bVNNnYf6ngdF8GDJeeyGub-fiDg@mail.gmail.com>
References: <1403275973-24259-1-git-send-email-wens@csie.org>
 <1403275973-24259-5-git-send-email-wens@csie.org> <20140623185631.GK19730@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBWFIUOOQKGQE4P3M4DA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20140623185631.GK19730@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 24, 2014 at 2:56 AM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Fri, Jun 20, 2014 at 10:52:53PM +0800, Chen-Yu Tsai wrote:
>> The Ippo-q8h is a tablet circuit board commonly found in cheap Android
>> tablets with A23 SoCs. There are at least 2 versions of the board, with
>> different peripherals, such as WiFi chips.
>>
>> Common features among these tablets include 512 MB DRAM, NAND, MMC, LCD,
>> capacitive touchscreen, accelerometer, 1 or 2 camera sensors, USB OTG,
>> microphone and speaker.
>>
>> v5 of these board designs has a ESP8089 WiFi chip (not supported)
>> connected to mmc1. This patch adds very basic support.
>>
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>
> Fixed the whitespace warning and applied.

Trailing newline, got it.

Thanks!
ChenYu
