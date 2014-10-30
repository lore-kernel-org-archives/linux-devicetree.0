From: Ohad Ben-Cohen <ohad@wizery.com>
Subject: Re: [RFC 5/7] soc: qcom: Add Shared Memory Driver
Date: Thu, 30 Oct 2014 15:34:12 +0200
Message-ID: <CAK=WgbbP8UQAbFauE80PnF5bj3FTAkB2KfF0kFE8Pt23jQrDhA@mail.gmail.com>
References: <1412037291-16880-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1412037291-16880-6-git-send-email-bjorn.andersson@sonymobile.com>
 <CADMYwHxLtAZZMUGX3jo0URAezqGuho5XB=hQJp8k+acBiENrhg@mail.gmail.com> <20141030003806.GU28611@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20141030003806.GU28611@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Kevin Hilman <khilman@deeprootsystems.com>
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On Thu, Oct 30, 2014 at 2:38 AM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:
> My concern is that merging SMD into rpmsg will still give us two different
> solutions, except that they will be deeply tangled.

I agree.

It's very clear that SMD and rpmsg are different. But fundamentally,
they do exactly the same: new messages are placed in a ring buffer and
then an interrupt is triggered.

If Qualcomm wanted to adopt rpmsg I'm confident there would have been
no technical barriers to do so.

But given that SMD is not going anywhere, I personally hope that you
could at least avoid having two different implementations of it merged
upstream.

Good luck,
Ohad.
