From: Paolo Pisati <p.pisati@gmail.com>
Subject: Re: [PATCH v3 0/5] dts patches for qcom tsens support
Date: Thu, 25 Aug 2016 14:21:14 +0200
Message-ID: <20160825122114.GA13196@harukaze>
References: <1471411128-4002-1-git-send-email-rnayak@codeaurora.org>
 <20160817193340.GA18215@hector.attlocal.net>
 <20160824102256.GA14048@harukaze>
 <20160825031328.GI15161@tuxbot>
 <CAPBZ5Qdy2kf+xRC9f7ndE3GdJx0HyCabJWxyaYDbZ50HCj82Bg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPBZ5Qdy2kf+xRC9f7ndE3GdJx0HyCabJWxyaYDbZ50HCj82Bg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Paolo Pisati <p.pisati@gmail.com>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 24, 2016 at 10:21:17PM -0500, Andy Gross wrote:
> 
> Yeah this appears to be the case.  So I guess the response is 'don't
> do that'.  At least don't cat or od the file.  You need to seek and
> read.

True, but the dev file is user readable and any user can trigger it (or
any regression test that rummage among dev files looking for bugs).
-- 
bye,
p.
