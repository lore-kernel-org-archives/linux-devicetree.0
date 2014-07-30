From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/4] Documentation: dt-bindings: add dt binding info for
 Rockchip dwc2
Date: Tue, 29 Jul 2014 20:54:46 -0700
Message-ID: <CAD=FV=UaRb+UtZNJMZQik9oe_2r-9_b-t9PTQFDb6zkHwwAqFw@mail.gmail.com>
References: <1406683873-18194-1-git-send-email-kever.yang@rock-chips.com>
 <1406683873-18194-2-git-send-email-kever.yang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1406683873-18194-2-git-send-email-kever.yang@rock-chips.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Randy Dunlap <rdunlap@infradead.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jianqun Xu <xjq@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Kishon Vijay Abraham I <kishon@ti.com>, lyz@rock-chips.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, addy.ke@rock-chips.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, mporter@linaro.org, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, wulf@rock-chips.com, Sonny Rao <sonnyrao@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-k>
List-Id: devicetree@vger.kernel.org

Kever,

On Tue, Jul 29, 2014 at 6:31 PM, Kever Yang <kever.yang@rock-chips.com> wrote:
> This add necessary dwc2 binding documentation for Rockchip socs:
> rk3066, rk3188 and rk3288
>
> add dr_mode as optional properties.
>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.txt |    5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Doug Anderson <dianders@chromium.org>
