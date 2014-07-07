From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH V4 00/10] drm: exynos: few patches to enhance bridge chip support
Date: Mon, 7 Jul 2014 13:27:20 -0700
Message-ID: <CAD=FV=VwJM9ReuZAEPc+1hv_GaF5r497bFDZR59ukE++sRYaNw@mail.gmail.com>
References: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
	<53B4E7D6.6000204@suse.de>
	<CAEC9eQPee1CYQa01V93pTwwNbAZ=h5wVznQ-_PGoWmxSZV3Tbg@mail.gmail.com>
	<53B6A6F0.1070108@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <53B6A6F0.1070108@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Ajay kumar <ajaynumb@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, InKi Dae <inki.dae@samsung.com>, Sean Paul <seanpaul@google.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: devicetree@vger.kernel.org

Andreas,

On Fri, Jul 4, 2014 at 6:06 AM, Andreas F=C3=A4rber <afaerber@suse.de> =
wrote:
>> Doug can help you in adding changes required for tps65090.
>
> Hm, Doug had pointed out an issue with tps65090 in my v1, so I droppe=
d
> it: https://patchwork.kernel.org/patch/4397321/

tps65090 on Spring is nowhere near obvious due to the EC commands that
were available during the Spring timeframe.  See
http://crbug.com/391797 for some details.

-Doug
