From: Jeremy McNicoll <jmcnicol@redhat.com>
Subject: Re: [RFC V4 PATCH 6/6] arm64: configs: enable configs for
 msm899(2/4) basic support
Date: Tue, 25 Oct 2016 01:07:06 -0700
Message-ID: <20161025080706.GD21964@mini-rhel.redhat.com>
References: <1477048273-32451-1-git-send-email-jeremymc@redhat.com>
 <1477048273-32451-7-git-send-email-jeremymc@redhat.com>
 <20161021182713.GY7509@tuxbot>
 <ba4e8128-40c1-e2ff-8eda-130cbb62e71e@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ba4e8128-40c1-e2ff-8eda-130cbb62e71e@redhat.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Jeremy McNicoll <jeremymc@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, mark.rutland@arm.com, michael.scott@linaro.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 21, 2016 at 03:32:08PM -0700, Jeremy McNicoll wrote:
> On 2016-10-21 11:27 AM, Bjorn Andersson wrote:
> >On Fri 21 Oct 04:11 PDT 2016, Jeremy McNicoll wrote:
> >
> >>From: Jeremy McNicoll <jmcnicol@redhat.com>
> >>
> >>Given the mimimal hardware support for msm899(2/4) currently.
> >>A few config options are needed to allow for continued
> >>development and booting.
> >>
> >>The following are needed for continued development and
> >>booting:
> >>  -8x74 pinctrl for serial support
> >
> >I don't have the datasheet for 899[24], but I don't think this is a good
> >idea. We need a 899[24] pinctrl driver for this.
> >
> 
> Based on the downstream code, for serial it was sufficient.
> 
> There is a 8994 pinctrl driver on its away.
>

Here is a link to the 8994 pinctrl needed for 899(2/4).

 https://patches.linaro.org/patch/78750/

-jeremy
