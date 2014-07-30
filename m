From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/4] usb: dwc2: add compatible data for rockchip soc
Date: Wed, 30 Jul 2014 08:45:29 -0700
Message-ID: <CAD=FV=UiY3gCFf17PXEMzVJmjYjDV=chA+tx=dA0uPJ46L6J=Q@mail.gmail.com>
References: <1406683873-18194-1-git-send-email-kever.yang@rock-chips.com>
 <1406684102-18313-1-git-send-email-kever.yang@rock-chips.com>
 <CAD=FV=Wqr0C7gj89DVof=gBo4mxvqqz0or7_vkdad==CkzzrPg@mail.gmail.com>
 <53D8934E.9040807@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <53D8934E.9040807@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kever Yang <kever.yang@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Randy Dunlap <rdunlap@infradead.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jianqun Xu <xjq@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Kishon Vijay Abraham I <kishon@ti.com>, lyz <lyz@rock-chips.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Addy Ke <addy.ke@rock-chips.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Matt Porter <mporter@linaro.org>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, wulf <wulf@rock-chips.com>, Sonny Rao <sonnyrao@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Kever,

On Tue, Jul 29, 2014 at 11:40 PM, Kever Yang <kever.yang@rock-chips.com> wrote:
>> Are you sure HNP/SRP is not available?  Do things break if you leave this
>> at 0?
>
> 1. HNP/SRP is not need right now, I didn't see it used in mobile devices.
> 2. If HNP/SRP is enabled, the controller will monitor the otg_vbus about 5V,
>     overcurrent change will happen if vbus not detect after switch to host
>     for a period of time.
>     If not, the controller will monitor b_valid signal about 3V instead of
> 5V vbus,
>     which match the hardware reference design from Rockchip.

OK.  USB is pretty far away from my realm of expertise and I knew even
less about OTG/gadget.  It does sound like there's no fundamental
issue with HNP/SRP on the SoC itself but that we're working around an
issue with the board, though.  If that's true, then perhaps we need
another device tree property?

-Doug
