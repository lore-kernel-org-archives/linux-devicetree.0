From: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH 2/3] usb: roles: Add usb role switch notifier.
Date: Thu, 3 Oct 2019 13:37:04 -0700
Message-ID: <CALAqxLVcQ7yZuJCUEqGmvqcz5u0Gd=xJzqLbmiXKR+LJrOhvMQ@mail.gmail.com>
References: <20191002231617.3670-1-john.stultz@linaro.org> <20191002231617.3670-3-john.stultz@linaro.org>
 <2e369349-41f6-bd15-2829-fa886f209b39@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2e369349-41f6-bd15-2829-fa886f209b39@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: lkml <linux-kernel@vger.kernel.org>, Yu Chen <chenyu56@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Jun Li <lijun.kernel@gmail.com>, Valentin Schneider <valentin.schneider@arm.com>, Linux USB List <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 3, 2019 at 2:25 AM Hans de Goede <hdegoede@redhat.com> wrote:
> On 03-10-2019 01:16, John Stultz wrote:
> > From: Yu Chen <chenyu56@huawei.com>
> >
> > This patch adds notifier for drivers want to be informed of the usb role
> > switch.
>
> I do not see any patches in this series actually using this new
> notifier.
>
> Maybe it is best to drop this patch until we actually have in-kernel
> users of this new API show up ?

Fair point. I'm sort of taking a larger patchset and trying to break
it up into more easily reviewable chunks, but I guess here I mis-cut.

The user is the hikey960 gpio hub driver here:
  https://git.linaro.org/people/john.stultz/android-dev.git/commit/?id=b06158a2d3eb00c914f12c76c93695e92d9af00f

I'll resubmit again later with that patch included.

thanks
-john
