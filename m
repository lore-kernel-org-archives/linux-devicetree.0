From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 0/5] USB: dwc2: Allow wakeup from suspend;
 enable for rk3288-veyron
Date: Thu, 18 Apr 2019 08:54:48 -0700
Message-ID: <CAD=FV=XDLqcdq_BypUYsJHKX+DY0VWvCACYgZiHeG8E3Dbwxcw@mail.gmail.com>
References: <20190418001356.124334-1-dianders@chromium.org>
 <e4b3cd69-1c91-dfbe-bea7-bbca89ca1348@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <e4b3cd69-1c91-dfbe-bea7-bbca89ca1348@synopsys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>, Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Amelie Delaunay <amelie.delaunay@st.com>, "heiko@sntech.de" <heiko@sntech.de>, Kai-Heng Feng <kai.heng.feng@canonical.com>, "zyw@rock-chips.com" <zyw@rock-chips.com>, Stefan Wahren <stefan.wahren@i2se.com>, Nicolas Boichat <drinkcat@chromium.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "mka@chromium.org" <mka@chromium.org>, Alan Stern <stern@rowland.harvard.edu>, Jon Flatley <jflat@chromium.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Elaine Zhang <zhangqing@rock-chips.com>, "amstan@chromium.org" <amstan@chromium.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Randy Li <ayaka@soulik.info>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Greg Kroah-Hartman <gregkh@>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Apr 18, 2019 at 5:41 AM Minas Harutyunyan
<Minas.Harutyunyan@synopsys.com> wrote:
> Did you consider/reviewed patch series from Artur Petrosyan "[PATCH
> 00/14] usb: dwc2: Fix and improve power saving modes" (submitted on
> April 12) which fixing partial power down and hibernation flows for both
> modes: host and device?
> I suspect that this both patch series can be in conflict.

No, I wasn't aware of them.  I'd like to try them out, but it looks
like it's currently impossible because they're not archived anywhere
that I can find.

1. LKML wasn't copied, so I can't find them on lore.kernel.org.  It is
suggested to CC LKML on all patches.

2. The Linux USB patchwork only has the cover letter plus the first 6
patches.  See <https://patchwork.kernel.org/cover/10898333/>

3. Searching my own archives I only see the cover letter plus the
first 6 patches.

Maybe you have some other pointer to how I can retrieve them?  I guess
I could try the first 6 patches without the later 8 but I'd rather get
the whole set...


-Doug
