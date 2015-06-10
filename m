From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH 2/2] drivercore: Fix unregistration path of platform devices
Date: Wed, 10 Jun 2015 07:38:32 -0700
Message-ID: <CAMAWPa-bGwVCnmv=H=8Zo-NCw-nOFBj3-XcVvb-0m0sNYtPO7g@mail.gmail.com>
References: <1433686811-12303-1-git-send-email-grant.likely@linaro.org>
	<1433686811-12303-3-git-send-email-grant.likely@linaro.org>
	<CAPybu_30jTDuwEW_WTGuu6pWwv86p6OqV0eRE1GbCwUVtBm7KA@mail.gmail.com>
	<20150608184713.446B7C406AA@trevor.secretlab.ca>
	<CAPybu_0FfD9dv55SLmy7905yMCV6Kqrr-v2aPUCx6sSikrF7gQ@mail.gmail.com>
	<20150609110044.61031C40580@trevor.secretlab.ca>
	<CAMAWPa_CURGm5YTc0OgBD_T3fwaBDskfUKEn+awxW8P6oQYceA@mail.gmail.com>
	<CAPybu_24X0zZJv6D9i4YM_r7azdnjYrRH=V+p_ong2cFKNrF1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPybu_24X0zZJv6D9i4YM_r7azdnjYrRH=V+p_ong2cFKNrF1w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Kevin Hilman <khilman@kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robherring2@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tyler Baker <tyler.baker@linaro.org>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 10, 2015 at 12:11 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Hi Kevin, Hi Grant, Hi Greg
>
> Although I do not agree with everything exposed by Grant, I understand
> his concerns as a Maintainer with future support of the code. Also
> there is no point in wasting more energy in discussing than in coding.
>
> So, in order to make everybody life a bit easier I think a good plan here is:
>
> 1) revert the whole serie :(

IMO, the should be done ASAP so these failures are not masking other
problems.   So Greg doesn't have to wade through this whole thread to
figure out which patches to revert, I'd recommend sending him the list
of commits to revert.

At this stage of the cycle (merge window opening soon, maintainers
trying to stabilize their stuff for Linus) we want to see linux-next
approaching some level of stability.

Kevin
