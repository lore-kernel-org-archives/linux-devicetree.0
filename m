From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] arm64: dts: angler: add pstore-ramoops support
Date: Fri, 2 Feb 2018 11:27:53 -0800
Message-ID: <20180202192753.GH12728@builder>
References: <1514446709-19347-1-git-send-email-zhuoweizhang@yahoo.com>
 <20180112023354.GA16005@mini-rhel.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180112023354.GA16005@mini-rhel.redhat.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: zhuoweizhang@yahoo.com
Cc: Jeremy McNicoll <jmcnicol@redhat.com>, jeremymc@redhat.com, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu 11 Jan 18:33 PST 2018, Jeremy McNicoll wrote:

> On Thu, Dec 28, 2017 at 02:38:29AM -0500, zhuoweizhang@yahoo.com wrote:
> > From: Zhuowei Zhang <zhuoweizhang@yahoo.com>
> > 
> > Support pstore-ramoops for retrieving kernel oops and panics after reboot.
> > 
> > The address and configs are taken from the downstream kernel's device tree.
> > 
> > Signed-off-by: Zhuowei Zhang <zhuoweizhang@yahoo.com>

Hi Zhuowei,

This patch looks good, but I'm unable to find the original patch in my
inbox, at lkml.org or at patchwork.kernel.org. Can you please resend the
original patch to linux-arm-msm@vger.kernel.org, with Kees' R-b and
Jeremy's A-b.

Regards,
Bjorn
