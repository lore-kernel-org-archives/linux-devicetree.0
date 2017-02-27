From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 1/6] arm64: dts: Add symlinks for cros-ec-keyboard and cros-ec-sbs
Date: Mon, 27 Feb 2017 19:20:48 +0100
Message-ID: <1529949.5djtX72aeJ@phil>
References: <20170210010521.78872-1-briannorris@chromium.org> <20170210010521.78872-2-briannorris@chromium.org> <CAOesGMiim2WFfEAg-bJmWTwWn69=V_GuEg6AxsxPYMyzd3KFUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOesGMiim2WFfEAg-bJmWTwWn69=V_GuEg6AxsxPYMyzd3KFUw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Brian Norris <briannorris@chromium.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Chris Zhong <zyw@rock-chips.com>, Stephen Barber <smbarber@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Caesar Wang <wxt@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Hi Olof,

Am Dienstag, 21. Februar 2017, 15:47:31 CET schrieb Olof Johansson:
> On Thu, Feb 9, 2017 at 5:05 PM, Brian Norris <briannorris@chromium.org> wrote:
> > From: Douglas Anderson <dianders@chromium.org>
> > 
> > We'd like to be able to use the cros-ec-keyboard.dtsi and
> > cros-ec-sbs.dtsi snippets for arm64 devices.  Currently those files live
> > in the arm/boot/dts directory.
> > 
> > Let's follow the convention set by commit 8ee57b8182c4 ("ARM64: dts:
> > vexpress: Use a symlink to vexpress-v2m-rs1.dtsi from arch=arm") and use
> > a symlink.  Note that in this case we put the files in a new
> > "include/common" directory since these snippets may need to be
> > referenced by dts files in many different subdirectories.
> 
> I'd rather have something like this:
> 
> https://marc.info/?m=147547436324674&w=2
> 
> Instead of having everybody move things over. I.e. make it easy to
> refer to the arm version from arm64 instead of creating a "common"
> layer inbetween.

just so it gets noticed, I've done and tested [0], which hopefully should
implement your suggestions above.

If that looks ok, how do you want that picked up? Should I just include
them in my regular rockchip branches or do you to pick them into some
immutable branch, if other surprise-users turn up in time for 4.12?


Thanks
Heiko


[0] http://lists.infradead.org/pipermail/linux-rockchip/2017-February/014226.html
