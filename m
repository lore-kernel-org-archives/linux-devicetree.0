From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: msm: Move msm devicetrees under a Qualcomm dir
Date: Thu, 12 Sep 2013 09:46:31 -0700
Message-ID: <CAOesGMisWLwYKotGDFPW6PyHJs=_+fohTdC08SGjsv2FXaa7Fg@mail.gmail.com>
References: <1379003839-16068-1-git-send-email-galak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1379003839-16068-1-git-send-email-galak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: David Brown <davidb@codeaurora.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 12, 2013 at 9:37 AM, Kumar Gala <galak@codeaurora.org> wrote:
> Use the Qualcomm vendor prefix (qcom) as the directory name for
> Qualcomm MSM devicetrees going forward.
>
> Signed-off-by: Kumar Gala <galak@codeaurora.org>

Let's not move just one platform like this. If we are to do this, we
should move everything, and that will be really painful and needs to
be done in a controlled manner, probably scripted and right before a
-rc1 or such.


-Olof
