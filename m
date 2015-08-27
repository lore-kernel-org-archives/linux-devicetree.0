From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/2] ARM: dts: rockchip: correct regulator PM properties
Date: Thu, 27 Aug 2015 12:30:51 -0700
Message-ID: <CAD=FV=UiCcqCm+W4=ExOps8Npi=mkdVgJ2zgdomOw3YqPhCqug@mail.gmail.com>
References: <1439923455-109818-1-git-send-email-briannorris@chromium.org>
	<20150818224831.GA140911@google.com>
	<20150818232806.GC140911@google.com>
	<10828643.SSUS2EOuvv@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <10828643.SSUS2EOuvv@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Brian Norris <briannorris@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandru M Stan <amstan@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Aug 18, 2015 at 11:19 PM, Heiko Stuebner <heiko@sntech.de> wrote:
> great, just take into account the deep vs. shallow suspend modes :-)

One note: do you think it would make sense to re-implement shallow
suspend as "standby"?  I had a proof of concept doing that in
<https://chromium-review.googlesource.com/#/c/275123/>.  One nice
advantage is that you "magically" get a second set of regulator states
for standby vs "mem".

If I understand correctly, the distinction between "standby" and "mem"
is not too clearly defined, so if we wanted to use it for this it
wouldn't be terrible?

-Doug
